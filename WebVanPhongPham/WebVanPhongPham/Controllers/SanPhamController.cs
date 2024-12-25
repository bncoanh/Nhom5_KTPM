using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebVanPhongPham.Models;
using PagedList;
using PagedList.Mvc;

namespace WebVanPhongPham.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /DungCu/

        DataClasses1DataContext data = new DataClasses1DataContext();
        private List<SanPham> laysanphammoi(int count)
        {
            return data.SanPhams.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        public ActionResult Sanpham(int? page)
        {
            int pageSize = 24;
            int pageNum = (page ?? 1);

            var dungcumoi = laysanphammoi(268);
            return View(dungcumoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Chude()
        {
            var Chude = from cd in data.ChuDes select cd;
            return PartialView(Chude);
        }
        public ActionResult Details(int id)
        {
            var Details_Sanpham = data.SanPhams.Where(m => m.MaSanPham == id).First();
            return View(Details_Sanpham);
        }
        public ActionResult HienThiMenu(int id)
        {
            List<SanPham> lst = data.SanPhams.Where(n => n.MaChuDe == id).ToList();
            return View(lst);
        }
        public ActionResult TinTuc()
        {
            var All_tintuc = from tt in data.TinTucs select tt;
            return View(All_tintuc);
        }
        [HttpGet]
        public ActionResult LienHe()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LienHe(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["HotenKH"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var noidung = collection["Noidung"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống!";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi2"] = "Phải nhập số điện thoại!";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi3"] = "Phải nhập email!";
            }
            if (String.IsNullOrEmpty(noidung))
            {
                ViewData["Loi4"] = "Phải nhập nội dung!";
            }
            else
            {
                kh.HoTen = hoten;
                kh.DienThoai = dienthoai;
                kh.Email = email;
                kh.DiaChi = diachi;
                return RedirectToAction("Sanpham");
            }
            return this.LienHe();
        }
        public ActionResult TimKiem(string searchString, int id = 0)
        {
            var chude = from c in data.ChuDes select c;
            ViewBag.id = new SelectList(chude, "MaChuDe", "TenChuDe"); // danh sách Chủ đề
            //1. Tạo câu truy vấn kết 2 bảng Chủ đề, Dụng cụ bằng mệnh đề join
            var dcs = from l in data.SanPhams
                      join c in data.ChuDes on l.MaChuDe equals c.MaChuDe
                      select new { l.MaSanPham, l.GiaBan, l.TenSanPham, l.AnhBia, l.MaChuDe, c.TenChuDe };
            if (!String.IsNullOrEmpty(searchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                char[] text = searchString.ToCharArray();
                for(int i = 0; i<text.Length; i++)
                {
                    if(!Char.IsLetterOrDigit(text[i]))
                    {
                        ViewBag.ThongBao = "Chuoi tim kiem chua ki tu dac biet";
                    }
                    else
                        dcs = dcs.Where(s => s.TenSanPham.Contains(searchString)); //lọc theo chuỗi tìm kiếm
                }
                
            }
            else
            if (String.IsNullOrEmpty(searchString))
            {
                ViewBag.ThongBao = "Khong duoc de trong chuoi tim kiem";
            }
            
            
            //2. Tìm kiếm theo Mã chủ đề
            if (id != 0)
            {
                dcs = dcs.Where(x => x.MaChuDe == id);
            }
            //3. Chuyển đổi kết quả từ var sang danh sách List<DungCu>
            List<SanPham> listLinks = new List<SanPham>();
            foreach (var item in dcs)
            {
                SanPham temp = new SanPham();
                temp.MaChuDe = item.MaChuDe;
                temp.GiaBan = item.GiaBan;
                temp.MaSanPham = item.MaSanPham;
                temp.AnhBia = item.AnhBia;
                temp.TenSanPham = item.TenSanPham;
                listLinks.Add(temp);
            }
            return View(listLinks); //trả về kết quả
        }
    }
}
