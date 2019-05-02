using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TP.BE;
using TP.BE.Request;
using TP.BL.Interface;
using TP.DA;

namespace TP.BL
{
    public class CTPBL : ITPBL
    {
        //-------Agregar en TRAKING MASTER----------------
        public string AddTracking(TrackingMasterRequest request)
        {
            var trackDA = new TPDA();
            var trackAdd = new TRACKING_TABLE
            { 
                tracking_id = request.tracking_id,
                id_contrato = request.id_contrato,
                carrier_id = request.carrier_id,
                city_id = request.city_id,
                location_id = request.location_id,
                ptracking_id = request.ptracking_id,
                user_id = request.user_id,
                address = request.address,
                delivery_term = request.delivery_term,
                destinity_address = request.destinity_address,
                start_time = request.start_time,
                end_time = request.end_time,
                observations = request.observations,
                state = request.state,
                value = request.value,
                weight = request.weight,   
                id_sensor = request.id_sensor,
                product_id = request.product_id,
                product_name = request.product_name,
                product_unit = request.product_unit
            };

            var response = trackDA.AddTracking(trackAdd);
            return response.tracking_id;
        }

        //------Actualizar Tracking
        public bool UpdateTracking(Tracking_MasterBE tracking)
        {
            bool status = false;
            var trackDA = new TPDA();
            var trackUpdate = new TRACKING_TABLE
            {
                id_contrato = tracking.id_contrato,
                tracking_id = tracking.tracking_id,
                carrier_id = tracking.carrier_id,
                city_id = tracking.city_id,
                location_id = tracking.location_id,
                ptracking_id = tracking.ptracking_id,
                user_id = tracking.user_id,
                address = tracking.address,
                delivery_term = tracking.delivery_term,
                destinity_address = tracking.destinity_address,
                start_time = tracking.start_time,
                end_time = tracking.end_time,
                observations = tracking.observations,
                state = tracking.state,
                value = tracking.value,
                weight = tracking.weight,
                id_sensor = tracking.id_sensor,
                product_id = tracking.product_id,
                product_name = tracking.product_name,
                product_unit = tracking.product_unit
            };
            status = true;
            var response = trackDA.UpdateTracking(trackUpdate);
            return status;
        }


        //---Eliminar Tracking
        public bool DeleteTracking(string id)
        {
            bool status = false;
            var trackingDA = new TPDA();
            if (id != null)
            {
                trackingDA.DeleteTracking(id);
                return status = true;
            }else{return status;}
        }

        //----Registrar BC Table
        public int AddBC(BCRequest request)
        {
            var bcDA = new TPDA();
            var bckAdd = new BC
            {
                contract_address = request.contract_address,
                trx_hash = request.trx_hash
            };

            var response = bcDA.AddBCTable(bckAdd);
            return response.bc_id;
        }

        //-----Listar Tracking_Master
        public List<Tracking_MasterBE> List_Tracking()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListCarga();
            var listBE = new List<Tracking_MasterBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new Tracking_MasterBE
                {
                    tracking_id = item.tracking_id,
                    expedition_date = item.expedition_date,
                    id_contrato = item.id_contrato,
                    carrier_id = item.carrier_id,
                    city_id = item.city_id,
                    location_id = item.location_id,
                    ptracking_id = item.ptracking_id,
                    user_id = item.user_id,
                    address = item.address,
                    delivery_term = item.delivery_term,
                    destinity_address = item.destinity_address,
                    start_time = item.start_time,
                    end_time = item.end_time,
                    observations = item.observations,
                    state = item.state,
                    value = item.value,
                    weight = item.weight,
                    id_sensor = item.id_sensor,
                    product_id = item.product_id,
                    product_name = item.product_name,
                    product_unit = item.product_unit
                });
            }
            return listBE;
        }

        //-----Listar BC_TABLE
        public List<BC_BE> ListBCTable()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListBCTable();
            var listBE = new List<BC_BE>();

            foreach (var item in listDA)
            {
                listBE.Add(new BC_BE
                {
                    bc_id = item.bc_id,
                    contract_address = item.contract_address,
                    trx_hash = item.trx_hash
                });
            }
            return listBE;
        }

        //-----Listar CARRIER_MASTER
        public List<Carrier_MasterBE> ListCareerMaster()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListCarrierMaster();
            var listBE = new List<Carrier_MasterBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new Carrier_MasterBE
                {
                    carrier_id = item.carrier_id,
                    address = item.address,
                    contract_no = item.contract_no,
                    dni = item.dni,
                    email = item.email,
                    name = item.name
                });
            }
            return listBE;
        }

        //-----Listar CITY_MASTER
        public List<City_MasterBE> ListCityMaster()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListCityMaster();
            var listBE = new List<City_MasterBE>(); 

            foreach (var item in listDA)
            {
                listBE.Add(new City_MasterBE
                {
                    city_id = item.city_id,
                    city_name = item.city_name
                });
            }
            return listBE;
        }

        //-----Listar PRODUCT_MASTER
        public List<Product_MasterBE> ListProductMaster()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListProductMaster();
            var listBE = new List<Product_MasterBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new Product_MasterBE
                {
                    flg_perishable = item.flg_perishable,
                    product_id = item.product_id,
                    product_name = item.product_name,
                    typproduct_id = item.typproduct_id
                });
            }
            return listBE.ToList();
        }

        //-----Listar PRODUCTS_TRACKING
        public List<Product_TrackingBE> ListProductTracking()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListProductTracking();
            var listBE = new List<Product_TrackingBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new Product_TrackingBE
                {
                    liters = item.liters,
                    metros_cub = item.metros_cub,
                    product_id = item.product_id,
                    ptracking_id = item.ptracking_id,
                    units = item.units
                });
            }

            return listBE.ToList();
        }

        //------Listar SENSOR MASTER
        public List<Sensor_MasterBE> ListSensorMaster()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListSensorMaster();
            var listBE = new List<Sensor_MasterBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new Sensor_MasterBE
                {
                    codigoseguimiento = item.codigoseguimiento,
                    humidity = item.humidity,
                    id_contrato = item.id_contrato,
                    temperatura = item.temperatura,
                    time = item.time,
                    id_message = item.id_message,
                    id_sensor = item.id_sensor

                });
            }
            return listBE;
        }

        //-----Listar TYPPRODUCT_MASTER
        public List<TypProduct_MasterBE> ListTypProductMaster()
        {
            var trackDA = new TPDA();
            var listDA = trackDA.ListTypProduct();
            var listBE = new List<TypProduct_MasterBE>();

            foreach (var item in listDA)
            {
                listBE.Add(new TypProduct_MasterBE
                {
                    typproduct_id = item.typproduct_id,
                    typ_name = item.typ_name
                });
            }
            return listBE;
        }

        //-----Listar USER_MASTER
        public List<User_MasterBE> Login()
        {
            throw new NotImplementedException();
        }
    }
}