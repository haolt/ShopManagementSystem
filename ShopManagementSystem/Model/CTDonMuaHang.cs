using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class CTDonMuaHang
    {
        string idHoaDon { get; set; }
        string idSanPham { get; set; }
        int soLuong { get; set; }
        string giaBan { get; set; }

        public CTDonMuaHang()
        {

        }

        public CTDonMuaHang(string idHoaDon, string idSanPham, int soLuong, string giaBan)
        {
            this.idHoaDon = idHoaDon;
            this.idSanPham = idSanPham;
            this.soLuong = soLuong;
            this.giaBan = giaBan;
        }

        public CTDonMuaHang(Dictionary<String, Object> dict)
        {
            this.idHoaDon = (string)dict["IDHoaDon"];
            this.idSanPham = (string)dict["IDSanPham"];
            this.soLuong = (int)dict["SoLuong"];
            this.giaBan = (string)dict["GiaBan"];
        }
    }
}
