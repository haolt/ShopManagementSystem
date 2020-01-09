using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class TonKhoModel
    {
        public String idSanPham { get; set; }
        public int soluongTK { get; set; }

        public TonKhoModel()
        {

        }
        public TonKhoModel(Dictionary<String, Object> dict)
        {
            this.idSanPham = (String)dict["IDSanPham"];
            this.soluongTK = (int)dict["SoLuongTon"];

        }
    }
}
