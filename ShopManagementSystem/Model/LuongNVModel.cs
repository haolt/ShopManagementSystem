using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class LuongNVModel
    {

        public String idNV { get; set; }
        public String soNgayLam { get; set; }
        public String luongUng { get; set; }
        public String phat { get; set; }
        public String thuong { get; set; }
        public String luongNV { get; set; }


    //    a.SoNgayLam*b.LuongUng-a.Phat+a.Thuong
        public LuongNVModel()
        {

        }

        public LuongNVModel(Dictionary<String, Object> dict)
        {
            this.idNV = (String)dict["IDNhanVien"];
            this.luongNV = (String)dict["LuongNV"];
            this.soNgayLam = (String)dict["SoNgayLam"];
            this.luongUng = (String)dict["LuongUng"];
            this.phat = (String)dict["Phat"];
            this.thuong = (String)dict["Thuong"];


        }
    }
}
