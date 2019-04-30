//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TP.DA
{
    using System;
    using System.Collections.Generic;
    
    public partial class TRACKING_TABLE
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
    
        public virtual CARRIER_MASTER CARRIER_MASTER { get; set; }
        public virtual CITY_MASTER CITY_MASTER { get; set; }
        public virtual PRODUCTS_TRACKING PRODUCTS_TRACKING { get; set; }
        public virtual USER_MASTER USER_MASTER { get; set; }
    }
}
