using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class NhanVienModel
    {
        public String idNhanVien { get; set; }
        public String tenNhanVien { get; set; }
        public String idChiNhanh  { get; set; }
        public String sdt { get; set; }
        public String gioitinh { get; set; }
        public String userName { get; set; }
        public String passWord { get; set; }

        public NhanVienModel()
        {

        }

        public NhanVienModel(Dictionary<String, Object> dict) {
            this.idNhanVien = (String)dict["IDNhanVien"];
            this.tenNhanVien = (String)dict["TenNhanVien"];
            this.sdt = (String)dict["SDT"];
            this.gioitinh = (String)dict["Sex"];
            this.idNhanVien = (String)dict["IDNhanVien"];
            this.idChiNhanh = (String)dict["IDChiNhanh"];
            this.userName = (String)dict["UserName"];
            this.passWord = (String)dict["PassWord"];
        }
    }
}
