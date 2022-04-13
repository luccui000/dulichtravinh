using dulichtravinh.Models;
using dulichtravinh.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using dulichtravinh.Helpers;

namespace dulichtravinh.Auth
{
    public partial class Callback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString["code"] != null)
                {
                    var token = string.Empty;
                    if(Response.Cookies["access_token"].Value == null) 
                        token = GoogleService.getToken(Request.QueryString["code"].ToString());
                    Response.Cookies["access_token"].Value = token.ToString();
                    Response.Cookies["access_token"].Expires = DateTime.Now.AddDays(30);
                    KhachHang khachhang = new KhachHang();
                    khachhang.dangNhapVoiGoogle(token); 
                    if (!String.IsNullOrEmpty(khachhang.GoogleId))
                    {
                        if(!khachhang.daTonTai(khachhang.GoogleId))
                        {
                            khachhang.dangNhap();
                        }
                        Session["login_with_google"] = true;
                        Session["TenHienThi"] = khachhang.TenGoogle;
                        Session["GoogleId"] = khachhang.GoogleId;
                        Session["access_token"] = token;
                        Session["id"] = khachhang.LayId(khachhang.GoogleId, ThongQua.GOOGLEID);
                        Response.Redirect(Session["previous_url"].ToString());
                    } else if (String.IsNullOrEmpty(khachhang.GoogleId))
                    {
                        Response.Write("<script>alert('Không thể xác nhận danh tính')</script>");
                    }
                } else
                {
                    Response.Redirect("/");
                }
            }
        }
    }
}