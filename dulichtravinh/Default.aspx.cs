using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace dulichtravinh
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        public List<DiaDiem> topDiaDiemNoiBat;

        protected void Page_Load(object sender, EventArgs e)
        {
            string lang = Session["lang"] != null ? Session["lang"].ToString() : "VietNam";
            topDiaDiemNoiBat = (new DiaDiem()).topDiaDiemNoiBat(lang);
        } 
        public List<BinhLuan> danhSachBinhLuanNoiBat
        {
            get
            {
                var binhluans = new List<BinhLuan>();
                DataTable dt = BinhLuan.danhSachBinhLuanNoiBat();

                foreach (DataRow row in dt.Rows)
                {
                    binhluans.Add(new BinhLuan()
                    {
                        Id = Convert.ToInt32(row["Id"]),
                        NoiDungBinhLuan = Convert.ToString(row["NoiDungBinhLuan"]),
                        TenHienThi = Convert.ToString(row["TenHienThi"])
                    });
                }
                return binhluans;
            }
        }
    }
}