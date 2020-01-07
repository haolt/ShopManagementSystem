using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class PhanHoiModel
    {
       public String idPhanhoi  {get; set;}
       public String idKhachHang { get; set; }
       public String ndPhanHoi { get; set; }
       public String ngayPhanhoi { get; set; }
       public String diaChi { get; set; }

       public PhanHoiModel()
       {

       }

       public PhanHoiModel(Dictionary<String, Object> dict)
       {
           this.idPhanhoi = (String)dict["IDPhanHoi"];
           this.idKhachHang = (String)dict["IDKhachHang"];
           this.ndPhanHoi = (String)dict["NDPhanHoi"];
           this.ngayPhanhoi = (String)dict["NgayPhanHoi"];
           this.diaChi = (String)dict["DiaChiPH"];

       }
    }
}
