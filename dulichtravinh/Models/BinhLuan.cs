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
    public class BinhLuan
    {
        public int Id
        {
            get;
            set;
        }
        public int BaiVietId
        {
            get;
            set;
        }
        public string HinhDaiDien
        {
            get;
            set;
        }
        public string TenHienThi
        {
            get;
            set;
        }
        public string NoiDungBinhLuan
        {
            get;
            set;
        }
        public BinhLuan BinhLuanCha
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public static List<BinhLuan> danhSachBinhLuan(int baiVietId)
        {
            var binhluans = new List<BinhLuan>();
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_LayDanhSachBinhLuanTheoBaiViet", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BaiVietId", baiVietId);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    binhluans.Add(new BinhLuan()
                    {
                        Id = reader.GetInt32(0),
                        TenHienThi = reader.GetString(3),
                        NoiDungBinhLuan = reader.GetString(4),
                        NgayTao = DateFormat.diffForHuman(reader.GetDateTime(5)),
                        HinhDaiDien = reader.GetString(6)
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

            return binhluans;
        }
        public static DataTable danhSachBinhLuanNoiBat()
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_DanhSachBinhLuanNoiBat", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt); 
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }
            return dt;
        }
    }
}