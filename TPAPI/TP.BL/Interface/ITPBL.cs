using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TP.BE;
using TP.BE.Request;

namespace TP.BL.Interface
{
    public interface ITPBL
    {
        string AddTracking(TrackingMasterRequest request);
        bool DeleteTracking(string id);
        bool UpdateTracking(Tracking_MasterBE tracking);
        int AddBC(BCRequest request);
        List<BC_BE> ListBCTable();
        List<Carrier_MasterBE> ListCareerMaster();
        List<Tracking_MasterBE> List_Tracking();
        List<City_MasterBE> ListCityMaster();
        List<Product_MasterBE> ListProductMaster(Product_MasterBE typproduct);
        List<Product_TrackingBE> ListProductTracking(Product_TrackingBE product);
        List<Sensor_MasterBE> ListSensorMaster();
        List<TypProduct_MasterBE> ListTypProductMaster();
        List<User_MasterBE> Login();
    }
}
