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
using dulichtravinh.Models;

namespace dulichtravinh
{
    public partial class WebForm5 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["Id"] == null)
            {
                Response.Redirect("/Admin/DiaDiem/Index.aspx");
            }
            int Id = int.Parse(Request.QueryString["Id"]);
            SqlConnection conn = new SqlConnection(this.connectionString); 
            SqlCommand cmd = new SqlCommand("SP_TimDiaDiemTheoId", conn);
            cmd.Parameters.AddWithValue("Id", Id);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if(dt.Rows.Count > 1)
                {
                    txtTenDiaDiem.Text = dt.Rows[0][2].ToString();
                    txtTenDiaDiemTiengAnh.Text = dt.Rows[1][2].ToString();
                    txtIFrame.Text = dt.Rows[0][5].ToString();
                    txtKinhDo.Text = dt.Rows[0][6].ToString();
                    txtViDo.Text = dt.Rows[0][7].ToString();
                    txtMoTa.Text = dt.Rows[0][3].ToString();
                    txtMoTaTiengAnh.Text = dt.Rows[1][3].ToString();
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