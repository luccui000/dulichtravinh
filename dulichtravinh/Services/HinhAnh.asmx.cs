using dulichtravinh.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace dulichtravinh.Services
{
    public class HinhAnhResponse
    {
        public string MoTa
        {
            get;
            set;
        }
        public string TenHinhAnh
        {
            get;
            set;
        }
    } 
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    [System.ComponentModel.ToolboxItem(false)]  
    public class HinhAnh : System.Web.Services.WebService
    { 
        [WebMethod] 
        public string ThemMoi(string TenHinhAnh = "", string MoTa = "")
        { 
            string outputTenHinhAnh =  Translator.translate(TenHinhAnh);
            string outputMoTa =  Translator.translate(MoTa);
            JavaScriptSerializer js = new JavaScriptSerializer();

            HinhAnhResponse response = new HinhAnhResponse()
            {
                TenHinhAnh = outputTenHinhAnh,
                MoTa = outputMoTa
            };

            return js.Serialize(response);
        }
    }
}
