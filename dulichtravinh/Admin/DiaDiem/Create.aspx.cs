using dulichtravinh.Helpers;
using dulichtravinh.Models;
using dulichtravinh.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected List<List<Models.HinhAnhModel>> getHinhAnh
        {
            get
            {
                return (new HinhAnhService()).getHinhAnh();
            }
        }

        protected void btnSaveAndContinue_Click(object sender, EventArgs e)
        { 
        }
        protected string getGoogleMapAPIKey
        {
            get
            {
                return Constant.GOOGLE_MAP_API_KEY;
            }
        }
    }
}