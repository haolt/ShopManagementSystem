
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class DoanhSoBanHangModel
    {
      public  String idSanPham { get; set; }
      public int soLuongBan { get; set; }


        public DoanhSoBanHangModel()
        {

        }
        public DoanhSoBanHangModel(Dictionary<String, Object> dict)
        {
            this.idSanPham = (String)dict["IDSanPham"];
            this.soLuongBan = (int)dict["SoLuongBan"];

        }
    }
}
