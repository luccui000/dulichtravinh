﻿using System;
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
            } else
            {
                if(!String.IsNullOrEmpty(Request.QueryString["lang"]) && Request.QueryString["lang"] == "English")
                { 
                    Session["lang"] = "English";
                } else
                {
                    Session["lang"] = "VietNam";
                }
            } 
        }
    }
}