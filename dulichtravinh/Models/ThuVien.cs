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
    public class ThuVien
    {
        public int Id
        {
            get;
            set;
        }
        public string TenHinhAnh
        {
            get;
            set;
        }
        public string DuongDan
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public string NguoiTao
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public static List<ThuVien> danhSachHinhAnh(string ngonNgu)
        { 
            var thuviens = new List<ThuVien>();
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_LayThuVienTheoNgonNgu", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NgonNgu", ngonNgu);
            
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    thuviens.Add(new ThuVien()
                    {
                        Id = reader.GetInt32(0),
                        DuongDan = reader.GetString(1),
                        TenHinhAnh = reader.GetString(2),
                        MoTa = reader.GetString(3),
                        NgayTao = reader.GetDateTime(4).ToLongDateString(),
                        NguoiTao = reader.GetString(5)
                    });
                }
                reader.Close();
            } catch(Exception ex)
            {
                return null;
            } finally
            {
                conn.Close();
            }
            return thuviens;
        }
    }
}