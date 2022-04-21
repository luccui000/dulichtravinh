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

namespace dulichtravinh
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblBinhLuan.Text = getDashBoardCounter("BinhLuan");
                lblBaiViet.Text = getDashBoardCounter("BinhLuan");
                lblKhachHang.Text = getDashBoardCounter("KhachHang");
                lblKhachGheTham.Text = getDashBoardCounter("BinhLuan");
            }
        }
        protected string getDashBoardCounter(string table)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING); 
            SqlCommand cmd = new SqlCommand("SELECT COUNT(Id) FROM " + table, conn); 
            DataTable dt = new DataTable(); 
            try
            {
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt); 
                if(dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
            } catch(Exception ex)
            {
                Response.Write(Alert.Error(ex.Message)); 
            } finally
            {
                conn.Close();
            }
            return "0";
        }
    }
}