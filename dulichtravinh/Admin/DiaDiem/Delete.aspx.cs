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
    public partial class WebForm6 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["Id"] == null)
            {
                Response.Redirect("/Admin/DiaDiem/Index.aspx");
            }
            int Id = int.Parse(Request.QueryString["Id"]);
            SqlConnection conn = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_XoaDiaDiemTheoId", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", Id);
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                    Response.Write(string.Format("<script>Xóa thành công</script>"));
                else
                    Response.Write(string.Format("<script>Có lỗi xảy ra không thể xóa</script>"));
            } catch (Exception ex)
            {

            } finally
            {
                conn.Close();
            }
        }
    }
}