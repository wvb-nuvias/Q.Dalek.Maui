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
        
        string vosk_model = "";
        string wakeword_path = "";
        string wakeword_model = "";
        string wakeword_params = "";
        string tempfile = "";
        
        public MainPage()
        {
            InitializeComponent();

            SetPathsToOS();
            
        }

        private void SetPathsToOS()
        {
            wakeword_params = "porcupine_params_nl.pv";

            if (isWindows)
            {
                vosk_model = "C:\\3D\\Dalek\\recognition\\vosk-model-small-en-us-0.15";
                wakeword_path = "C:\\3D\\Dalek\\wakeword\\";
                wakeword_model = "daal-lek_nl_windows_v3_0_0.ppn";                
                tempfile = "C:\\3D\\Dalek\\recognition\\test.wav";
            } else if (isLinux) {
                vosk_model = "/mnt/data/Dalek/vosk-model-small-en-us-0.15";
                wakeword_path = "/mnt/data/Dalek/";
                wakeword_model = "daal-lek_nl_raspberry-pi_v3_0_0.ppn";
                tempfile = "/mnt/data/Dalek/recognition.wav";
            }
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

        private void OnTestClicked(object sender, EventArgs e)
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
                    //TODO exit when detected

                    while (true)
                    {
                        int samplesAvailable = ALC.GetAvailableSamples(captureDevice);
                        if (samplesAvailable > porcupine.FrameLength)
                        {
                            ALC.CaptureSamples(captureDevice, ref framebuffer[0], porcupine.FrameLength);
                            int keywordIndex = porcupine.Process(framebuffer);
                            if (keywordIndex >= 0)
                            {
                                //wakeword is detected
                                Debug.WriteLine("I hear you...");
                            }
                        }
                    }
                }
            });
        }

        private void TestBtn2_Clicked(object sender, EventArgs e)
        {
            MainPage.SendUDPPacket(head,"lights");
        }

        private void TestBtn3_Clicked(object sender, EventArgs e)
        {
            //this is working fine
            //TODO record wav file with opentk when listening, untill long pause detection
            //TODO re-start listener after 
            //TODO if the pause between commands is too long, then start listening for wake word again
            //TODO it would have to listen to everyghing, als long pause is not detected

            VoskRecognizer rec = new(new Model(vosk_model), 16000.0f);
            using (Stream source = File.OpenRead(tempfile))
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
        }

        private void TestBtn4_Clicked(object sender, EventArgs e)
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

        private void TestBtn5_Clicked(object sender, EventArgs e)
        {
            //TODO this flickers on wav output, so when Dalek responds, we can use this function to make the lights flicker
            using Stream source = File.OpenRead(tempfile);
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

        private void TestBtn6_Clicked(object sender, EventArgs e)
        {
            //close, but no cigar, cannot seem to play audio whilst doing the dalek flickering lights

            //DalekStream (waveStream)
            DalekStream waveStream = new NAudio.Wave.WaveFileReader(tempfile);
            
            //DalekStream dalekStream = new NAudio.Wave.WaveFileReader(tempfile);
            WaveChannel32 volumeStream = new WaveChannel32(waveStream);

            WaveOutEvent player = new WaveOutEvent();

            player.Init(volumeStream);

            player.Play();
            player.Stop();
        }

    }

}
