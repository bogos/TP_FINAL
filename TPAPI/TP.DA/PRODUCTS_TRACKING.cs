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
    
    public partial class PRODUCTS_TRACKING
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PRODUCTS_TRACKING()
        {
            this.TRACKING_TABLE = new HashSet<TRACKING_TABLE>();
        }
    
        public int ptracking_id { get; set; }
        public Nullable<int> tracking_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> units { get; set; }
        public Nullable<decimal> metros_cub { get; set; }
        public Nullable<decimal> liters { get; set; }
    
        public virtual PRODUCT_MASTER PRODUCT_MASTER { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TRACKING_TABLE> TRACKING_TABLE { get; set; }
    }
}
