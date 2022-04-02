using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using dulichtravinh.Helpers; 

namespace dulichtravinh.Services
{
    public class HinhAnhService
    {
        public List<List<HinhAnhModel>> getHinhAnh()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_LayHinhAnhTheoNgonNgu", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
            var list = new List<List<HinhAnhModel>>();
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int i = 0;
                var child = new List<HinhAnhModel>();
                while (i < 4 && reader.Read())
                {
                    child.Add(new HinhAnhModel()
                    {
                        Id = reader.GetInt32(0),
                        TenHinhAnh = reader.GetString(6),
                        MoTa = reader.GetString(7),
                        DuongDan = reader.GetString(1),
                        NgayTao = reader.GetDateTime(2).ToString(),
                        NguoiTao = reader.GetInt32(3)
                    });
                }
                list.Add(child);
            }
            return list;
        }
    }

}
