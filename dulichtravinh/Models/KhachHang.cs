﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using dulichtravinh.Helpers;

namespace dulichtravinh.Models
{
    public enum ThongQua
    {
        EMAIL,
        GOOGLEID
    }
    public class KhachHang
    {
        public int Id
        {
            get;
            set;
        }
        public string TenHienThi
        {
            get;
            set;
        }
        public string Email
        {
            get;
            set;
        }
        public string HinhDaiHien
        {
            get;
            set;
        }
        public int TrangThai
        {
            get;
            set;
        }
        public string MatKhau
        {
            get;
            set;
        }
        public string GoogleId
        {
            get;
            set;
        }
        public string accessToken
        {
            get;
            set;
        }
        
        public string TenGoogle
        {
            get;
            set;
        }
        public string NgonNgu
        {
            get;
            set;
        } 
        public string toString()
        {
            return String.Format("TenHienThi: {0}, Email: {1}, HinhDaiHien: {2}, GoogleId: {3}, TenGoogle: {4}, NgonNgu: {5}",
                this.TenHienThi,
                this.Email,
                this.HinhDaiHien,
                this.GoogleId,
                this.TenGoogle,
                this.NgonNgu
                );

        }
        public int LayId(string giaTri, ThongQua thongQua)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING); 
            SqlCommand cmd;
            switch (thongQua)
            {
                case ThongQua.EMAIL:
                    cmd = new SqlCommand("SP_LayIdKhachHangQuaEmail", conn);
                    cmd.Parameters.AddWithValue("@Email", giaTri);
                    break;
                case ThongQua.GOOGLEID:
                    cmd = new SqlCommand("SP_LayIdKhachHangQuaGoogleId", conn);
                    cmd.Parameters.AddWithValue("@GoogleId", giaTri);
                    break;
                default:
                    cmd = new SqlCommand("SP_LayIdKhachHangQuaEmail", conn);
                    cmd.Parameters.AddWithValue("@Email", giaTri);
                    break;
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int).Direction = ParameterDirection.Output;
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if(i > 0)
                {
                    int Id = int.Parse(cmd.Parameters["@Id"].Value.ToString());
                    return Id;
                }
            } catch (Exception ex)
            {
                return 0;
            } finally
            {
                conn.Close();
            }
            return 0;
        } 
        public int layIdQuaGoogleId(string GoogleId)
        { 
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SELECT * FROM KhachHang WHERE GoogleId=@GoogleId", conn);
            DataTable dt = new DataTable();
            cmd.Parameters.AddWithValue("@GoogleId", GoogleId);
            try
            {
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return int.Parse(dt.Rows[0][0].ToString());
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                conn.Close();
            }
            return 0;
        }
        public bool daTonTai(string googleId)
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING); 
            SqlCommand cmd = new SqlCommand("SP_KhachHangDaTonTai", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@GoogleId", googleId);
            DataTable dt = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                    return true;
            } catch(Exception ex)
            {
                return false;
            } finally
            {
                conn.Close();
            }
            return false;
        }
        public KhachHang dangNhapVoiGoogle(string accessToken)
        {
            string url = String.Format("https://www.googleapis.com/oauth2/v2/userinfo?access_token={0}", accessToken);
            var request = WebRequest.Create(url);
            request.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response = request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            response.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            UserGoogleResponse userInfo = js.Deserialize<UserGoogleResponse>(responseFromServer);
            this.HinhDaiHien = userInfo.picture;
            this.GoogleId = userInfo.id;
            this.NgonNgu = userInfo.locale;
            this.TenGoogle = userInfo.name;
            this.Email = userInfo.email;
            this.accessToken = accessToken;
            return this;
        }  
        public bool dangNhap()
        {
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_DangNhapVoiGoogle", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenHienThi", this.TenHienThi);
            cmd.Parameters.AddWithValue("@Email", this.Email);
            cmd.Parameters.AddWithValue("@HinhDaiDien", this.HinhDaiHien);
            cmd.Parameters.AddWithValue("@GoogleId", this.GoogleId);
            cmd.Parameters.AddWithValue("@TenGoogle", this.TenGoogle);
            cmd.Parameters.AddWithValue("@NgonNgu", this.NgonNgu);
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("[ERROR]:::", ex.Message);
                return false;
            }
            finally
            {
                conn.Close();
            }
            return false;
        }
        public KhachHang dangKy()
        {
            this.MatKhau = Hash.make(this.MatKhau);

            return this;
        }
        public bool ThemBinhLuanMoi(int KhachhangId, int BaiVietId, String noiDung, int BinhLuanCha)
        { 
            SqlConnection conn = new SqlConnection(Constant.CONNECTION_STRING);
            SqlCommand cmd = new SqlCommand("SP_ThemBinhLuanMoi", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@KhachHangId", KhachhangId);
            cmd.Parameters.AddWithValue("@BaiVietId", Id);
            cmd.Parameters.AddWithValue("@NoiDungBinhLuan", noiDung);  
            try
            {
                conn.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            } finally
            {
                conn.Close();
            }
            return false;
        }
    }
}