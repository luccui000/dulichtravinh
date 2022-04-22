using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using dulichtravinh.Helpers;

namespace dulichtravinh.Models
{
    public class Blog: BaseModel
    {
        public int Id
        {
            get;
            set;
        }
        public string TieuDe
        {
            get;
            set;
        }
        public string TieuDeTiengAnh
        {
            get;
            set;
        }
        public string MoTaNgan
        {
            get;
            set;
        }
        public string MoTaNganTiengAnh
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public string MoTaTiengAnh
        {
            get;
            set;
        }
        public int NguoiTaoId
        {
            get;
            set;
        }
        public string NguoiTao
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public int DanhMucID
        {
            get;
            set;
        }
        public string TenDanhMuc
        {
            get;
            set;
        }
        public static DataTable danhSachBlog()
        {
            DataTable tb = new DataTable();
            
        }
        public bool themMoi() { 
            SqlCommand cmd = new SqlCommand("SP_ThemMoiBlog", this.conn);
            cmd.CommandType = CommandType.StoredProcedure;
             
            cmd.Parameters.AddWithValue("@TieuDe", this.TieuDe);
            cmd.Parameters.AddWithValue("@TieuDeTiengAnh", this.TieuDeTiengAnh);
            cmd.Parameters.AddWithValue("@MoTaNgan", this.MoTaNgan);
            cmd.Parameters.AddWithValue("@MoTaNganTiengAnh", this.MoTaNganTiengAnh);
            cmd.Parameters.AddWithValue("@MoTa", this.MoTa);
            cmd.Parameters.AddWithValue("@MoTaTiengAnh", this.MoTaTiengAnh);
            cmd.Parameters.AddWithValue("@NguoiTao", this.NguoiTaoId);
            cmd.Parameters.AddWithValue("@DanhMucId", this.DanhMucID);
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0) return true;
            } catch(Exception ex) { }
            finally
            {
                conn.Close();
            }
            return false;
        }
    } 
}