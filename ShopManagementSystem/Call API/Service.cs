﻿using System;
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

             String select = "select * from [QL_BanHang15].[dbo].[NhanVien] where UserName = '" + userName + "' and PassWord ='" + password + "'";
             DataSet ds = DataConn.GrdSource(select);
             if (ds != null)
             {
                 if (ds.Tables[0].Rows.Count != 0)
                 {
                     NhanVienModel user = new NhanVienModel();

                     user.idNhanVien = ds.Tables[0].Rows[0]["IDNhanVien"].ToString();
                     user.idChiNhanh = ds.Tables[0].Rows[0]["IDChiNhanh"].ToString();
                     user.tenNhanVien = ds.Tables[0].Rows[0]["TenNhanVien"].ToString();
                     user.sdt = ds.Tables[0].Rows[0]["SDT"].ToString();
                     user.userName = ds.Tables[0].Rows[0]["UserName"].ToString();
                     user.diaChi = "";

                     Properties.Settings.Default["UserSigning"] = user.idNhanVien;
                     Properties.Settings.Default.Save();  // Saves settings in application configuration file
                     model.errorCode = 0;
                     model.message = "Thành công";
                     model.user = user;
                     return model;

                 }
                 else
                 {
                     model.errorCode = -1;
                     model.message = "Sai tên đăng nhập hoặc mật khẩu";
                     model.user = null;
                     return model;
                 }

             }
             else
             {
                 model.errorCode = 1;
                 model.message = "Lỗi hệ thông, mời thử lại";
                 model.user = null;
                 return model;
             }
           }

        public LoginModel qlLogin(String userName, String passWord)
        {
            LoginModel model = new LoginModel();

            String select = "select * from [QL_BanHang15].[dbo].[QuanLy] where UserName = '" + userName + "' and PassWord ='" + passWord + "'";
                 DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0) {
                    NhanVienModel user = new NhanVienModel();
              
                  user.idNhanVien =  ds.Tables[0].Rows[0]["IDQuanLy"].ToString();
                  user.idChiNhanh = ds.Tables[0].Rows[0]["IDChiNhanh"].ToString();
                  user.tenNhanVien = ds.Tables[0].Rows[0]["TenQly"].ToString();
                  user.sdt = ds.Tables[0].Rows[0]["SDT"].ToString();
                  user.userName = ds.Tables[0].Rows[0]["UserName"].ToString();
                  user.diaChi = ds.Tables[0].Rows[0]["DiaChi"].ToString();

                  Properties.Settings.Default["UserSigning"] = user.idNhanVien;
                    Properties.Settings.Default.Save(); // Saves settings in application configuration file
                    model.errorCode = 0;
                    model.message = "Thành công";
                    model.user = user;
                    return model;

                }
                else
                {
                    model.errorCode = -1;
                    model.message = "Sai tên đăng nhập hoặc mật khẩu";
                    model.user = null;
                    return model;
                }

            }
            else
            {
                model.errorCode = 1;
                model.message = "Lỗi hệ thông, mời thử lại";
                model.user = null;
                return model;
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

        public HoaDonModel traCuuHoaDon(String idHD)
        {
            HoaDonModel ctHD = new HoaDonModel();
            string select = "Select CTDonMuaHang.IDHoaDon, SanPham.TenSanPham, CTDonMuaHang.SoLuong, SanPham.GiaBan, SanPham.IDSanPham , DonMuaHang.IDKhachHang, KhachHang.TenKhachHang, DonMuaHang.NgayMua" +
                            "from (SanPham  left outer join CTDonMuaHang  ON CTDonMuaHang.IDSanPham = SanPham.IDSanPham)"+
                            "left outer join DonMuaHang on CTDonMuaHang.IDHoaDon = DonMuaHang.IDHoaDon"+
                            "inner join KhachHang on DonMuaHang.IDKhachHang = KhachHang.IDKhachHang"+
                            " where CTDonMuaHang.IDHoaDon = '"+idHD+"'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    ctHD.idHD = ds.Tables[0].Rows[0]["IDHoaDon"].ToString();
                    ctHD.idKH = ds.Tables[0].Rows[0]["IDKhachHang"].ToString();
                    ctHD.tenKH = ds.Tables[0].Rows[0]["TenKhachHang"].ToString();
                    ctHD.ngaythang = ds.Tables[0].Rows[0]["NgayMua"].ToString();

                    List<CTDonMuaHang> listData = new List<CTDonMuaHang>();

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Dictionary<String, Object> dic = new Dictionary<string, object>();
                        dic["IDSanPham"] = ds.Tables[0].Rows[i]["IDSanPham"].ToString();
                        dic["TenSanPham"] = ds.Tables[0].Rows[i]["TenSanPham"].ToString();
                        dic["SoLuong"] = (int)ds.Tables[0].Rows[i]["SoLuong"];
                        dic["GiaBan"] = (int)ds.Tables[0].Rows[i]["GiaBan"];
                        CTDonMuaHang model = new CTDonMuaHang(dict: dic);
                        listData.Add(model);
                    }

                    ctHD.data = listData;
                    return ctHD;
                }
                else
                {
                    return null;
   
                   // ctHD = new ChiTietHoaDonModel(dict: dict);
                }
            }
            else
            {
                return null;
            }

        }

        public Boolean nhapHoaDon(Dictionary<String, Object> dict) 
        {
          //  "INSERT INTO tblDatHang(MaPhieu,TenKhachH,DienThoai,GhiChu) VALUES(N'" + txtMaPhieu.Text + "',N'" + txtTenKhach.Text + "','" + txtDienThoai.Text + "',N'" + txtGhiChu.Text + "')";

            string s = "SELECT IDHoaDon, IDKhachHang FROM DonMuaHang";
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
            string s = "SELECT IDHoaDon, IDNhanVIen, IDKho FROM PhieuNhapKho";
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
            string s = "SELECT IDHoaDon, IDNhanVien, IDKho FROM PhieuXuatKho";
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
                    dict["UserName"] = ds.Tables[0].Rows[0]["UserName"].ToString();
                    dict["PassWord"] = "";
                    dict["DiaChi"] = ds.Tables[0].Rows[0]["UserName"].ToString();

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
        public NhanVienModel traCuuThongTinQuanLy(String idNV)
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

                        if ((Boolean)ds.Tables[0].Rows[i]["flag"] == true)
                        {
                            SanPhamModel model = new SanPhamModel(dict: dict);
                            listModel.Add(model);
                        }
                        
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

        public SanPhamModel traCuuSanPham(String idSP)
        {
            SanPhamModel model = new SanPhamModel();

            string select = "select * from SanPham where IDSanPham='"+idSP+"'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {

                        Dictionary<String, Object> dict = new Dictionary<string, object>();
                        dict["IDSanPham"] = ds.Tables[0].Rows[0]["IDSanPham"].ToString();
                        dict["TenSanPham"] = ds.Tables[0].Rows[0]["TenSanPham"].ToString();
                        dict["IDNhaCC"] = ds.Tables[0].Rows[0]["IDNhaCC"].ToString();
                        dict["IDLoaiSanPham"] = ds.Tables[0].Rows[0]["IDLoaiSanPham"].ToString();
                        dict["MauSac"] = ds.Tables[0].Rows[0]["MauSac"].ToString();
                        dict["GiaNhap"] = ds.Tables[0].Rows[0]["GiaNhap"].ToString();
                        dict["GiaBan"] = ds.Tables[0].Rows[0]["GiaBan"].ToString();
                        if ((Boolean)ds.Tables[0].Rows[0]["flag"] == true)
                        {
                            model = new SanPhamModel(dict: dict);
                            return model;
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
            else
            {
                return null;
            }
        }

        public SanPhamModel capNhatSanPham(SanPhamModel model)
        {
            String select = "UPDATE SanPham SET TenSanPham=N'" + model.tenSanPham + "'" +
               ",IDNhaCC = '" + model.idNhaCC + "',IDLoaiSanPham = '" + model.idLoaiSanPham + "',MauSac = N'" + model.mauSac + "' ,GiaNhap = N'" + model.giaNhap + "',GiaBan = N'" + model.giaBan + "'" +
           "where IDSanPham = '" + model.idSanPham + "' ";
            DataConn.ThucHienCmd(select);
            SanPhamModel modelSP = new SanPhamModel();

            string sql = "select * from SanPham where IDSanPham='" + model.idSanPham + "'";
            DataSet ds = DataConn.GrdSource(sql);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {

                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDSanPham"] = ds.Tables[0].Rows[0]["IDSanPham"].ToString();
                    dict["TenSanPham"] = ds.Tables[0].Rows[0]["TenSanPham"].ToString();
                    dict["IDNhaCC"] = ds.Tables[0].Rows[0]["IDNhaCC"].ToString();
                    dict["IDLoaiSanPham"] = ds.Tables[0].Rows[0]["IDLoaiSanPham"].ToString();
                    dict["MauSac"] = ds.Tables[0].Rows[0]["MauSac"].ToString();
                    dict["GiaNhap"] = ds.Tables[0].Rows[0]["GiaNhap"].ToString();
                    dict["GiaBan"] = ds.Tables[0].Rows[0]["GiaBan"].ToString();

                    modelSP = new SanPhamModel(dict: dict);


                    return modelSP;
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

        public Boolean xoaSanPham(String idSP)
        {
            String select = "UPDATE SanPham SET flag='" + 0 + "' where IDSanPham = '" + idSP + "' ";
            try
            {
                DataConn.ThucHienCmd(select);
                return true;

            }
            catch
            {
                return false;
            }
        }

        public Boolean ThemSanPham(SanPhamModel model)
        {
            String idNV = model.idSanPham;
            string s = "SELECT IDSanPham, IDNhaCC, IDLoaiSanPham FROM SanPham";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idSanPham)
                    {
                        MessageBox.Show("Đã có mã sản phẩm này! Hãy nhập mã khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        string select = "INSERT INTO SanPham(IDSanPham,TenSanPham,IDNhaCC,IDLoaiSanPham,MauSac,GiaNhap,GiaBan) VALUES(N'" + model.idSanPham + "',N'" + model.tenSanPham + "',N'" + model.idNhaCC + "',N'" + model.idLoaiSanPham + "',N'" + model.mauSac + "',N'" + model.giaNhap + "',N'" + model.giaBan + "')";
                        try
                        {
                            dr.Close();
                            dr.Dispose();
                            DataConn.ThucHienCmd(select);
                        
                            return true;
                        }
                        catch
                        {
                            dr.Close();
                            dr.Dispose();
                            return false;
                        }
                        
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

        public Boolean ThemNhanVien(NhanVienModel model)
        {
            String idNV = model.idNhanVien;
            string s = "SELECT IDNhanVien, IDChiNhanh, UserName FROM NhanVien";
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
                        //    dict["PassWord"] = ds.Tables[0].Rows[i]["PassWord"].ToString();
                            dict["DiaChi"] = "";
                            dict["flag"] = (Boolean)ds.Tables[0].Rows[i]["flag"];
                            NhanVienModel model = new NhanVienModel(dict: dict);
                                if ((Boolean)dict["flag"] == true)
                                {
                                    listNV.Add(model);
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
            string s = "SELECT IDPhanHoi, IDKhachHang FROM PhanHoi";
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
                        string select = "INSERT INTO PhanHoi(IDPhanHoi,IDKhachHang,NDPhanHoi,NgayPhanHoi,DiaChiPH) VALUES(N'" + model.idPhanhoi + "',N'" + model.idKhachHang + "',N'" + model.ndPhanHoi + "',N'" + model.ngayPhanhoi + "',N'" + model.diaChi+ "')";
                        DataConn.ThucHienCmd(select);
                        return true;
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

        public NhaCungCapModel traCuuNhaCC(String idNhaCC)
        {
            NhaCungCapModel khModel = new NhaCungCapModel();
            string select = "select * from NhaCungCap where IDNhaCungCap ='" + idNhaCC + "'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDNhaCungCap"] = ds.Tables[0].Rows[0]["IDNhaCungCap"].ToString();
                    dict["TenNhaCC"] = ds.Tables[0].Rows[0]["TenNhaCC"].ToString();
                    dict["DiaChi"] = ds.Tables[0].Rows[0]["DiaChi"].ToString();
                    dict["SDT"] = ds.Tables[0].Rows[0]["SDT"].ToString();
                    dict["Fax"] = ds.Tables[0].Rows[0]["Fax"].ToString();
                    khModel = new NhaCungCapModel(dict: dict);
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

        public Boolean xoaNhaCC(String idNhaCC)
        {
            String select = "UPDATE NhaCungCap SET flag='" + 0 + "' where IDNhaCungCap = '" + idNhaCC + "' ";
            try
            {
                DataConn.ThucHienCmd(select);
                return true;

            }
            catch
            {
                return false;
            }
        }

        public Boolean themNhaCC(NhaCungCapModel model)
        {
            String idNV = model.idNhaCUngCap;
            string s = "SELECT IDNhaCungCap FROM NhaCungCap";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idNhaCUngCap)
                    {
                        MessageBox.Show("Đã có mã nhà cung cấp này! Hãy nhập mã khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        string select = "INSERT INTO NhaCungCap(IDNhaCungCap,TenNhaCC,DiaChi,SDT,Fax) VALUES(N'" + model.idNhaCUngCap + "',N'" + model.tenNhaCC + "',N'" + model.diaChi + "',N'" + model.sdt + "',N'" + model.fax+"')";
                        try
                        {
                            dr.Close();
                            dr.Dispose();
                            DataConn.ThucHienCmd(select);

                            return true;
                        }
                        catch
                        {
                            dr.Close();
                            dr.Dispose();
                            return false;
                        }

                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

        public NhaCungCapModel capNhatNhaCungCap(NhaCungCapModel model)
        {
            String select = "UPDATE NhaCungCap SET TenNhaCC=N'" + model.tenNhaCC + "'" +
               ",DiaChi = '" + model.diaChi + "',SDT = '" + model.sdt + "',Fax = N'" + model.fax + "'" +
           "where IDNhaCungCap = '" + model.idNhaCUngCap + "' ";
            DataConn.ThucHienCmd(select);
            NhaCungCapModel modelSP = new NhaCungCapModel();

            string sql = "select * from NhaCungCap where IDNhaCungCap='" + model.idNhaCUngCap + "'";
            DataSet ds = DataConn.GrdSource(sql);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {

                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDNhaCungCap"] = ds.Tables[0].Rows[0]["IDNhaCungCap"].ToString();
                    dict["TenNhaCC"] = ds.Tables[0].Rows[0]["TenNhaCC"].ToString();
                    dict["DiaChi"] = ds.Tables[0].Rows[0]["DiaChi"].ToString();
                    dict["SDT"] = ds.Tables[0].Rows[0]["SDT"].ToString();
                    dict["Fax"] = ds.Tables[0].Rows[0]["Fax"].ToString();
                    dict["flag"] = ds.Tables[0].Rows[0]["flag"].ToString();

                    modelSP = new NhaCungCapModel(dict: dict);


                    return modelSP;
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

        public List<NhaCungCapModel> danhSachNhaCC()
        {
            List<NhaCungCapModel> listNV = new List<NhaCungCapModel>();
            string select = "SELECT * FROM NhaCungCap";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Dictionary<String, Object> dict = new Dictionary<string, object>();
                        dict["IDNhaCungCap"] = ds.Tables[0].Rows[i]["IDNhaCungCap"].ToString();
                        dict["TenNhaCC"] = ds.Tables[0].Rows[i]["TenNhaCC"].ToString();
                        dict["DiaChi"] = ds.Tables[0].Rows[i]["DiaChi"].ToString();
                        dict["SDT"] = ds.Tables[0].Rows[i]["SDT"].ToString();
                        dict["Fax"] = ds.Tables[0].Rows[i]["Fax"].ToString();
                        dict["flag"] = (Boolean)ds.Tables[0].Rows[i]["flag"];
                        NhaCungCapModel model = new NhaCungCapModel(dict: dict);
                       
                            if ((Boolean)dict["flag"] == true)
                            {
                                listNV.Add(model);
                            }
                        

                    }

                }
            }

            return listNV;
        }
        public ChiNhanhModel traCuuChiNhanh(String idChiNhanh)
        {
            ChiNhanhModel khModel = new ChiNhanhModel();
            string select = "select * from ChiNhanh where IDChiNhanh ='" + idChiNhanh + "'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDNhaCungCap"] = ds.Tables[0].Rows[0]["IDNhaCungCap"].ToString();
                    dict["TenNhaCC"] = ds.Tables[0].Rows[0]["TenNhaCC"].ToString();
                    dict["DiaChi"] = ds.Tables[0].Rows[0]["DiaChi"].ToString();
                    dict["SDT"] = ds.Tables[0].Rows[0]["SDT"].ToString();
                    dict["Fax"] = ds.Tables[0].Rows[0]["Fax"].ToString();
                    khModel = new ChiNhanhModel(data: dict);
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

        public Boolean themChiNhanh(ChiNhanhModel model)
        {

            string s = "SELECT IDChiNhanh, IDKhuVuc FROM ChiNhanh";
            SqlDataReader dr = DataConn.ThucHienReader(s);
            if (dr != null)
            {
                while (dr.Read())
                {
                    if (dr.GetString(0) == model.idCN)
                    {
                        MessageBox.Show("Mã chi nhánh đã tồn tại, Hãy nhập mã khác!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else if (dr.GetString(1) != model.idKV)
                    {
                        MessageBox.Show("Mã khu vực không tồn tại, mời nhập lại!");
                        dr.Close();
                        dr.Dispose();
                        return false;
                    }
                    else
                    {
                        string select = "INSERT INTO PhanHoi(IDChiNhanh,TenChiNhanh,IDKhuVuc,DiaChi,SoLuongNVien) VALUES(N'" + model.idCN + "',N'" + model.tenCN + "',N'" + model.idKV + "',N'" + model.diachi + "',N'" + model.slNV + "')";
                        try
                        {
                            DataConn.ThucHienCmd(select);
                            return true;
                        }
                        catch
                        {
                            return false;
                        }
                    }
                }
            }
            dr.Close();
            dr.Dispose();
            return false;
        }

        public LuongNVModel traCuuLuongNhanVien(String idNV)
        {
            LuongNVModel khModel = new LuongNVModel();
            string select = "select IDNhanVien, b.LuongUng, a.Phat, a.Thuong,a.SoNgayLam, (a.SoNgayLam*b.LuongUng-a.Phat+a.Thuong) as 'LuongNV'from Luong a inner join NghiepVu b on a.IDNghiepVu=b.IDNghiepVu  where IDNhanVien ='" + idNV + "'";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Dictionary<String, Object> dict = new Dictionary<string, object>();
                    dict["IDNhanVien"] = ds.Tables[0].Rows[0]["IDNhanVien"].ToString();
                    dict["LuongUng"] = ds.Tables[0].Rows[0]["LuongUng"].ToString();
                    dict["Phat"] = ds.Tables[0].Rows[0]["Phat"].ToString();
                    dict["Thuong"] = ds.Tables[0].Rows[0]["Thuong"].ToString();
                    dict["SoNgayLam"] = ds.Tables[0].Rows[0]["SoNgayLam"].ToString();
                    dict["LuongNV"] = ds.Tables[0].Rows[0]["LuongNV"].ToString();

                    khModel = new LuongNVModel(dict: dict);
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
        public List<TonKhoModel> thongKeKhoHang(String idKho)
        {
            List<TonKhoModel> khModel = new List<TonKhoModel>();
            string select = "select CTPhieuNhapKho.IDSanPham, sum(SoLuongNhap) -  Sum(SoLuongXuat) as SoLuongTon from"+
                            "((CTPhieuNhapKho inner join PhieuNhapKho on CTPhieuNhapKho.IDPhieuNhap = PhieuNhapKho.IDPhieuNhap)"+
                            "inner join CTPhieuXuatKho on CTPhieuXuatKho.IDSanPham = CTPhieuXuatKho.IDSanPham)"+
                            "inner join PhieuXuatKho on CTPhieuXuatKho.IDPhieuXuat = PhieuXuatKho.IDPhieuXuat"+
                            "where PhieuNhapKho.IDKho = '" + idKho + "' and PhieuXuatKho.IDKho = '" + idKho + "'" +
                            "group by CTPhieuNhapKho.IDSanPham";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i=0;i<ds.Tables[0].Rows.Count;i++){
                        Dictionary<String, Object> dict = new Dictionary<string, object>();
                        dict["IDSanPham"] = ds.Tables[0].Rows[0]["IDSanPham"].ToString();
                        dict["SoLuongTon"] = (int)ds.Tables[0].Rows[0]["SoLuongTon"];
                        TonKhoModel model = new TonKhoModel(dict: dict);
                        khModel.Add(model);
                    }
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

        public List<DoanhSoBanHangModel> doanhsobanhangTheoThang(int thang, int nam)
        {

            List<DoanhSoBanHangModel> khModel = new List<DoanhSoBanHangModel>();
            string select = "select SanPham.IDSanPham, Sum(SoLuong) as SoLuongBan from"+
                            "(SanPham left outer join CTDonMuaHang1 on SanPham.IDSanPham = CTDonMuaHang1.IDSanPham)"+
                            "left outer join DonMuaHang on CTDonMuaHang.IDHoaDon = DonMuaHang1.IDHoaDon"+
                            "where month(NgayMua) = '" + thang + "' and year(NgayMua) ='" + nam + "'" +
                            "group by SanPham.IDSanPham";
            DataSet ds = DataConn.GrdSource(select);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Dictionary<String, Object> dict = new Dictionary<string, object>();
                        dict["IDSanPham"] = ds.Tables[0].Rows[0]["IDSanPham"].ToString();
                        dict["SoLuongBan"] = (int)ds.Tables[0].Rows[0]["SoLuongBan"];
                        DoanhSoBanHangModel model = new DoanhSoBanHangModel(dict: dict);
                        khModel.Add(model);
                    }
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

        public void Logout(String userName)
        {

            Properties.Settings.Default["UserSigning"] = null;
            Properties.Settings.Default.Save(); // Saves settings in application configuration file
        }

        public Boolean updateThongTinNV(NhanVienModel model)
        {
            String select = "UPDATE NHANVIEN SET TenNhanVIen=N'" + model.tenNhanVien + "'" +
                ",IDChiNhanh = '" + model.idChiNhanh + "',SDT = '" + model.sdt + "',Sex = N'" + model.gioitinh + "'" +
            "where IDNhanVien = '" + model.idNhanVien + "' ";
            try
            {

            }
            catch
            {

            }
            DataConn.ThucHienCmd(select);
            return true;
        }
    }
}
