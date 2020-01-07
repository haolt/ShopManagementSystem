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
            string select = "Select CTDonMuaHang.IDHoaDon, SanPham.TenSanPham, CTDonMuaHang.SoLuong, SanPham.GiaBan " +
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

        public Boolean lapPhieuNhapKho(PhieuNhapKhoModel model)
        {
            string s = "SELECT IDHoaDon FROM PhieuNhapKho";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idPhieuNhap)
                    {
                        MessageBox.Show("Đã có mã đơn hàng này! Hãy nhập mã đơn hàng khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(1) != (string)model.idNhanVien)
                    {
                        MessageBox.Show("Mã nhân viên không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(2) != (string)model.idKho)
                    {
                        MessageBox.Show("Mã kho tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        List<CTPhieuNhapKhoModel> arrData = (List<CTPhieuNhapKhoModel>)model.listSP;
                        string select = "INSERT INTO PhieuNhapKho(IDPhieuNhap,IDNhanVien,IDKho) VALUES(N'" + model.idPhieuNhap + "',N'" + model.idNhanVien + "',N'" + model.idKho + "')";
                        DataConn.ThucHienCmd(select);
                        for (int i = 0; i < arrData.Count; i++)
                        {
                            CTPhieuNhapKhoModel dic = (CTPhieuNhapKhoModel)arrData[i];
                            string select1 = "INSERT INTO CTDonMuaHang(IDPhieuNhap,IDSanPham,SoLuong) VALUES(N'" + model.idPhieuNhap + "',N'" + dic.idSanPham + "',N'" + dic.soluongNhap + "')";
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
        public Boolean lapPhieuXuatKho(PhieuNhapKhoModel model)
        {
            string s = "SELECT IDHoaDon FROM PhieuXuatKho";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idPhieuNhap)
                    {
                        MessageBox.Show("Đã có mã đơn hàng này! Hãy nhập mã đơn hàng khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(1) != (string)model.idNhanVien)
                    {
                        MessageBox.Show("Mã nhân viên không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(2) != (string)model.idKho)
                    {
                        MessageBox.Show("Mã kho tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        List<CTPhieuNhapKhoModel> arrData = (List<CTPhieuNhapKhoModel>)model.listSP;
                        string select = "INSERT INTO PhieuNhapKho(IDPhieuXuat,IDNhanVien,IDKho) VALUES(N'" + model.idPhieuNhap + "',N'" + model.idNhanVien + "',N'" + model.idKho + "')";
                        DataConn.ThucHienCmd(select);
                        for (int i = 0; i < arrData.Count; i++)
                        {
                            CTPhieuNhapKhoModel dic = (CTPhieuNhapKhoModel)arrData[i];
                            string select1 = "INSERT INTO CTDonMuaHang(IDPhieuXuat,IDSanPham,SoLuong) VALUES(N'" + model.idPhieuNhap + "',N'" + dic.idSanPham + "',N'" + dic.soluongNhap + "')";
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
        public NhanVienModel traCuuThongTinNhanVien(String idNV) 
        {
            NhanVienModel khModel = new NhanVienModel();
            string select = "select * from NhanVien where IDNhanVien ='" + idNV + "'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDNhanVien"] = ds.Tables[0].Rows[0]["IDNhanVien"].ToString();
                    dict["TenNhanVien"] = ds.Tables[0].Rows[0]["TenNhanVien"].ToString();
                    dict["IDChiNhanh"] = ds.Tables[0].Rows[0]["IDChiNhanh"].ToString();
                    dict["SDT"] = ds.Tables[0].Rows[0]["SDT"].ToString();
                    dict["Sex"] = ds.Tables[0].Rows[0]["Sex"].ToString();
                    khModel = new NhanVienModel(dict: dict);
                    return khModel;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public List<SanPhamModel> traCuuSanPham()
        {
            
            string select = "select * from SanPham";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    List<SanPhamModel> listModel = new List<SanPhamModel>();

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Dictionary<String, Object> dict = new Dictionary<string, object>();
                        dict["IDSanPham"] = ds.Tables[0].Rows[i]["IDSanPham"].ToString();
                        dict["TenSanPham"] = ds.Tables[0].Rows[i]["TenSanPham"].ToString();
                        dict["IDNhaCC"] = ds.Tables[0].Rows[i]["IDNhaCC"].ToString();
                        dict["IDLoaiSanPham"] = ds.Tables[0].Rows[i]["IDLoaiSanPham"].ToString();
                        dict["MauSac"] = ds.Tables[0].Rows[i]["MauSac"].ToString();
                        dict["GiaNhap"] = ds.Tables[0].Rows[i]["GiaNhap"].ToString();
                        dict["GiaBan"] = ds.Tables[0].Rows[i]["GiaBan"].ToString();

                        SanPhamModel model = new SanPhamModel(dict: dict);
                        listModel.Add(model);
                    }

                    return listModel;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public Boolean ThemNhanVien(NhanVienModel model)
        {
            String idNV = model.idNhanVien;
            string s = "SELECT IDNhanVien FROM NhanVien";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idNhanVien)
                    {
                        MessageBox.Show("Đã có mã nhân viên này! Hãy nhập mã khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(1) != (string)model.idChiNhanh)
                    {
                        MessageBox.Show("Mã chi nhánh không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(2) == (string)model.userName)
                    {
                        MessageBox.Show("UserName đã tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        string select = "INSERT INTO NhanVien(IDNhanVien,TenNhanVien,IDChiNhanh,SDT,Sex,UserName,PassWord) VALUES(N'" + model.idNhanVien + "',N'" + model.tenNhanVien + "',N'" + model.idChiNhanh + "',N'" + model.sdt + "',N'" + model.gioitinh + "',N'" + model.userName + "',N'" + model.passWord + "')";
                        DataConn.ThucHienCmd(select);
                        return true;
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

        public Boolean xoaNhanVien(String idNV)
        {
            String select = "UPDATE NHANVIEN SET flag='" + 0 + "' where IDNhanVien = '" + idNV + "' ";
            DataConn.ThucHienCmd(select);
            return true;
        }

        public List<NhanVienModel> danhSachNhanVien(Boolean isGetDeletedNV)
        {
            List<NhanVienModel> listNV = new List<NhanVienModel>();
            string select = "SELECT * FROM NhanVien";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        for (int i = 0; i<ds.Tables[0].Rows.Count;i++)
                        {
                            Dictionary<String, Object> dict = new Dictionary<string, object>();
                            dict["IDNhanVien"] = ds.Tables[0].Rows[i]["IDNhanVien"].ToString();
                            dict["TenNhanVien"] = ds.Tables[0].Rows[i]["TenNhanVien"].ToString();
                            dict["IDChiNhanh"] = ds.Tables[0].Rows[i]["IDChiNhanh"].ToString();
                            dict["SDT"] = ds.Tables[0].Rows[i]["SDT"].ToString();
                            dict["Sex"] = ds.Tables[0].Rows[i]["Sex"].ToString();
                            dict["UserName"] = ds.Tables[0].Rows[i]["UserName"].ToString();
                            dict["PassWord"] = ds.Tables[0].Rows[i]["PassWord"].ToString();
                            dict["flag"] = (Boolean)ds.Tables[0].Rows[i]["flag"];
                            NhanVienModel model = new NhanVienModel(dict: dict);
                            if (isGetDeletedNV == true)
                            {
                                listNV.Add(model);
                            }
                            else
                            {
                                if ((Boolean)dict["flag"] == true)
                                {
                                    listNV.Add(model);
                                }
                            }

                        }
                        
                }
            }

            return listNV;
        }
        public Boolean doiPassWord(String pass, String userName)
        {
            String select = "UPDATE NHANVIEN SET PassWord='" + pass + "' where UserName = '"+userName+"' ";
            DataConn.ThucHienCmd(select);
            return true;
        }

        public Boolean ThemPhanHoi(PhanHoiModel model)
        {
            string s = "SELECT IDPhanHoi FROM PhanHoi";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idPhanhoi)
                    {
                        MessageBox.Show("Mã phản hồi đã tồn tại, Hãy nhập mã khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(1) != (string)model.idKhachHang)
                    {
                        MessageBox.Show("ID khách hàng không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        string select = "INSERT INTO PhanHoi(IDPhanHoi,IDKhachHang,NDPhanHoi,NgayPhanHoi,DiaChiPH) VALUES(N'" + model.idPhanhoi + "',N'" + model.idKhachHang + "',N'" + model.ndPhanHoi + "',N'" + model.ngayPhanhoi + "',N'" + model.diaChi + "')";
                        DataConn.ThucHienCmd(select);
                        return true;
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }
    }
}
