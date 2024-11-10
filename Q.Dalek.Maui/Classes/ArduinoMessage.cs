using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Q.Dalek.Maui.Classes
{
    public class ArduinoMessage
    {        
        private string? _Action;
        private string? _Source;
        private string? _Command;
        private string? _Message;
        public string? Action { get => _Action; set => _Action = value; }
        public string? Source { get => _Source; set => _Source = value; }
        public string? Command { get => _Command; set => _Command = value; }
        public string? Message { get => _Message; set => _Message = value; }

        public ArduinoMessage() { 
        
        }

        public ArduinoMessage(string action, string source, string command, string message)
        {
            Action = action;
            Source = source;
            Command = command;
            Message = message;
        }        
    }
}
