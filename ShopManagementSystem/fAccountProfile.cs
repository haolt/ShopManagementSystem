using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ShopManagementSystem
{
    public partial class fAccountProfile : Form
    {
        private String idNV = (String)Properties.Settings.Default["UserSigning"];
        private Service svc = new Service();
        public fAccountProfile()
        {
            InitializeComponent();
            getDataInfo();

        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            NhanVienModel model = new NhanVienModel();
            model.idNhanVien = txtID.Text;
            model.tenNhanVien = txtName.Text;
            model.idChiNhanh = txtChiNhanh.Text;
            model.gioitinh = txtGioiTinh.Text;
            model.sdt = txtSDT.Text;
            Boolean kt = svc.updateThongTinNV(model: model);
            if (kt == true)
            {
                MessageBox.Show("Cập nhật thông tin thành công");
            }
            else
            {
                MessageBox.Show("Cập nhật thông tin thất bại");
            }
            this.Refresh();
        }

        private void BtnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void getDataInfo()
        {
          NhanVienModel  model = svc.traCuuThongTinNhanVien(idNV: idNV);
            txtID.Text = model.idNhanVien;
            txtName.Text = model.tenNhanVien;
            txtSDT.Text = model.sdt;
            txtChiNhanh.Text = model.idChiNhanh;
            txtGioiTinh.Text = model.gioitinh;
            
        }



    }
}
