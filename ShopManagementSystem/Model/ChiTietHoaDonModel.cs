using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class ChiTietHoaDonModel
    {
        public String maHD { get; set; }
        public String tenSP { get; set; }
        public int soluong { get; set; }
        public int giaTien { get; set; }
        public ChiTietHoaDonModel()
        {

        }

        public ChiTietHoaDonModel(Dictionary<String, Object> dict) {
            this.maHD = (String)dict["IDHoaDon"];
            this.tenSP = (String)dict["TenSanPham"];
            this.soluong = (int)dict["SoLuong"];
            this.giaTien = (int)dict["GiaBan"];

        }


    }
}
