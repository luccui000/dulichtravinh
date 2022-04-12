using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace dulichtravinh.Models
{
    public class DiaDiem: BaseModel
    {
        public int Id
        {
            get;
            set;
        }
        public string TenDiaDiem
        {
            get;
            set;
        }
        public string MoTaNgan
        {
            get;
            set;
        }
        public string Iframe
        {
            get;
            set;
        }
        public float? KinhDo
        {
            get;
            set;
        }
        public float? ViDo
        {
            get;
            set;
        }
        public string DiaChi
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public int? TrangThai
        {
            get;
            set;
        }
        public int? laNoiBat
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
        public List<DiaDiem> topDiaDiemNoiBat()
        {
            var diadiems = new List<DiaDiem>(); 
            SqlCommand cmd = new SqlCommand("SP_LayTopDiaDiemTheoNgonNgu", this.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BanDich", "VietNam");

            try
            {
                this.conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    diadiems.Add(new DiaDiem()
                    {
                        Id = reader.GetInt32(0),
                        TenDiaDiem = reader.GetString(1),
                        DuongDan = reader.GetString(2),
                        MoTaNgan = !reader.IsDBNull(3) ? reader.GetString(3) : ""
                    });
                }

            } catch (Exception ex)
            {
                
            } finally
            {
                this.conn.Close();
            }
            return diadiems;
        }
        public DiaDiem layDiaDiem(int Id, string BanDich)
        { 
            SqlCommand cmd = new SqlCommand("SP_TimDiaDiemTheoIdVaNgonNgu", this.conn);
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.Parameters.AddWithValue("@BanDich", BanDich);
            try
            {
                this.conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                this.Id = reader.GetInt32(0);
                this.DuongDan = reader.GetString(1);
                this.TenDiaDiem = reader.GetString(2);
                this.MoTa = reader.GetString(3);
                this.DiaChi = reader.GetString(4);
                this.Iframe = reader.GetString(5);
                this.KinhDo = reader.GetFloat(6);
                this.ViDo = reader.GetFloat(7);
                this.NgayTao = reader.GetDateTime(8).ToLongTimeString();
                this.NguoiTao = reader.GetString(10); 
            } catch (Exception ex) { 
            }
            finally { this.conn.Close(); }
            return this;
        }
    }
}