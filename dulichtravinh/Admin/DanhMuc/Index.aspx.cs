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
using dulichtravinh.Services;

namespace dulichtravinh
{ 
    public partial class WebForm4 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.DataBind();
                if(Request.QueryString["Id"] != null)
                {
                    int Id = int.Parse(Request.QueryString["Id"]);
                    this.setTextBoxData(Id);  
                } else
                {
                    this.setTextBoxData(1);
                }
                ddDanhMucChaId.Items.Add(new ListItem("NULL", "0"));
                foreach (var danhmuc in this.GetDanhMucs)
                {
                    ddDanhMucChaId.Items.Add(new ListItem(danhmuc.TenDanhMuc, danhmuc.Id.ToString()));
                }
            }
        } 
        public List<DanhMuc> GetDanhMucs
        {
            get
            {
                return (new DanhMucService()).getDanhMucs();
            }
        }
        protected void setTextBoxData(int Id)
        { 
            SqlConnection conn = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand("SP_LayDanhMucTheoIdVaNgonNgu", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Id", Id);
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    txtDanhMucId.Value = dt.Rows[0][0].ToString();
                    txtTenDanhMuc.Text = dt.Rows[0][2].ToString();
                    txtMoTa.Text = dt.Rows[0][3].ToString();
                    chbTrangThai.Checked = Int32.Parse(dt.Rows[0][3].ToString()) == 1 ? true : false;
                }
            } catch(Exception ex)
            {

            } finally
            {
                conn.Close();
            }
        }

        protected void btnSaveAndEdit_Click(object sender, EventArgs e)
        {
            int DanhMucId = int.Parse(txtDanhMucId.Value);
            string TenDanhMuc = txtTenDanhMuc.Text;
            string MoTa = txtMoTa.Text;
            SqlConnection conn = new SqlConnection(this.connectionString); 
            SqlCommand cmd = new SqlCommand("SP_CapNhatDanhMuc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("DanhMucId", DanhMucId);
            cmd.Parameters.AddWithValue("TenDanhMuc", TenDanhMuc);
            cmd.Parameters.AddWithValue("MoTa", MoTa);
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
            
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery(); 
                if(i > 0)
                {
                    Response.Write(string.Format("<script>alert({0})</script>", "Thêm mới thành công"));
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