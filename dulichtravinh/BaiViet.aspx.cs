using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["Id"]))
                Response.Redirect("/");

            if (int.TryParse(Request.QueryString["Id"], out int Id))
            {
                Response.Write(string.Format("<script>alert('Dia Diem ID: {0}')</script>", Id.ToString()));
            } else
            {
                Response.Redirect("/");
            }
        }
    }
}