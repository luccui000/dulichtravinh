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
using dulichtravinh.Models;

namespace dulichtravinh
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                danhSachBinhLuan(grvBinhLuan, 2);
                danhSachBinhLuan(grvBinhLuanChuaDuyet, 0);
                danhSachBinhLuan(grvBinhLuanDaDuyet, 1);
                danhSachBinhLuanNoiBat();
                grvNoiBat.DataSource = BinhLuan.danhSachBinhLuanNoiBat();
                grvNoiBat.DataBind();
            }
        }
        protected void danhSachBinhLuan( GridView gridView, int TrangThai)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_DanhSanhBinhLuan", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TrangThai", TrangThai);
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                gridView.DataSource = dt;
                gridView.DataBind();
            } catch (Exception ex )
            {
                Response.Write(ex.Message);
            } finally
            {
                conn.Close();
            } 
        }
         
        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            int Id = int.Parse(btn.CommandArgument);
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            string queryUpdate = "UPDATE BinhLuan SET TrangThai = 1 WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(queryUpdate, conn);
            cmd.Parameters.AddWithValue("@Id", Id);
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if(i > 0)
                {
                    Response.Write(String.Format("<script>Cập nhật thành công</script>"));
                    danhSachBinhLuan(grvBinhLuan, 2);
                    danhSachBinhLuan(grvBinhLuanChuaDuyet, 0);
                    danhSachBinhLuan(grvBinhLuanDaDuyet, 1);
                }
            } catch (Exception ex)
            {
                Response.Write(String.Format("<script>alert('{0}')</script>", ex.Message));
            } finally
            {
                conn.Close();
            }
        }
        protected void btnThemBLNoiBat_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            int Id = int.Parse(button.CommandArgument); 
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("UPDATE BinhLuan SET NoiBat = 1 WHERE Id=@Id", conn);
            cmd.Parameters.AddWithValue("@Id", Id);
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if(i > 0)
                {
                    Response.Write(Alert.Success("Đã thêm vào bình luận nổi bật"));
                }
            } catch(Exception ex)
            {
                Response.Write(Alert.Error("Có lỗi xảy ra: " + ex));
            } finally
            {
                conn.Close();
            }
        }
    }
}