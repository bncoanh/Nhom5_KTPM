using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebVanPhongPham.Models;

namespace WebVanPhongPham.Controllers
{
    public class NguoiDungController : Controller
    {
        //
        // GET: /NguoiDung/
        DataClasses1DataContext db = new DataClasses1DataContext();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:dd/MM/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống!";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập!";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mat khau!";
            }
            if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu!";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email không được bỏ trống!";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Phải nhập điện thoại!";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DiaChi = diachi;
                kh.DienThoai = dienthoai;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }
        public ActionResult DangNhap(FormCollection collection)
        {
            var tendn = collection["TenDN"];
            Session["TenDN"] = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            Session["Matkhau"] = collection["Matkhau"];
            
            if (String.IsNullOrEmpty(tendn) && String.IsNullOrEmpty(matkhau))
            {
                ViewBag.ThongBao = "Khong duoc bo trong ten dang nhap va mat khau!";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewBag.ThongBao = "Phai nhap ten dang nhap!";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewBag.ThongBao = "Phải nhập mật khẩu!";
            }
            else
            if (matkhau.Length < 6 || matkhau.Length > 15)
            {
                ViewBag.ThongBao = "Mat khau phai nam trong khoang 6-15 ky tu!";
            }
            else
            if (tendn.Length < 3 || tendn.Length > 30)
            {
                ViewBag.ThongBao = "Ten dang nhap phai nam trong khoang 4-30 ky tu!";
            }
            else
            {
                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null)
                {
                    Session["Taikhoan"] = kh;
                    ViewBag.ThongBao = "Dang nhap thanh cong!";
                    return RedirectToAction("Sanpham", "SanPham");
                }
                else
                    ViewBag.Thongbao = "Ten dang nhap hoac mat khau khong dung!";
            }
            return View();
        }
    }
}
