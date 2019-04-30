using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE
{
    public class User_MasterBE
    {
        public int user_id { get; set; }
        public string user_name { get; set; }
        public string password { get; set; }
        public Nullable<int> contract_no { get; set; }
        public string user_type { get; set; }
        public string ruc { get; set; }
        public string razon_social { get; set; }
        public string location { get; set; }
        public string address { get; set; }
    }
}
