using NUnit.Framework;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace KiemThuPhanTuyenThucThi
{
    public class TestWebsite
    {
        Semaphore semaphore = new Semaphore(1, 1);
        private IWebDriver driver;
        private IWebDriver driver2;
        private ManualResetEvent event1 = new ManualResetEvent(false);
        private ManualResetEvent event2 = new ManualResetEvent(false);
        [SetUp]
        public void Setup()
        {
            driver = new ChromeDriver();
            driver2 = new ChromeDriver();
        }
        [Test]
        public void Test_ThreadTesting()
        {

            //Luồng 1: Thực hiện task1 và task3
            Thread thread1 = new Thread(() =>
            {
                Task1(driver, event1, event2);
                Console.WriteLine("Thread 1 - WebDriver ID: " + driver.GetHashCode());
                event1.Set();
                event2.WaitOne();
                Task3();
                Console.WriteLine("Thread 1 - WebDriver ID: " + driver.GetHashCode());
            });
            //Luồng 2: Thực hiện task2
            Thread thread2 = new Thread(() =>
            {
                event1.WaitOne();
                Task2(driver, event1, event2);
                Console.WriteLine("Thread 2 - WebDriver ID: " + driver2.GetHashCode());
                event2.Set();
            });

            //Bắt đầu các luồng
            thread1.Start();
            thread2.Start();

            //Chờ cho các luồng hoàn thành
            thread1.Join();
            thread2.Join();
        }
        private void Task1(IWebDriver driver, ManualResetEvent event1, ManualResetEvent event2)
        {
            //Task 1: Đăng ký + đăng nhập
            Console.WriteLine("Tiến hành đăng ký");
            driver.Navigate().GoToUrl("http://localhost:1628/NguoiDung/DangKy");
            driver.Manage().Window.Maximize();
            Thread.Sleep(2000);
            IWebElement nameKH = driver.FindElement(By.Name("HoTenKH"));
            nameKH.SendKeys("Huy");
            Thread.Sleep(2000);
            IWebElement nameDN = driver.FindElement(By.Name("TenDN"));
            nameDN.SendKeys("Huy123");
            Thread.Sleep(2000);
            IWebElement matkhau = driver.FindElement(By.Name("Matkhau"));
            matkhau.SendKeys("Huy12345");
            Thread.Sleep(2000);
            IWebElement cfmatkhau = driver.FindElement(By.Name("Matkhaunhaplai"));
            cfmatkhau.SendKeys("Huy12345");
            Thread.Sleep(2000);
            IWebElement email = driver.FindElement(By.Name("Email"));
            email.SendKeys("HuyHuy@gmail.com");
            Thread.Sleep(2000);
            IWebElement dc = driver.FindElement(By.Name("DiaChi"));
            dc.SendKeys("Nam Dinh");
            Thread.Sleep(2000);
            IWebElement dt = driver.FindElement(By.Name("Dienthoai"));
            dt.SendKeys("0483570989");
            Thread.Sleep(2000);
            IWebElement ntns = driver.FindElement(By.Name("NgaySinh"));
            ntns.SendKeys("23");
            ntns.SendKeys("03");
            ntns.SendKeys("2000");
            Thread.Sleep(2000);
            IWebElement dangky = driver.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > table > tbody > tr:nth-child(11) > td > input"));
            dangky.Click();
            Thread.Sleep(2000);

            //Đăng nhập
            IWebElement account = driver.FindElement(By.Name("TenDN"));
            account.SendKeys("Huy123");
            Thread.Sleep(2000);
            IWebElement pass = driver.FindElement(By.Name("Matkhau"));
            pass.SendKeys("Huy12345");
            Thread.Sleep(2000);
            IWebElement dangnhap = driver.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > table > tbody > tr:nth-child(5) > td > input"));
            dangnhap.Click();
            Thread.Sleep(2000);
            Console.WriteLine("Đăng nhập thành công");
            Thread.Sleep(5000);

        }
        private void Task2(IWebDriver driver, ManualResetEvent event1, ManualResetEvent event2)
        {
            
            //Task 2: Mua hàng
            Console.WriteLine("Luồng 2 bắt đầu mua hàng");
            driver2.Navigate().GoToUrl("http://localhost:1628/SanPham/HienThiMenu/2");
            Thread.Sleep(3000);
            IWebElement body = driver2.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 2; j++)
            {
                body.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(3000);
            IWebElement chonhang = driver2.FindElement(By.CssSelector("#text"));
            chonhang.Click();
            Thread.Sleep(2000);
            IWebElement body2 = driver2.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 2; j++)
            {
                body2.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(3000);
            IWebElement chonmua = driver2.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > div.row > div.col-lg-8 > div > div > div:nth-child(5) > button"));
            chonmua.Click();
            IWebElement giohang = driver2.FindElement(By.CssSelector("#navbarSupportedContent > ul > a.nav-link > img"));
            giohang.Click();
            Thread.Sleep(2000);
            IWebElement body3 = driver2.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 2; j++)
            {
                body3.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(3000);
            //IWebElement dathang = driver2.FindElement(By.Id("text"));
            //dathang.Click();
            //Thread.Sleep(2000);
            //IWebElement account = driver2.FindElement(By.Name("TenDN"));
            //account.SendKeys("Huy123");
            //Thread.Sleep(2000);
            //IWebElement pass = driver2.FindElement(By.Name("Matkhau"));
            //pass.SendKeys("Huy12345");
            //Thread.Sleep(2000);
            //IWebElement dangnhap = driver2.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > table > tbody > tr:nth-child(5) > td > input"));
            //dangnhap.Click();
            //Thread.Sleep(2000);
        }
        private void Task3()
        {
            //Task 3: Tiến hành thêm sản phẩm khác vào giỏ hàng
            Console.WriteLine("Luồng 1 tiến hành thanh toán hàng");
            driver.Navigate().GoToUrl("http://localhost:1628/SanPham/HienThiMenu/1");
            IWebElement body = driver.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 2; j++)
            {
                body.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(2000);
            IWebElement chonmuahang = driver.FindElement(By.Id("text"));
            chonmuahang.Click();
            Thread.Sleep(2000);
            IWebElement body1 = driver.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 3; j++)
            {
                body1.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(2000);
            IWebElement muahang = driver.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > div.row > div.col-lg-8 > div > div > div:nth-child(5) > button"));
            muahang.Click();
            Thread.Sleep(2000);
            IWebElement vaogiohang = driver.FindElement(By.CssSelector("#navbarSupportedContent > ul > a.nav-link > img"));
            vaogiohang.Click();
            Thread.Sleep(2000);
            IWebElement body2 = driver.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 3; j++)
            {
                body2.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(2000);
            IWebElement dathang = driver.FindElement(By.Id("text"));
            dathang.Click();
            Thread.Sleep(3000);
            IWebElement body3 = driver.FindElement(By.CssSelector("body"));
            for (int j = 1; j <= 3; j++)
            {
                body3.SendKeys(OpenQA.Selenium.Keys.PageDown);
                Thread.Sleep(new Random().Next(1000, 2000));
            }
            Thread.Sleep(2000);
            IWebElement thanhtoan = driver.FindElement(By.CssSelector("body > div.container > div > div.col-md-9 > table:nth-child(6) > tbody > tr:nth-child(5) > td:nth-child(2) > input"));
            thanhtoan.Click();
            Console.WriteLine("Thêm sản phẩm thành công");
            Thread.Sleep(5000);
        }
        [TearDown]
        public void Close()
        {
            driver.Quit();
            driver2.Quit();
        }
    }
}
