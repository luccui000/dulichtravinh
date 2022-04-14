using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        public List<ThuVien> danhSachHinhAnh;
        public List<DiaDiem> danhSachDiaDiem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                danhSachHinhAnh = ThuVien.danhSachHinhAnh("VietNam");
                danhSachDiaDiem = DiaDiem.danhSachDiaDiem("VietNam");
            }
        }
    }
}