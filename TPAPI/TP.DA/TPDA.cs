using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP.DA
{
    public class TPDA
    {
        //------Registrar Tracking-----
        public TRACKING_TABLE AddTracking(TRACKING_TABLE tracking)
        {
            using (var db = new tpEntities())
            {
                tracking.expedition_date = DateTime.Now;

                var a = db.TRACKING_TABLE.Where(p => p.user_id == tracking.user_id &&
                                            p.carrier_id == tracking.carrier_id &&
                                            p.city_id == tracking.city_id &&
                                            p.ptracking_id == tracking.ptracking_id).ToList();
                if (a != null)
                {
                    db.TRACKING_TABLE.Add(tracking);
                    db.SaveChanges();
                }
                else
                {
                    Console.Write("Faltan parámetros!");
                }
                return tracking;
            }
        }

        //------Actualizar Tracking --Buscando
        public bool UpdateTracking(TRACKING_TABLE tracking)
        {
            bool status = false;
            using (var db = new tpEntities())
            {
                tracking.expedition_date = DateTime.Now;
                var a = db.TRACKING_TABLE.Where(p => p.tracking_id == tracking.tracking_id).FirstOrDefault();
                if(a!=null)
                {
                    a.id_contrato = tracking.id_contrato;
                    a.tracking_id = tracking.tracking_id;
                    a.carrier_id = tracking.carrier_id;
                    a.city_id = tracking.city_id;
                    a.location_id = tracking.location_id;
                    a.ptracking_id = tracking.ptracking_id;
                    a.user_id = tracking.user_id;
                    a.address = tracking.address;
                    a.delivery_term = tracking.delivery_term;
                    a.destinity_address = tracking.destinity_address;
                    a.start_time = tracking.start_time;
                    a.end_time = tracking.end_time;
                    a.observations = tracking.observations;
                    a.state = tracking.state;
                    a.value = tracking.value;
                    a.weight = tracking.weight;
                    a.id_sensor = tracking.id_sensor;
                    a.product_id = tracking.product_id;
                    a.product_name = tracking.product_name;
                    a.product_unit = tracking.product_unit;

                    db.SaveChanges();
                    return status = true;
                }
                return status;
            }
        }

        //------Eliminar Tracking-----
        public bool DeleteTracking(string id)
        {
            bool status;
            try
            {
                using (var db = new tpEntities())
                {
                    TRACKING_TABLE tracking = db.TRACKING_TABLE.Where(p => p.tracking_id == id).FirstOrDefault();
                    db.TRACKING_TABLE.Remove(tracking);
                    db.SaveChanges();

                }
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

        //-----Listar TRACKING_MASTER
        public List<TRACKING_TABLE> ListCarga()
        {
            using (var db = new tpEntities())
            {
                return db.TRACKING_TABLE.ToList();
            }
        }

        //-----Listar SENSOR_MASTER
        public List<SENSOR_MASTER> ListSensorMaster()
        {
            using (var db = new tpEntities())
            {
                return db.SENSOR_MASTER.ToList();
            }
        }

        //-----Listar CITY_MASTER
        public List<CITY_MASTER> ListCityMaster()
        {
            using (var db = new tpEntities())
            {
                return db.CITY_MASTER.ToList();
            }
        }

        //-----Listar CARRIER_MASTER
        public List<CARRIER_MASTER> ListCarrierMaster()
        {
            using (var db = new tpEntities())
            {
                return db.CARRIER_MASTER.ToList();
            }
        }

        //-----Listar USER_MASTER
        public List<USER_MASTER> ListUserMaster()
        {
            using (var db = new tpEntities())
            {
                return db.USER_MASTER.ToList();
            }
        }

        //-----Listar TYPPRODUCT_MASTER
        public List<TYPPRODUCT_MASTER> ListTypProduct()
        {
            using (var db = new tpEntities())
            {
                return db.TYPPRODUCT_MASTER.ToList();
            }
        }
        //-----Listar PRODUCT_MASTER
        public List<PRODUCT_MASTER> ListProductMaster(int id_typproduct)
        {
            using (var db = new tpEntities())
            {
                return db.PRODUCT_MASTER.Where(p => p.typproduct_id == id_typproduct).ToList();
            }
        }

        //-----Listar PRODUCTS_TRACKING
        public List<PRODUCTS_TRACKING> listProductTracking(int id_product)
        {
            using (var db = new tpEntities())
            {
                return db.PRODUCTS_TRACKING.Where(p => p.product_id == id_product).ToList();
            }
        }

        //----Listar BC_TABLE
        public List<BC> ListBCTable()
        {
            using (var db = new tpEntities())
            {
                return db.BC.ToList();
            }
        }

        //----Registrar BC Table
        public BC AddBCTable(BC objBC)
        {
            using (var db = new tpEntities())
            {
                var newBC = new TP.DA.BC
                {
                    contract_address=objBC.contract_address,
                    trx_hash=objBC.trx_hash
                };
                db.BC.Add(newBC);
                db.SaveChanges();
                
                return newBC;
            }
        }

    }
}
