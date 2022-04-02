using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using dulichtravinh.Models;
using System.Web.Configuration;
using dulichtravinh.Helpers;

namespace dulichtravinh.Services
{ 
    public class DanhMucService
    {
        public string WebConfigurationManger { get; private set; }

        public List<DanhMuc> getDanhMucs()
        {
            List<DanhMuc> danhMucs = new List<DanhMuc>(); 
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_LayDanhMucTheoNgonNgu", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader(); 
            while(reader.Read())
            {
                danhMucs.Add(new DanhMuc()
                {
                    Id = reader.GetInt32(0),
                    DanhMucChaId = reader.IsDBNull(1) ? 0 : reader.GetInt32(1),
                    TenDanhMuc = reader.GetString(2),
                    MoTa = reader.GetString(3),
                    NgayTao = reader.GetDateTime(4).ToLongDateString(),
                    TrangThai = reader.GetInt32(5)
                });
            }
            connection.Close();
            return danhMucs;
        } 
    }
}