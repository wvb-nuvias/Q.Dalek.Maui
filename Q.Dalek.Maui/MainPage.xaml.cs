using Pv;
using OpenTK.Audio.OpenAL;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.InteropServices;
using Vosk;
using System.Net.Sockets;
using System.Net;
using System.Text;
using Org.BouncyCastle.Math.EC.Multiplier;
using NAudio.Wave;
using System.Text.Json;
using Q.Dalek.Maui.Classes;

namespace Q.Dalek.Maui
{
    public partial class MainPage : ContentPage
    {        
        private readonly bool isWindows = RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
        private readonly bool isLinux = RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
        private readonly string pv_access_key = "ShdtJT+O41vETv5EkR+eIRtirZjPe6ittLRTUVKHdKrg9kI1XmzlnA==";
        private readonly IPAddress head = IPAddress.Parse("10.42.0.201");
        private readonly IPAddress body = IPAddress.Parse("10.42.0.202");

        private string vosk_model = "";
        private string wakeword_path = "";
        private string recognition_path = "";
        private string wakeword_model = "";
        private string wakeword_params = "";
        private string tempWavefile = "";
        private string dalek_path = "";

        private bool isListeningForWakeword = true;        
        private bool isRecording = false;
        private int silenceTimeoutMs = 3000;
        private Timer silenceTimer = null;

        public MainPage()
        {
            InitializeComponent();

            SetPathsToOS();
            StartListening();
        }

        private void SetPathsToOS()
        {
            wakeword_params = "porcupine_params_nl.pv";

            if (isWindows)
            {
                dalek_path = "C:\\3D\\Dalek\\";
                recognition_path = dalek_path + "recognition\\";                
                wakeword_path = dalek_path + "wakeword\\";
                wakeword_model = "daal-lek_nl_windows_v3_0_0.ppn";                
            } else if (isLinux) {
                dalek_path = "/mnt/data/Dalek/";
                recognition_path = dalek_path + "recognition/";
                wakeword_path = dalek_path + "wakeword/";                
                wakeword_model = "daal-lek_nl_raspberry-pi_v3_0_0.ppn";                                
            }

            vosk_model = recognition_path + "vosk - model-small-en-us-0.15";
            tempWavefile = recognition_path + "recognition.wav";
        }
                
        private static ArduinoMessage? SendUDPPacket(IPAddress target, string command)
        {
            UdpClient udpClient = new(4210);            
            IPEndPoint targetEndpoint;
            string? returnData = null;
            
            try
            {
                udpClient.Connect(target, 4210);
                Byte[] sendBytes = Encoding.ASCII.GetBytes(command);
                udpClient.Send(sendBytes, sendBytes.Length);
                targetEndpoint = new IPEndPoint(IPAddress.Any, 0);
                Byte[] receiveBytes = udpClient.Receive(ref targetEndpoint);
                string rData = Encoding.ASCII.GetString(receiveBytes);

                returnData = rData.ToString();

                udpClient.Close();
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.ToString());                
            }

            if (returnData != null) {
                return JsonSerializer.Deserialize<ArduinoMessage>(returnData);
            }
            return null;
        }

        private void StartListening()
        {
            List<string> list = [wakeword_path + wakeword_model];
            List<float> sensitivities = [(float)0.5];
            string modelPath = wakeword_path + wakeword_params;

            Task.Factory.StartNew(() =>
            {
                using Porcupine porcupine = Porcupine.FromKeywordPaths(pv_access_key, list, modelPath);
                short[] framebuffer = new short[porcupine.FrameLength];
                ALCaptureDevice captureDevice = ALC.CaptureOpenDevice(null, porcupine.SampleRate, ALFormat.Mono16, porcupine.FrameLength * 2);
                {
                    ALC.CaptureStart(captureDevice);
                    
                    while (isListeningForWakeword)
                    {
                        int samplesAvailable = ALC.GetAvailableSamples(captureDevice);
                        if (samplesAvailable > porcupine.FrameLength)
                        {
                            ALC.CaptureSamples(captureDevice, ref framebuffer[0], porcupine.FrameLength);
                            int keywordIndex = porcupine.Process(framebuffer);
                            if (keywordIndex >= 0)
                            {
                                isListeningForWakeword = false;                                
                            }
                        }
                    }

                    ALC.CaptureStop(captureDevice);
                }
            });

            RecordVoiceUntillStopped();
        }

