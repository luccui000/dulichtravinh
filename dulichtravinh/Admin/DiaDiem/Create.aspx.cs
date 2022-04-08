using dulichtravinh.Helpers;
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
using System.Data.SqlTypes;

namespace dulichtravinh
{
    public partial class WebForm3 : Model
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
            string TenDiaDiem = txtTenDiaDiem.Text;
            string tenDiaDiemTiengAnh = txtTenDiaDiemTiengAnh.Text;
            string MoTaNgan = txtMoTaNgan.Text;
            string MoTaNganTiengAnh = txtMoTaNganTiengAnh.Text;
            string Iframe = txtIFrame.Text;
            float KinhDo = float.Parse(txtKinhDo.Text);
            float ViDo = float.Parse(txtViDo.Text);
            string DiaChi = txtDiaChi.Text;
            string MoTa = txtMoTa.Text;
            string MoTaTiengAnh = txtMoTaTiengAnh.Text;
            int hinhAnhId = int.Parse(txtHinhAnhId.Value);

            SqlConnection conn = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_ThemMoiDiaDiem", conn);
            cmd.CommandType = CommandType.StoredProcedure; 

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
            cmd.Parameters.AddWithValue("@MoTaNgan", MoTaNgan);
            cmd.Parameters.AddWithValue("@MoTaNganTiengAnh", MoTaNganTiengAnh);

            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>Thêm mới thành công</script>");
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
        protected string getGoogleMapAPIKey
        {
            get
            {
                return Constant.GOOGLE_MAP_API_KEY;
            }
        }
    }
}