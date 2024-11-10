using NAudio.Wave;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Q.Dalek.Maui
{
    partial class DalekStream(WaveStream sourceStream) : WaveStream
    {
        WaveStream sourceStream = sourceStream;
        private readonly IPAddress head = IPAddress.Parse("10.42.0.201");

        public override WaveFormat WaveFormat
        {
            get { return sourceStream.WaveFormat; }
        }

        public override long Length 
        {
            get { return sourceStream.Length; }
        }

        public override long Position 
        {
            get { return sourceStream.Position; }
            set { sourceStream.Position = value; }
        }
                
        public override int Read(byte[] buffer, int offset, int count)
        {
            int totalBytesRead = 0;
            int val;

            while (totalBytesRead < count)
            {
                int bytesRead = sourceStream.Read(buffer, offset + totalBytesRead, count - totalBytesRead);
                    //Debug.WriteLine(bytesRead);

                if (bytesRead > 0)
                {
                    val = BitConverter.ToInt16(buffer, 0) + 10000;
                    Debug.WriteLine(val);

                    if (val > 9500)
                    {
                        SendUDPPacket("lightson");
                    }
                    else
                    {
                        SendUDPPacket("lightsoff");
                    }

                    totalBytesRead += bytesRead;                                    
                } else
                {
                    SendUDPPacket("lightsoff");
                    break;
                }
            }
            return totalBytesRead;
        }

        private void SendUDPPacket(string command)
        {
            Socket s = new(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
            byte[] sendbuf = Encoding.ASCII.GetBytes(command);
            IPEndPoint ep = new(head, 4210);

            s.SendTo(sendbuf, ep);

        }

        public static implicit operator DalekStream(WaveFileReader v)
        {
            DalekStream tmp = new(v);
                       
            return tmp;
        }
    }
}
