using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

namespace dulichtravinh.Models
{ 
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
        public string GoogleId
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
        public KhachHang layThongTin(string accessToken)
        {
            string url = String.Format("https://www.googleapis.com/oauth2/v3/userinfo?access_token={0}", accessToken);
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
            return this;
        }
    }
}