using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh
{
    public partial class App : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["lang"] == null)
            {
                Session["lang"] = "VietNam";
            } 
        }

        protected void Language_Click(object sender, EventArgs e)
        {
            if(Session["lang"].ToString() == "VietNam")
            {
                imgFlag.ImageUrl = "./Resources/images/English.png";
                Session["lang"] = "English";
            } else
            {
                imgFlag.ImageUrl = "./Resources/images/Vietnam.png";
                Session["lang"] = "VietNam";
            }
        }
    }
}