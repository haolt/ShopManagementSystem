using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ShopManagementSystem
{
    class Service
    {
        public LoginModel login(String userName, String password)
        {
             LoginModel model = new LoginModel();

             String sql = "select * from [QL_BanHang15].[dbo].[NhanVien] where UserName = '" + userName + "' and PassWord ='" + password + "'";
             SqlDataReader dr = DataConn.ThucHienReader(sql);
            if (dr != null)
            {
                if (dr.Read() == true)
                {
                        UserInfoModel user = new UserInfoModel();
                        LoginModel mod = new LoginModel(errrorCode: 0, message: "Thành công", user: user, status: "");
                        dr.Close();
                        dr.Dispose();
                        return mod;

                }
                else
                {
                    UserInfoModel user = null;
                    LoginModel mod = new LoginModel(errrorCode: 1, message: "Sai tên đăng nhập hoặc mật khẩu", user: user, status: "false");
                    dr.Close();
                    dr.Dispose();
                    return mod;
                }
                
            }
            else
            {
                UserInfoModel user = null;
                LoginModel mod = new LoginModel(errrorCode: 2, message: "Có lỗi xảy ra, mời thử lại", user: user, status: "false");
                dr.Close();
                dr.Dispose();
                return mod;
            }
           }

        public LoginModel qlLogin(String userName, String passWord)
        {
            LoginModel model = new LoginModel();

            String sql = "select * from [QL_BanHang15].[dbo].[QuanLy] where UserName = '" + userName + "' and PassWord ='" + passWord + "'";
            SqlDataReader dr = DataConn.ThucHienReader(sql);
            if (dr != null)
            {
                if (dr.Read() == true)
                {
                    UserInfoModel user = new UserInfoModel();
                    LoginModel mod = new LoginModel(errrorCode: 0, message: "Thành công", user: user, status: "");
                    dr.Close();
                    dr.Dispose();
                    return mod;

                }
                else
                {
                    UserInfoModel user = null;
                    LoginModel mod = new LoginModel(errrorCode: 1, message: "Sai tên đăng nhập hoặc mật khẩu", user: user, status: "false");
                    dr.Close();
                    dr.Dispose();
                    return mod;
                }

            }
            else
            {
                UserInfoModel user = null;
                LoginModel mod = new LoginModel(errrorCode: 2, message: "Có lỗi xảy ra, mời thử lại", user: user, status: "false");
                dr.Close();
                dr.Dispose();
                return mod;
            }
        }

        public KhachHangModel timKiemThongTinKH(string idKH)
        {
            KhachHangModel khModel = new KhachHangModel();
            string select = "select * from [QL_BanHang15].[dbo].[KhachHang] where IDKhachHang ='"+idKH+"'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Dictionary<String, Object> dict = new Dictionary<string,object>();
                    dict["errorCode"] = 0;
                    dict["message"] = "Thành công";
                    dict["IDKhachHang"] = ds.Tables[0].Rows[0]["IDKhachHang"].ToString();
                    dict["TenKhachHang"] = ds.Tables[0].Rows[0]["TenKhachHang"].ToString();
                    dict["DiaChi"] = ds.Tables[0].Rows[0]["DiaChi"].ToString();
                    dict["SoDienThoai"] = ds.Tables[0].Rows[0]["SoDienThoai"].ToString();
                    dict["GioiTinh"] = (Boolean)ds.Tables[0].Rows[0]["GioiTinh"];
                    khModel = new KhachHangModel(data: dict);
                }
                else
                {
                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["errorCode"] = 1;
                    dict["message"] = "Không tồn tại thông tin khách hàng!!!";
                    dict["IDKhachHang"] = "";
                    dict["TenKhachHang"] = "";
                    dict["DiaChi"] = "";
                    dict["SoDienThoai"] = "";
                    dict["GioiTinh"] = 0;
                    khModel = new KhachHangModel(data: dict);
                }
            }
            else
            {
                Dictionary<String, Object> dict = new Dictionary<string, object>();
                dict["errorCode"] = 2;
                dict["message"] = "Lỗi hệ thống, mời thử lại";
                khModel = new KhachHangModel(data: dict);
            }
          //  ds.Close();
           // ds.Dispose();
         //   ds.Tables[0].Rows[0]["MaHD"].ToString();
            return khModel;
        }

        public Dictionary<String, Object> traCuuHoaDon(String idHD)
        {
            Dictionary<String, Object> ctHD = new Dictionary<String, Object>();
            string select = "Select CTDonMuaHang.IDHoaDon, SanPham.TenSanPham, CTDonMuaHang.SoLuong " +
                "from CTDonMuaHang INNER JOIN SanPham ON CTDonMuaHang.IDSanPham = SanPham.IDSanPham";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    ctHD["errorCode"] = 0;
                    ctHD["message"] = "Thành công";
                    List<Object> listData = new List<object>();


                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Dictionary<String, Object> dic = new Dictionary<string, object>();
                        dic["IDHoaDon"] = ds.Tables[0].Rows[i]["IDHoaDon"].ToString();
                        dic["TenSanPham"] = ds.Tables[0].Rows[i]["TenSanPham"].ToString();
                        dic["SoLuong"] = (int)ds.Tables[0].Rows[i]["SoLuong"];
                        listData.Add(dic);
                    }

                    ctHD["data"] = listData;
                }
                else
                {
                    ctHD["errorCode"] = 1;
                    ctHD["message"] = "Không tồn tại thông tin khách hàng!!!";
                    ctHD["data"] = null;
   
                   // ctHD = new ChiTietHoaDonModel(dict: dict);
                }
            }
            else
            {
                ctHD["errorCode"] = 2;
                ctHD["message"] = "Lỗi hệ thống, mời thử lại";
                ctHD["data"] = null;
            }

          //  " FROM tblHoaDonNhap INNER JOIN tblChiTietHDN ON tblHoaDonNhap.MaHD=tblChiTietHDN.MaHD"
            return ctHD;
        }

        public Boolean nhapHoaDon(Dictionary<String, Object> dict) 
        {
          //  "INSERT INTO tblDatHang(MaPhieu,TenKhachH,DienThoai,GhiChu) VALUES(N'" + txtMaPhieu.Text + "',N'" + txtTenKhach.Text + "','" + txtDienThoai.Text + "',N'" + txtGhiChu.Text + "')";
            string s = "SELECT IDHoaDon FROM DonMuaHang";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == (string)dict["IDHoaDon"])
                    {
                        MessageBox.Show("Đã có mã đơn hàng này! Hãy nhập mã đơn hàng khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(0) != (string)dict["IDKhachHang"])
                    {
                        MessageBox.Show("Mã Khách hàng không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        List<Dictionary<String, Object>> arrData = (List<Dictionary<String, Object>>)dict["data"]; 
                        string select = "INSERT INTO DonMuaHang(IDHoaDon,IDKhachHang) VALUES(N'" + (string)dict["IDHoaDon"] + "',N'" + (string)dict["IDKhachHang"] + "')";
                        DataConn.ThucHienCmd(select);
                        for (int i = 0; i < arrData.Count; i++)
                        {
                            Dictionary<String, Object> dic = (Dictionary<String, Object>)arrData[i];
                            string select1 = "INSERT INTO CTDonMuaHang(IDHoaDon,IDSanPham,SoLuong,GiaBan) VALUES(N'" + (string)dic["IDHoaDon"] + "',N'" + (string)dic["IDKhachHang"] + "',N'" + (string)dic["SoLuong"] + "',N'" + (string)dic["GiaBan"] + "')";
                            DataConn.ThucHienCmd(select);

                        }
                        
                        
                        return true;
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

      //  public Dictionary<String, Object> InPhieuNhapKho(String idPhieuNhap)
       // {

       // }
    }
}
