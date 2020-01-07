using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class KhachHangModel
    {

      public  int errorCode { get; set; }
      public string message { get; set; }

      public string idKH { get; set; }
      public string tenKH { get; set; }
      public string diachi { get; set; }
      public string sodienthoai { get; set; }
      public  Boolean gioitinh { get; set; }
        public KhachHangModel()
        {

        }
        public KhachHangModel(int errorCode, string message, string idKH, string tenKH, string diachi, string sodienthoai, Boolean gioitinh)
        {
            this.errorCode = errorCode;
                this.message = message;
            this.idKH = idKH;
            this.tenKH = tenKH;
            this.diachi = diachi;
            this.sodienthoai = sodienthoai;
            this.gioitinh = gioitinh;
        }

        public KhachHangModel(Dictionary<String, Object> data)
        {
            this.errorCode = (int)data["errorCode"];
            this.message = (string)data["message"];
            this.idKH = (string)data["IDKhachHang"];
            this.tenKH = (string)data["TenKhachHang"];
            this.diachi = (string)data["DiaChi"];
            this.sodienthoai = (string)data["SoDienThoai"];
            this.gioitinh = (Boolean)data["GioiTinh"];
        }
    }
}
