using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace dulichtravinh.Services
{
    /// <summary>
    /// Summary description for DiaDiem
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
     
    [System.ComponentModel.ToolboxItem(false)] 
    [System.Web.Script.Services.ScriptService]
     
    public class DiaDiem : System.Web.Services.WebService
    {

        [WebMethod]  
        public string layToaDo(string iframe)
        {
            JavaScriptSerializer js = new JavaScriptSerializer(); 
            GeoGraphic geoGraphic = IFrameService.getLocationFromIframe(iframe);
            return js.Serialize(geoGraphic);
        }
    }
}
