using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class HoaDonModel
    {
       public String idHD { get; set; }
       public String idKH { get; set; }
       public String idNhanVien { get; set; }
       public List<CTDonMuaHang> data { get; set; }
       public String ngaythang { get; set; }

       public String tenKH { get; set; }

       public HoaDonModel()
       {

       }

       public HoaDonModel(String idHD, String idKH, String idNhanVien, List<CTDonMuaHang> data, String ngaythang)
       {
           this.idHD = idHD;
           this.idKH = idKH;
           this.idNhanVien = idNhanVien;
           this.data = data;
           this.ngaythang = ngaythang;
       }

        public HoaDonModel(Dictionary<String, Object> dict) {
            this.idHD = (String)dict["IDHoaDon"];
            this.idKH = (String)dict["IDKhachHang"];
            this.idNhanVien = (String)dict["IDNhanVien"];
            this.data = (List<CTDonMuaHang>)dict["data"];
            this.ngaythang = (String)dict["NgayThang"];
            this.tenKH = (String)dict["TenKhachHang"];
        }

    }
}
