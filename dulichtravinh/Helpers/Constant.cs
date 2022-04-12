using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace dulichtravinh.Helpers
{
    public class Constant
    {
        public static string CONNECTION_STRING = WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString;
        public const string CONNECTION_STRING_NAME = "dulichtravinh"; 
        public const string IMAGE_UPLOAD_DIRECTORY = "Upload/images/";
        public const string GOOGLE_MAP_API_KEY = "AIzaSyDQ79vsnbZlWGRjagom6acBhXfM31TniDY";
        public const string GOOGLE_CLIENT_ID = "1045507496301-0jrch29co1g70c8f7nq9qvckk8dd0i8q.apps.googleusercontent.com";
        public const string GOOGLE_CLIENT_SECRET = "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";
        public const string GOOGLE_OAUTH_URL = "https://accounts.google.com/o/oauth2/token";
        public const string GOOGLE_REDIRECT_URL = "http://localhost:49588/Auth/Callback.aspx";
    }
}