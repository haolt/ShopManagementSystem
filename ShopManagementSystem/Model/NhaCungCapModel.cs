using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class NhaCungCapModel
    {
        public String idNhaCUngCap { get; set; }
        public String tenNhaCC { get; set; }
        public String diaChi { get; set; }
        public String sdt { get; set; }
        public String fax { get; set; }

        public NhaCungCapModel()
        {

        }

        public NhaCungCapModel(Dictionary<String, Object> dict)
        {
            this.idNhaCUngCap = (String)dict["IDNhaCungCap"];
            this.tenNhaCC = (String)dict["TenNhaCC"];
            this.diaChi = (String)dict["DiaChi"];
            this.sdt = (String)dict["SDT"];
            this.fax = (String)dict["Fax"]; 

        }
    }
}
