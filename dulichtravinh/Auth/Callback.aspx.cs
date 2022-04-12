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
                    var token = GoogleService.getToken(Request.QueryString["code"].ToString());
                    KhachHang khachhang = new KhachHang();
                    khachhang.layThongTin(token);
                    Response.Write(khachhang.toString());
                    SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
                    SqlCommand cmd = new SqlCommand("SP_ThemMoiKhachHang", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TenHienThi", khachhang.TenHienThi);
                    cmd.Parameters.AddWithValue("@Email", khachhang.Email);
                    cmd.Parameters.AddWithValue("@HinhDaiDien", khachhang.HinhDaiHien);
                    cmd.Parameters.AddWithValue("@GoogleId", khachhang.GoogleId);
                    cmd.Parameters.AddWithValue("@TenGoogle", khachhang.TenGoogle);
                    cmd.Parameters.AddWithValue("@NgonNgu", khachhang.NgonNgu);
                    try
                    {
                        conn.Open();
                        int i = cmd.ExecuteNonQuery();
                        if(i > 0)
                        { 
                            Session["login_with_google"] = true;
                            if(Session["previous_url"] != null)
                            {
                                Response.Redirect(Session["previous_url"].ToString());
                            } else
                            {
                                Response.Redirect("/");
                            }
                        }
                    } catch(Exception ex)
                    {
                        Response.Write(ex.Message);
                    } finally
                    {
                        conn.Close();
                    }
                }
            }
        }
    }
}