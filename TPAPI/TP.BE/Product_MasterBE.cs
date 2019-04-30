using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE
{
    public class Product_MasterBE
    {
        public int product_id { get; set; }
        public int typproduct_id { get; set; }
        public string product_name { get; set; }
        public Nullable<bool> flg_perishable { get; set; }
    }
}
