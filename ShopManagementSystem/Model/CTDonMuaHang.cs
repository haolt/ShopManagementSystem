using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class CTDonMuaHang
    {
        string idSanPham { get; set; }

        string tenSP { get; set; }

        int soLuong { get; set; }
        string giaBan { get; set; }

        public CTDonMuaHang()
        {

        }


        public CTDonMuaHang(Dictionary<String, Object> dict)
        {
            this.idSanPham = (string)dict["IDSanPham"];
            this.soLuong = (int)dict["SoLuong"];
            this.giaBan = (string)dict["GiaBan"];
            this.tenSP = (string)dict["TenSanPham"];
        }
    }
}
