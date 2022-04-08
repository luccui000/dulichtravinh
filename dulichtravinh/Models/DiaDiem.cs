using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dulichtravinh.Models
{
    public class DiaDiem
    {
        //string TenDiaDiem = txtTenDiaDiem.Text;
        //string tenDiaDiemTiengAnh = txtTenDiaDiemTiengAnh.Text;
        //string Iframe = txtIFrame.Text;
        //float KinhDo = float.Parse(txtKinhDo.Text);
        //float ViDo = float.Parse(txtViDo.Text);
        //string DiaChi = txtDiaChi.Text;
        //string MoTa = txtMoTa.Text;
        //string MoTaTiengAnh = txtMoTaTiengAnh.Text;
        //string MoTaNgan = txtMoTaNgan.Text;
        //string MoTaNganTiengAnh = txtMoTaTiengAnh.Text;
        //int hinhAnhId = int.Parse(txtHinhAnhId.Value);
        //int DiaDiemId = int.Parse(txtDiaDiemId.Value);

        public int Id
        {
            get;
            set;
        } 
        public HinhAnhModel HinhAnhId
        {
            get;
            set;
        }
        public string TenHinhAnh
        {
            get;
            set;
        }
        public string Iframe
        {
            get;
            set;
        }
        public float KinhDo
        {
            get;
            set;
        }
        public float ViDo
        {
            get;
            set;
        }
        public string DiaChi
        {
            get;
            set;
        }
        public string MoTaNgan
        {
            get;
            set;
        }
        public string MoTaNganTiengAnh
        {
            get;
            set;
        }
        public string MoTa
        {
            get;
            set;
        }
        public string MoTaTiengAnh
        {
            get;
            set;
        }
    }
}