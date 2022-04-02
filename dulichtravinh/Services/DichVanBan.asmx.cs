using dulichtravinh.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace dulichtravinh.Services
{
    /// <summary>
    /// Summary description for DichVanBan
    /// </summary>
    class JsResponse
    {
        public string Text
        {
            get;
            set;
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)] 
    [System.Web.Script.Services.ScriptService]
    public class DichVanBan : System.Web.Services.WebService
    {
        [WebMethod]
        public string Dich(string input)
        {
            if (string.IsNullOrEmpty(input))
                return string.Empty;
            string ouputString = Translator.translate(input);
            JavaScriptSerializer js = new JavaScriptSerializer();
            JsResponse jsResponse = new JsResponse()
            {
                Text = ouputString
            };
            return js.Serialize(jsResponse);
        }
    }
}
