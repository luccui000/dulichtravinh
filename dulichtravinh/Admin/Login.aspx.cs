using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using dulichtravinh.Helpers;
using System.Web.Configuration;

namespace dulichtravinh
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        public string connectionString = WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string TenDangNhap = txtTenDangNhap.Text;
            string MatKhau = txtMatKhau.Text;
            string hashedMatKhau = Hash.make(MatKhau);

            SqlConnection conn = new SqlConnection(this.connectionString);
            string query = "SELECT * FROM TaiKhoan WHERE TenDangNhap=@TenDangNhap AND MatKhau=@MatKhau";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@TenDangNhap", TenDangNhap);
            cmd.Parameters.AddWithValue("@MatKhau", hashedMatKhau); 
            try
            {
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                conn.Open();
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    Session["Id"] = dt.Rows[0][0].ToString();
                    Session["TenDangNhap"] = txtTenDangNhap.Text;
                    Response.Redirect("/Admin/Index.aspx");
                } else
                {
                    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng')</script>");
                }
            } catch(Exception ex)
            {

            } finally
            {
                conn.Close();
            }
        }
    }
}