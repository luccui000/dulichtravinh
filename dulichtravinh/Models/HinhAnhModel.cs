using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dulichtravinh.Models
{
    public class HinhAnhModel
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
    }
}