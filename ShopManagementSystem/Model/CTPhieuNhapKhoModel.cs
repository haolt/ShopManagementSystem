using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class CTPhieuNhapKhoModel
    {
       public String idSanPham { get; set; }
       public int soluongNhap { get; set; }


       public CTPhieuNhapKhoModel()
       {

       }
       public CTPhieuNhapKhoModel(String idSanPham, int soluongNhap)
       {
           this.idSanPham = idSanPham;
           this.soluongNhap = soluongNhap;
       }
       public CTPhieuNhapKhoModel(Dictionary<String, Object> dict)
       {
           this.idSanPham = (String)dict["IDSanPham"];
           this.soluongNhap = (int)dict["SoLuongNhap"];
       }
    }
}
