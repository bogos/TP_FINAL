using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE
{
    public class Product_TrackingBE
    {
        public int ptracking_id { get; set; }
        public int? product_id { get; set; }
        public Nullable<int> units { get; set; }
        public Nullable<decimal> metros_cub { get; set; }
        public Nullable<decimal> liters { get; set; }
    }
}
