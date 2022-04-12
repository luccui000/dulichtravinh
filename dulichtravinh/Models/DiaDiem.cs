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

    }
}