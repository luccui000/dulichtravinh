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
                    txtDiaDiemId.Value = Id.ToString();
                    txtTenDiaDiem.Text = dt.Rows[0][2].ToString();
                    txtTenDiaDiemTiengAnh.Text = dt.Rows[1][2].ToString();
                    txtIFrame.Text = dt.Rows[0][5].ToString();
                    txtKinhDo.Text = dt.Rows[0][6].ToString();
                    txtViDo.Text = dt.Rows[0][7].ToString();
                    txtMoTa.Text = dt.Rows[0][3].ToString();
                    txtMoTaTiengAnh.Text = dt.Rows[1][3].ToString();
                    txtHinhAnhId.Value = dt.Rows[1][10].ToString();
                    txtDiaChi.Text = dt.Rows[0][4].ToString();
                }
            } catch(Exception ex)
            {

            } finally
            {
                conn.Close();
            }
        }

        protected void btnSaveAndContinue_Click(object sender, EventArgs e)
        {
            string TenDiaDiem = txtTenDiaDiem.Text;
            string tenDiaDiemTiengAnh = txtTenDiaDiemTiengAnh.Text;
            string Iframe = txtIFrame.Text;
            float KinhDo = float.Parse(txtKinhDo.Text);
            float ViDo = float.Parse(txtViDo.Text);
            string DiaChi = txtDiaChi.Text;
            string MoTa = txtMoTa.Text;
            string MoTaTiengAnh = txtMoTaTiengAnh.Text;
            int hinhAnhId = int.Parse(txtHinhAnhId.Value);
            int DiaDiemId = int.Parse(txtDiaDiemId.Value);

            SqlConnection conn = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_CapNhatDiaDiem", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", DiaDiemId);
            cmd.Parameters.AddWithValue("@HinhAnhId", hinhAnhId);
            cmd.Parameters.AddWithValue("@DiaChi", DiaChi);
            cmd.Parameters.AddWithValue("@Iframe", Iframe);
            cmd.Parameters.AddWithValue("@KinhDo", KinhDo);
            cmd.Parameters.AddWithValue("@ViDo", ViDo);
            cmd.Parameters.AddWithValue("@NguoiTao", 1);
            cmd.Parameters.AddWithValue("@TenDiaDiem", TenDiaDiem);
            cmd.Parameters.AddWithValue("@TenDiaDiemTiengAnh", TenDiaDiem);
            cmd.Parameters.AddWithValue("@MoTa", MoTa);
            cmd.Parameters.AddWithValue("@MoTaTiengAnh", MoTaTiengAnh);

            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>Sửa thành công thành công</script>");
                    Response.Redirect("/Admin/DiaDiem/Index.aspx");
                }
                else
                {
                    Response.Write("<script>Có lỗi xảy ra không thể thêm</script>");
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }
    }
}