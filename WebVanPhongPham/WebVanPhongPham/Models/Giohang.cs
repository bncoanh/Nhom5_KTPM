using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebVanPhongPham.Models
{
    public class Giohang
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        public int iMasanpham { set; get; }
        public string sTensanpham { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public Giohang(int Masanpham)
        {
            iMasanpham = Masanpham;
            SanPham sanpham = data.SanPhams.Single(n => n.MaSanPham == iMasanpham);
            sTensanpham = sanpham.TenSanPham;
            sAnhbia = sanpham.AnhBia;
            dDongia = double.Parse(sanpham.GiaBan.ToString());
            iSoluong = 1;
        }
    }
}