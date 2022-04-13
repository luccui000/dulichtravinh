using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dulichtravinh.Models
{
    public class BinhLuan
    {
        public int Id
        {
            get;
            set;
        }
        public int BaiVietId
        {
            get;
            set;
        }
        public string TenHienThi
        {
            get;
            set;
        }
        public string NoiDungBinhLuan
        {
            get;
            set;
        }
        public BinhLuan BinhLuanCha
        {
            get;
            set;
        }
        public string NgayTao
        {
            get;
            set;
        }
        public List<BinhLuan> all()
        {
            var binhluans = new List<BinhLuan>();

            return binhluans;
        }
    }
}