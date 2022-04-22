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
    public class DiaDiem : BaseModel
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
        public static int themMoi(
            int hinhAnhId,
            string DiaChi,
            string Iframe,
            string KinhDo,
            string ViDo,
            int NguoiTao,
            string TenDiaDiem,
            string TenDiaDiemTiengAnh,
            string MoTa,
            string MoTaTiengAnh,
            string MoTaNgan,
            string MoTaNganTiengAnh,
            string Tags
        ) {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
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
            cmd.Parameters.Add("@Id", SqlDbType.Int).Direction = ParameterDirection.Output;

            int Id = 0;
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                { 
                    Id = int.Parse(cmd.Parameters["@Id"].Value.ToString());
                    string[] tagIds = Tags.Split(',');
                    foreach (var tagId in tagIds)
                    {
                        SqlCommand cmd2 = new SqlCommand("SP_ThemMoiDiaDiemTag", conn);
                        cmd2.CommandType = CommandType.StoredProcedure;

                        cmd2.Parameters.AddWithValue("@DiaDiemId", Id);
                        cmd2.Parameters.AddWithValue("@TagId", tagId);
                        cmd2.ExecuteNonQuery();
                    }
                    return Id;
                } 
            }
            catch (Exception ex)
            {
                Id = 0;
            }
            finally
            {
                conn.Close();
            }
            return Id;
        }
        public static List<DiaDiem> danhSachDiaDiem(string ngonNgu)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            var diadiems = new List<DiaDiem>();
            SqlCommand cmd = new SqlCommand("SP_LayDanhSachDiaDiemTheoNgonNgu", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NgonNgu", ngonNgu);

            try
            {
                conn.Open();
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

            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
            return diadiems;
        }
        public List<DiaDiem> topDiaDiemNoiBat(string ngonNgu)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            var diadiems = new List<DiaDiem>(); 
            SqlCommand cmd = new SqlCommand("SP_LayTopDiaDiemTheoNgonNgu", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NgonNgu", ngonNgu);

            try
            {
                conn.Open();
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
                conn.Close();
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