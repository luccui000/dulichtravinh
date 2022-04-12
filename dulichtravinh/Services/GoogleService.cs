using dulichtravinh.Helpers;
using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace dulichtravinh.Services
{
    public class GoogleService
    {
        public static string getToken(string code)
        {
            string postString = String.Format(
                "grant_type=authorization_code&code={0}&client_id={1}&client_secret={2}&redirect_uri={3}",
                code,
                Constant.GOOGLE_CLIENT_ID,
                Constant.GOOGLE_CLIENT_SECRET,
                Constant.GOOGLE_REDIRECT_URL
            );
            string url = Constant.GOOGLE_OAUTH_URL;
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlencoded";
            request.Method = "POST";
            UTF8Encoding utfenc = new UTF8Encoding();
            byte[] bytes = utfenc.GetBytes(postString);
            Stream outputstream = null;
            try
            {
                request.ContentLength = bytes.Length;
                outputstream = request.GetRequestStream();
                outputstream.Write(bytes, 0, bytes.Length);
            } catch(Exception ex) {

            }
            var response = (HttpWebResponse)request.GetResponse();
            
            var streamReader = new StreamReader(response.GetResponseStream());
            string responseFromServer = streamReader.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            GoogleToken obj = js.Deserialize<GoogleToken>(responseFromServer);
            return obj.access_token;
        }   
    }
}