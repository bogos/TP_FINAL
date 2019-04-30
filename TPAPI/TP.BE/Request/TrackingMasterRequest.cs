using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.BE.Request
{
    public class TrackingMasterRequest
    {
        public string tracking_id { get; set; }
        public Nullable<System.DateTime> expedition_date { get; set; }
        public Nullable<int> city_id { get; set; }
        public string address { get; set; }
        public string destinity_address { get; set; }
        public Nullable<int> ptracking_id { get; set; }
        public Nullable<int> weight { get; set; }
        public Nullable<int> delivery_term { get; set; }
        public string state { get; set; }
        public Nullable<decimal> value { get; set; }
        public string observations { get; set; }
        public Nullable<System.DateTime> start_time { get; set; }
        public Nullable<System.DateTime> end_time { get; set; }
        public Nullable<int> location_id { get; set; }
        public string id_contrato { get; set; }
        public Nullable<int> carrier_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public string id_sensor { get; set; }
        public Nullable<int> product_id { get; set; }
        public string product_name { get; set; }
        public Nullable<int> product_unit { get; set; }
    }
}
