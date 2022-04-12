using dulichtravinh.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace dulichtravinh.Models
{
    public class BaseModel
    {
        protected string connectionString = WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString;
        public SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString); 
    }
}