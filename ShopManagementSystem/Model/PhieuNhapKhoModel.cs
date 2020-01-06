using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class PhieuNhapKhoModel
    {
        public String idPhieuNhap { get; set; }
        public String idNhanVien { get; set; }
        public String idKho { get; set; }

        public List<CTPhieuNhapKhoModel> listSP;

        public PhieuNhapKhoModel()
        {

        }

        public PhieuNhapKhoModel(Dictionary<String, Object> dict)
        {
            this.idPhieuNhap = (String)dict["IDPhieuNhap"];
            this.idNhanVien = (String)dict["IDNhanVien"];
            this.idKho = (String)dict["IDKho"];
            this.listSP = (List<CTPhieuNhapKhoModel>)dict["data"];
        }
    }
}
