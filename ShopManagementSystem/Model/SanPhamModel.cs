using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem.Model
{
    class SanPhamModel
    {
        public String idSanPham { get; set; }
        public String tenSanPham { get; set; }
        public String idNhaCC { get; set; }
        public String idLoaiSanPham { get; set; }
        public String mauSac { get; set; }
        public String giaNhap { get; set; }

        public String giaBan { get; set; }

        public SanPhamModel()
        {

        }

        public SanPhamModel(Dictionary<String, Object> dict)
        {
            this.idSanPham = (String)dict["IDSanPham"];
            this.tenSanPham = (String)dict["TenSanPham"];
            this.idNhaCC = (String)dict["IDNhaCC"];
            this.idLoaiSanPham = (String)dict["IDLoaiSanPham"];
            this.mauSac = (String)dict["MauSac"];
            this.giaNhap = (String)dict["MauSac"];
            this.giaBan = (String)dict["MauSac"];


        }
    }
}
