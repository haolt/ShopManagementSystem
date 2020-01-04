using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem.Model
{
    class SanPhamModel
    {
        public String idSanPham;
        public String tenSanPham;
        public String idNhaCC;
        public String idLoaiSanPham;
        public String mauSac;
        public String giaThanh;

        public SanPhamModel()
        {

        }

        public SanPhamModel(string idSanPham, string tenSanPham, string idNhaCC, string idLoaiSanPham, string mauSac)
        {
            this.idSanPham = idSanPham;
            this.tenSanPham = tenSanPham;
            this.idNhaCC = idNhaCC;
            this.idLoaiSanPham = idSanPham;
            this.mauSac = mauSac;
        }

        public SanPhamModel(Dictionary<String, Object> dict)
        {
            this.idSanPham = (String)dict["IDSanPham"];
            this.tenSanPham = (String)dict["TenSanPham"];
            this.idNhaCC = (String)dict["IDNhaCC"];
            this.idLoaiSanPham = (String)dict["IDLoaiSanPham"];
            this.mauSac = (String)dict["MauSac"];

        }
    }
}
