using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE.Request
{
    public class BCRequest
    {
        public int bc_id { get; set; }
        public string contract_address { get; set; }
        public string trx_hash { get; set; }
    }
}
