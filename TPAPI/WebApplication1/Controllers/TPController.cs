using System;
using System.Web.Http;
using TP.BE;
using TP.BL;
using System.Web.Http.Cors;
using TP.BE.Request;

namespace TP.API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TPController : ApiController
    {
        //GET:api/TP/RegistrarCarga 
        [HttpPost]
        [Route("api/TP/RegistrarCarga")]
        public IHttpActionResult RegistrarCarga(TrackingMasterRequest request)
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.AddTracking(request);
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }

        //GET:api/TP/RegistrarBC 
        [HttpPost]
        [Route("api/TP/RegistrarBC")]
        public IHttpActionResult RegistrarBC(BCRequest request)
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.AddBC(request);
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString()});
            }
        }

        //GET:api/TP/ListarCarga 
        [HttpGet]
        [Route("api/TP/ListarCarga")]
        public IHttpActionResult ListarCarga()
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.List_Tracking();
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        
        //Update:api/TP/ActualizarCarga
        [HttpPut]
        [Route("api/TP/ActualizarCarga")]
        public bool ActualizarCarga(Tracking_MasterBE tracking)
        {
            var trackingBL = new CTPBL();
            var a = tracking.tracking_id;

            if (a != null)
            {
                var status = trackingBL.UpdateTracking(tracking);
                return status;
            }
            else{return false;}
        }

        //Delete:api/TP/EliminarCarga
        //----Ejemplo:http://localhost:58476/api/TP/EliminarCarga/test24
        [HttpDelete]
        [Route("api/TP/EliminarCarga/{id}")]
        public bool EliminarCarga(string id)
        {
            var tpBL = new CTPBL();
            var status = tpBL.DeleteTracking(id);
            return status;
        }

        //GET:api/TP/ListarBC 
        [HttpGet]
        [Route("api/TP/ListarBC")]
        public IHttpActionResult ListarBC()
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListBCTable();
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        //GET:api/TP/ListarProducto 
        [HttpGet]
        [Route("api/TP/ListarProducto")]
        public IHttpActionResult ListarProducto(Product_MasterBE typproduct)
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListProductMaster(typproduct);
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        //GET:api/TP/ListarCargaProductos 
        [HttpGet]
        [Route("api/TP/ListarCargaProductos")]
        public IHttpActionResult ListarCargaProductos(Product_TrackingBE product)
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListProductTracking(product);
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        

        //GET:api/TP/ListarSensor 
        [HttpGet]
        [Route("api/TP/ListarSensor")]
        public IHttpActionResult ListarSensor()
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListSensorMaster();
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        //GET:api/TP/ListarCiudad
        [HttpGet]
        [Route("api/TP/ListarCiudad")]
        public IHttpActionResult ListarCiudad()
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListCityMaster();
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
        //GET:api/TP/ListarCarrera
        [HttpGet]
        [Route("api/TP/ListarCarrera")]
        public IHttpActionResult ListarCarrera()
        {
            var tpBL = new CTPBL();
            try
            {
                var resultado = tpBL.ListCareerMaster();
                return Json(new { result = true, data = resultado });
            }
            catch (Exception e)
            {
                return Json(new { result = false, data = e.InnerException.ToString() });
            }
        }
    }
}
