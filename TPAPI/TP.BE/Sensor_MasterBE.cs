using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE
{
    public class Sensor_MasterBE
    {
        public string id_contrato { get; set; }
        public string codigoseguimiento { get; set; }
        public Nullable<decimal> temperatura { get; set; }
        public Nullable<decimal> humidity { get; set; }
        public Nullable<System.DateTime> time { get; set; }
        public int id_message { get; set; }
        public string id_sensor { get; set; }
    }
}
