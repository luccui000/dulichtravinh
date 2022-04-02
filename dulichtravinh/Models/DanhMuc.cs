using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dulichtravinh.Models
{
    public class DanhMuc
    {
        public int Id
        {
            get;
            set;
        }
        public int? DanhMucChaId
        {
            get;
            set;
        }
        public string TenDanhMuc
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public int TrangThai
        {
            get;
            set;
        } 
        public string NgayTao
        {
            get;
            set;
        }
    }
}