﻿using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<DiaDiem> getTopDiaDiemNoiBat
        {
            get
            {
                return (new DiaDiem()).topDiaDiemNoiBat();
            }
        }
    }
}