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
    public class KhachGheTham
    {
        public int Id
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public int SoLuong
        {
            get;
            set;
        }
        public bool kiemTraTrungIP(string IP, DateTime currentTime)
        {
            SqlConnection con = new SqlConnection(Constant.CONNECTION_STRING);

            return false;
        }
    }
}