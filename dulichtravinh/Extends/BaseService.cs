using dulichtravinh.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace dulichtravinh.Extends
{
    public class BaseService
    {
        public string connectionString = WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString;
    }
}