        private void RecordVoiceUntillStopped()
        {
            List<string> list = [wakeword_path + wakeword_model];
            List<float> sensitivities = [(float)0.5];
            string modelPath = wakeword_path + wakeword_params;

            //TODO set samplerate for the temp wave file, and the buffer, and the length
            //TODO delete the existing wave file

            Task.Factory.StartNew(() =>
            {
                using Porcupine porcupine = Porcupine.FromKeywordPaths(pv_access_key, list, modelPath);
                short[] framebuffer = new short[porcupine.FrameLength];
                ALCaptureDevice captureDevice = ALC.CaptureOpenDevice(null, porcupine.SampleRate, ALFormat.Mono16, porcupine.FrameLength * 2);
                {
                    ALC.CaptureStart(captureDevice);
                    
                    while (isRecording)
                    {
                        int samplesAvailable = ALC.GetAvailableSamples(captureDevice);
                        if (samplesAvailable > porcupine.FrameLength)
                        {
                            ALC.CaptureSamples(captureDevice, ref framebuffer[0], porcupine.FrameLength);
                            //TODO check if the buffer is empty?
                            //TODO save the sample to temporary file
                            //check if ther is a pause (time the start of the capture and end)
                            //and if more then one sample is empty (need check for this)
                            //else stop recording
                            isRecording = false;
                        }
                    }

                    ALC.CaptureStop(captureDevice);
                }
            });

            InterpretRecordedWaveFile();
        }

        private void InterpretRecordedWaveFile() {
            VoskRecognizer rec = new(new Model(vosk_model), 16000.0f);
            using (Stream source = File.OpenRead(tempWavefile))
            {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = source.Read(buffer, 0, buffer.Length)) > 0)
                {
                    if (rec.AcceptWaveform(buffer, bytesRead))
                    {
                        Debug.WriteLine(rec.Result());
                    }
                    else
                    {
                        Debug.WriteLine(rec.PartialResult());
                    }
                }
            }
            Debug.WriteLine(rec.FinalResult());

            //TODO check for fixed database messages, if so act on it here, before asking AI
            //TODO ask a free AI for a response? determine the context?
            //TODO save the interpreted response to the same database, with context, so same response doesn't have to be looked up
            //TODO database table with same meaning words etc... so text is not always the same, and it auto learns
            //convert the response to wav file answer and do dalekspeak (flciker on the wav file)
            //TODO ask for more ? then go to recording again, if yes, or new question continu the loop
            //TODO is no, then go trough listening method again
        }


        private void OnBtnTestWakeWordClicked(object sender, EventArgs e)
        {                        
            StartListening();
        }

        private void OnBtnTestUDPPacket_Clicked(object sender, EventArgs e)
        {
            SendUDPPacket(head,"lights");
        }

        private void OnBtnTestVoskRecognition_Clicked(object sender, EventArgs e)
        {
            InterpretRecordedWaveFile();
        }

        private void OnBtnTestMicrophoneFlicker_Clicked(object sender, EventArgs e)
        {
            var waveIn = new NAudio.Wave.WaveInEvent
            {
                DeviceNumber = 0, // customize this to select your microphone device
                WaveFormat = new NAudio.Wave.WaveFormat(rate: 44100, bits: 16, channels: 1),
                BufferMilliseconds = 15
            };
            waveIn.DataAvailable += WaveIn_DataAvailable; ;
            waveIn.StartRecording();
        }

        private void WaveIn_DataAvailable(object? sender, NAudio.Wave.WaveInEventArgs e)
        {
            Int16[] values = new Int16[e.Buffer.Length / 2];
            Buffer.BlockCopy(e.Buffer, 0, values, 0, e.Buffer.Length);

            // determine the highest value as a fraction of the maximum possible value
            float fraction = (float)values.Max() / 32768;
            if (fraction > 0.50)
            {
                SendUDPPacket(head,"lightson");
            }
            else
            {
                SendUDPPacket(head,"lightsoff");
            }
        }

        private void OnBtnTestWavefileFlicker_Clicked(object sender, EventArgs e)
        {
            //TODO this flickers on wav output, so when Dalek responds, we can use this function to make the lights flicker
            using Stream source = File.OpenRead(tempWavefile);
            byte[] buffer = new byte[3096];
            int bytesRead;
            int val;
            while ((bytesRead = source.Read(buffer, 0, buffer.Length)) > 0)
            {
                val=buffer.Take(bytesRead).Select(x => x * 2048).First();
                if (val > 150000)
                {
                    SendUDPPacket(head,"lightson");
                } else
                {
                    SendUDPPacket(head,"lightsoff");
                }
                Thread.Sleep(75);
            }
            SendUDPPacket(head,"lightsoff");
        }

        private void TestBtn5_Clicked(object sender, EventArgs e)
        {
            //close, but no cigar, cannot seem to play audio whilst doing the dalek flickering lights

            //DalekStream (waveStream)
            DalekStream waveStream = new WaveFileReader(tempWavefile);
            
            //DalekStream dalekStream = new NAudio.Wave.WaveFileReader(tempfile);
            WaveChannel32 volumeStream = new(waveStream);

            WaveOutEvent player = new();

            player.Init(volumeStream);

            player.Play();
            player.Stop();
        }

    }

}
