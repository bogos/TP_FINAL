using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE
{
    public class Carrier_MasterBE
    {
        public int carrier_id { get; set; }
        public string name { get; set; }
        public Nullable<int> contract_no { get; set; }
        public string dni { get; set; }
        public string address { get; set; }
        public string email { get; set; }
    }
}
