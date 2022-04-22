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
using System.Web.Script.Serialization;

namespace dulichtravinh
{ 
    public class TagSelect
    {
        public int id
        {
            get;
            set;
        }
        public string name
        {
            get;
            set;
        }
    }
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
        protected string getTags
        {
            get {
                List<Tag> tags = (new TagService()).getTags();
                List <TagSelect> tagSelects = new List<TagSelect>();
                string tagStr = string.Empty;
                foreach (var tag in tags)
                {
                    tagSelects.Add(new TagSelect()
                    {
                        id = tag.Id,
                        name = tag.TenTag
                    });
                }
                JavaScriptSerializer js = new JavaScriptSerializer(); 
                return js.Serialize(tagSelects);
            }
        }

        protected void btnSaveAndContinue_Click(object sender, EventArgs e)
        {
            string TenDiaDiem = txtTenDiaDiem.Text.Trim();
            string tenDiaDiemTiengAnh = txtTenDiaDiemTiengAnh.Text.Trim();
            string MoTaNgan = txtMoTaNgan.Text.Trim();
            string MoTaNganTiengAnh = txtMoTaNganTiengAnh.Text.Trim();
            string Iframe = txtIFrame.Text.Trim();
            string KinhDo = txtKinhDo.Text.Trim();
            string ViDo = txtViDo.Text.Trim();
            string DiaChi = txtDiaChi.Text.Trim();
            string MoTa = txtMoTa.Text.Trim();
            string MoTaTiengAnh = txtMoTaTiengAnh.Text.Trim();
            int hinhAnhId = string.IsNullOrEmpty(txtHinhAnhId.Value.Trim()) ? 1 : int.Parse(txtHinhAnhId.Value.Trim());

            Response.Write(MoTa);
            //int Id = Models.DiaDiem.themMoi(
            //    hinhAnhId,
            //    DiaChi,
            //    Iframe,
            //    KinhDo.ToString(),
            //    ViDo.ToString(),
            //    1,
            //    TenDiaDiem,
            //    tenDiaDiemTiengAnh,
            //    MoTa,
            //    MoTaTiengAnh,
            //    MoTaNgan,
            //    MoTaNganTiengAnh,
            //    txtTagField.Value
            //);
            //if (Id > 0)
            //{
            //    Response.Write(Alert.Success("Thêm mới thành công"));
            //}
            //else
            //{
            //    Response.Write(Alert.Error("Có lỗi xảy ra"));
            //}

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
            cmd.Parameters.AddWithValue("@TenDiaDiemTiengAnh", tenDiaDiemTiengAnh);
            cmd.Parameters.AddWithValue("@MoTa", MoTa);
            cmd.Parameters.AddWithValue("@MoTaTiengAnh", MoTaTiengAnh);
            cmd.Parameters.AddWithValue("@MoTaNgan", MoTaNgan);
            cmd.Parameters.AddWithValue("@MoTaNganTiengAnh", MoTaNganTiengAnh);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>Thêm mới thành công</script>");
                    int Id = int.Parse(cmd.Parameters["@Id"].Value.ToString());

                    string Tags = txtTagField.Value;
                    string[] tagIds = Tags.Split(',');
                    foreach (var tagId in tagIds)
                    {
                        SqlCommand cmd2 = new SqlCommand("SP_ThemMoiDiaDiemTag", conn);
                        cmd2.CommandType = CommandType.StoredProcedure;

                        cmd2.Parameters.AddWithValue("@DiaDiemId", Id);
                        cmd2.Parameters.AddWithValue("@TagId", tagId);
                        cmd2.ExecuteNonQuery();
                    }
                }
                else
                {
                    Response.Write("<script>Có lỗi xảy ra không thể thêm</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("ERRR" + ex.Message);
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