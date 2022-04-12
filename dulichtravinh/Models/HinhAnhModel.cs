using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace dulichtravinh.Models
{
    public class HinhAnhModel: BaseModel
    {
        public int Id
        {
            get;
            set;
        }
        public string TenHinhAnh
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public string DuongDan
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public int NguoiTao
        {
            get;
            set;    
        }
        public List<HinhAnhModel> getAllHinhAnh()
        {
            var hinhanhs = new List<HinhAnhModel>();
            SqlCommand cmd = new SqlCommand("SP_Th", this.conn);
            try
            {
                this.conn.Open();
                
            } catch(Exception ex)
            {

            } finally
            {
                this.conn.Close();
            }
            return hinhanhs;
        }
    }
}