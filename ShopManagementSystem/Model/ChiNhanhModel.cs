using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class ChiNhanhModel
    {
       public string idCN { get; set;}
       public string tenCN { get; set; }
       public string idKV { get; set; }
       public string diachi { get; set; }
       public int slNV { get; set; }

        public ChiNhanhModel()
        {

        }

        public ChiNhanhModel(string idCN, string tenCN, string idKV, string diachi, int slNV)
        {
            this.idCN = idCN;
            this.tenCN = tenCN;
            this.idKV = idKV;
            this.diachi = diachi;
            this.slNV = slNV;

        }

        public ChiNhanhModel(Dictionary<String, Object> data) {
            this.idCN = (string)data["IDChiNhanh"];
            this.tenCN = (string)data["TenChiNhanh"];
            this.idKV = (string)data["IDKhuVuc"];
            this.diachi = (string)data["DiaChi"];
            this.slNV = (int)data["SoLuongNVien"];
        }
    }
}
