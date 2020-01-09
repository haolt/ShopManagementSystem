using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class KhuVucModel
    {
        public String idKV { get; set; }
        public String tenKV {get; set; }
        public int slChiNhanh { get; set; }
        public String idQuanLy { get; set; }
        public String toaDo { get; set; }

        public KhuVucModel()
        {

        }

        public KhuVucModel(Dictionary<String, Object> dict)
        {
            this.idKV = (String)dict["IDKhuVuc"];
            this.tenKV = (String)dict["TenKhuVuc"];
            this.slChiNhanh = (int)dict["SoLuongChiNhanh"];
            this.idQuanLy = (String)dict["IDQuanLy"];
            this.toaDo = (String)dict["ToaDo"];

        }
    }
}
