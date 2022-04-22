using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace dulichtravinh.Models
{
    public class Tag: BaseModel
    {
        public int Id
        {
            get;
            set;
        }
        public string TenTag
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public List<Tag> layHashTag(int Id)
        {
            var tags = new List<Tag>();
            SqlCommand cmd = new SqlCommand("SP_LayHashTagTheoBaiVietId", this.conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Id);
            try
            {
                this.conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    tags.Add(new Tag()
                    {
                        Id = reader.GetInt32(6),
                        TenTag = reader.GetString(7),
                        MoTa = reader.GetString(8)
                    });
                }

            } catch(Exception ex)
            { 
            } finally
            {
                this.conn.Close();
            }
            return tags;
        }
    }
}