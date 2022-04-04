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

namespace dulichtravinh
{
    public partial class WebForm2 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_DanhSachDiaDiemTheoNgonNgu", connection);
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
            cmd.CommandType = CommandType.StoredProcedure; 
            try
            {
                connection.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt); 
                grvDiaDiem.DataSource = dt;
                grvDiaDiem.DataBind();
            } catch(Exception ex)
            {

            } finally
            {
                connection.Close();
            }
        }
        public void addParameter(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string tukhoaTimKiem = txtTimKiem.Text;
            SqlConnection conn = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_TimKiemDiaDiemTheoTuKhoa", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TuKhoa", tukhoaTimKiem);
            try
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                grvDiaDiem.DataSource = dt;
                grvDiaDiem.DataBind();

            } catch(Exception ex)
            {

            } finally
            {
                conn.Close();
            }
        }
    }
}