using dulichtravinh.Helpers;
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
using System.Collections;
using dulichtravinh.Services;

namespace dulichtravinh
{ 
    public partial class WebForm1 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.DataBind();
        }
        protected void btnLuuHinhAnh_Click(object sender, EventArgs e)
        {
            if(Page.IsValid && fuDuongDan.HasFile)
            {
                string result = ImageUploader.upload(fuDuongDan, Constant.IMAGE_UPLOAD_DIRECTORY);
                if (string.IsNullOrEmpty(result))
                    Response.Write("Upload that bai");
                else
                {  
                    SqlConnection conn = new SqlConnection(this.connectionString);
                    SqlCommand cmd = new SqlCommand("SP_CreateImageWithSubtitle", conn);
                    cmd.CommandType = CommandType.StoredProcedure; 

                    cmd.Parameters.AddWithValue("DuongDan", result);
                    cmd.Parameters.AddWithValue("NguoiTao", 1);
                    cmd.Parameters.AddWithValue("TenHinhAnhTiengAnh", txtTenHinhAnhTiengAnh.Text);
                    cmd.Parameters.AddWithValue("TenHinhAnhTiengViet", txtTenHinhAnh.Text);
                    cmd.Parameters.AddWithValue("MoTaTiengAnh", txtMoTaTiengAnh.Text);
                    cmd.Parameters.AddWithValue("MoTaTiengViet", txtMoTa.Text);
                    try
                    {
                        conn.Open();
                        int i = cmd.ExecuteNonQuery();
                        if(i > 0)
                        {
                            Response.Write(string.Format("<script>{0}</script>", "Thêm mới thành công"));
                            txtMoTa.Text = "";
                            txtMoTaTiengAnh.Text = "";
                            txtTenHinhAnh.Text = "";
                            txtTenHinhAnhTiengAnh.Text = "";
                            fuDuongDan.Dispose();
                        }
                    } catch(Exception ex)
                    {
                        Response.Write(string.Format("<script>{0}</script>", ex.Message));
                    } finally
                    {
                        conn.Close();
                    }
                } 
            }
        }
        protected void btnTranslate_Click(object sender, EventArgs e)
        {    
            string inputText = txtMoTa.Text;
            if(!string.IsNullOrEmpty(inputText))
            {
                string outputText = Translator.translate(inputText);
                txtMoTaTiengAnh.Text = outputText;
            }
        }
        protected List<List<HinhAnhModel>> getHinhAnh
        {
            get
            {
                return (new HinhAnhService()).getHinhAnh();
            }
        }
    }
}