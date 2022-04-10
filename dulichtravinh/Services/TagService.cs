using dulichtravinh.Extends;
using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace dulichtravinh.Services
{
    public class TagService: BaseService
    {
        public List<Tag> getTags()
        {
            var tags = new List<Tag>();
            SqlConnection conn = new SqlConnection(this.connectionString);
            string query = "SELECT * FROM Tag WHERE TrangThai = 1";
            SqlCommand cmd = new SqlCommand(query, conn);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    tags.Add(new Tag()
                    {
                        Id = reader.GetInt32(0),
                        TenTag = reader.GetString(1),
                        MoTa = reader.GetString(2)
                    });
                }
            } catch(Exception ex)
            {
                return null;
            }
            return tags;
        }
    }
}