﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopManagementSystem
{
    class ChiNhanhModel
    {
        string idCN { get; set;}
        string tenCN { get; set; }
        string idKV { get; set; }
        string diachi { get; set; }
        int slNV { get; set; }

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
