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
    public partial class fAdminView : Form
    {
        private String idSPCurrent { get; set; }
        private String idNVCurrent { get; set; }
        private String idNCCCurrent { get; set; }
        private String idCNCurrent { get; set; }
        private String idKhoCurrent { get; set; }
        private String idKHCurrent { get; set; }


        Service svc = new Service();
        ConfirmDialog dialog = new ConfirmDialog();
        int currentTabIndex;
        public fAdminView()
        {
            InitializeComponent();
            showListSP();
        }

        public void showListSP()
        {
            grcViewSP.DataSource = svc.traCuuSanPham();
            grcViewSP.Refresh();
        }

        public void showListNV()
        {
            grcViewNV.DataSource = svc.danhSachNhanVien(isGetDeletedNV: false);
            grcViewNV.Refresh();
        }
        public void showListNCC()
        {
            grcViewNCC.DataSource = svc.danhSachNhaCC();
            grcViewNCC.Refresh();
        }
        public void showListCN()
        {
            grcViewCN.DataSource = svc.traCuuSanPham();
            grcViewCN.Refresh();
        }
        public void showListKho()
        {
            grcViewKho.DataSource = svc.traCuuSanPham();
            grcViewKho.Refresh();
        }
        public void showListKH()
        {
            grcViewKH.DataSource = svc.traCuuSanPham();
            grcViewKH.Refresh();
        }
    

        private void btnTimKiemSP_Click(object sender, EventArgs e)
        {
            if (txtTimKiemSP.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã sản phẩm!!!");
            }
            else
            {
                SanPhamModel spModel = svc.traCuuSanPham(idSP: txtTimKiemSP.Text);
                if (spModel == null)
                {
                    MessageBox.Show("Sản phẩm không tồn tại hoặc đã bị xóa. Mời nhập lại!!!!");
                }
                else
                {
                    bindDataToViewSP(spModel: spModel);
                }
            }
        }

        private void bindDataToViewSP(SanPhamModel spModel)
        {
            txtMaSP.Text = spModel.idSanPham;
            txtTenSP.Text = spModel.tenSanPham;
            txtMaLoaiSP.Text = spModel.idLoaiSanPham;
            txtMaNCCSP.Text = spModel.idNhaCC;
            txtGiaNhapSP.Text = spModel.giaNhap;
            txtGiaBanSP.Text = spModel.giaBan;
        }
        private void bindDataToViewNV(NhanVienModel spModel)
        {
            txtMaNV.Text = spModel.idNhanVien;
            txtTenNV.Text = spModel.tenNhanVien;
            txtMaCNNV.Text = spModel.idChiNhanh;
            txtSDTNV.Text = spModel.sdt;
            txtDiaChiNV.Text = spModel.diaChi;
            txtgioiTinhNV.Text = spModel.gioitinh;
        }
        private void bindDataToViewNCC(NhaCungCapModel spModel)
        {
            txtMaNCC.Text = spModel.idNhaCUngCap;
            txtTenNCC.Text = spModel.tenNhaCC;
            txtDiaChiNCC.Text = spModel.diaChi;
            txtSDTNCC.Text = spModel.sdt;
            txtFaxNCC.Text = spModel.fax;
        }

        private void grcViewNCC_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                idCNCurrent = grcViewNCC.SelectedRows[0].Cells[0].Value.ToString();
            }
            catch
            {

            }
        }

        private void grcViewSP_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                idSPCurrent = grcViewSP.SelectedRows[0].Cells[0].Value.ToString();
            }
            catch
            {

            }
         
        }

        private void btnCapNhatSP_Click(object sender, EventArgs e)
        {
            SanPhamModel model = new SanPhamModel();
            model.idSanPham = txtMaSP.Text;
            model.idLoaiSanPham = txtMaLoaiSP.Text;
            model.idNhaCC = txtMaNCCSP.Text;
            model.tenSanPham = txtTenSP.Text;
            model.mauSac = txtMauSacSP.Text;
            model.giaBan = txtGiaBanSP.Text;
            model.giaNhap = txtGiaNhapSP.Text;
            SanPhamModel spModel = svc.capNhatSanPham(model: model);
            if (spModel == null)
            {
                MessageBox.Show("Sản phẩm không tồn tại hoặc đã bị xóa, mời nhập lại");
            }
            else
            {
                MessageBox.Show("Cập nhật sản phẩm thành công!");
                showListSP();
            }
        }

        private void btnXemSP_Click(object sender, EventArgs e)
        {
            if (idSPCurrent.Length > 0)
            {
                txtMaSP.Enabled = false;
                txtTenSP.Enabled = false;
                txtMaLoaiSP.Enabled = false;
                txtMaNCCSP.Enabled = false;
                txtGiaNhapSP.Enabled = false;
                txtGiaBanSP.Enabled = false;
                btnCapNhatSP.Enabled = false;
                btnThemSP.Enabled = false;
                SanPhamModel spModel = svc.traCuuSanPham(idSP: idSPCurrent);
                bindDataToViewSP(spModel: spModel);
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn sản phẩm để xóa!!!");
            }
            
        }

        private void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            dialog = new ConfirmDialog(textConfirm: "Bạn có chắc chắn muốn xóa sản phẩm không?");
            if (dialog.ShowDialog() == DialogResult.OK) {
                 if (idSPCurrent.Length > 0) {
                Boolean kt = svc.xoaSanPham(idSPCurrent);
                if (kt == true)
                {
                    MessageBox.Show("Xóa sản phẩm thành công!!!", idSPCurrent);
                    showListSP();
                }
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn sản phẩm để xóa!!!");
            }
            }
           
        }

        private void btnEditProduct_Click(object sender, EventArgs e)
        {
            if (idSPCurrent.Length > 0) {
            txtMaSP.Enabled = true;
            txtTenSP.Enabled = true;
            txtMaLoaiSP.Enabled = true;
            txtMaNCCSP.Enabled = true;
            txtGiaNhapSP.Enabled = true;
            txtGiaBanSP.Enabled = true;
            btnCapNhatSP.Enabled = true;
            btnThemSP.Enabled = true;
            SanPhamModel spModel = svc.traCuuSanPham(idSP: idSPCurrent);
            bindDataToViewSP(spModel: spModel);
            } else {
                 MessageBox.Show("Bạn chưa chọn sản phẩm để sửa!!!");
            }
        }
        private void btnThemSP_Click(object sender, EventArgs e)
        {
            if (txtMaSP.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã sản phẩm!!!");
            }
            else
            {
                SanPhamModel model = new SanPhamModel();
                model.idSanPham = txtMaSP.Text;
                model.idLoaiSanPham = txtMaLoaiSP.Text;
                model.idNhaCC = txtMaNCCSP.Text;
                model.tenSanPham = txtTenSP.Text;
                model.mauSac = txtMauSacSP.Text;
                model.giaBan = txtGiaBanSP.Text;
                model.giaNhap = txtGiaNhapSP.Text;
                Boolean kt = svc.ThemSanPham(model: model);
                if (kt == true)
                {
                    MessageBox.Show("Thêm sản phẩm thành công");
                    showListSP();
                }
                else
                {
                    MessageBox.Show("Thêm sản phẩm thất bại");
                }
            }
        }
        // Tab Nhân Viên
        private void btnXemNV_Click(object sender, EventArgs e)
        {
            if (idNVCurrent.Length > 0)
            {

                txtMaNV.Enabled = false;
                txtTenNV.Enabled = false;
                txtMaCNNV.Enabled = false;
                txtSDTNV.Enabled = false;
                txtDiaChiNV.Enabled = false;
                txtgioiTinhNV.Enabled = false;
                btnThemNV.Enabled = false;
                btnCapNhatNV.Enabled = false;
                NhanVienModel spModel = svc.traCuuThongTinNhanVien(idNV: idNVCurrent);
                bindDataToViewNV(spModel: spModel);
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn sản phẩm để xóa!!!");
            }
        }



        private void btnSuaNV_Click(object sender, EventArgs e)
        {
            if (idNVCurrent.Length > 0)
            {
                txtMaSP.Enabled = true;
                txtTenSP.Enabled = true;
                txtMaLoaiSP.Enabled = true;
                txtMaNCCSP.Enabled = true;
                txtGiaNhapSP.Enabled = true;
                txtGiaBanSP.Enabled = true;
                btnCapNhatSP.Enabled = true;
                btnThemSP.Enabled = true;
                NhanVienModel spModel = svc.traCuuThongTinNhanVien(idNV: idNVCurrent);
                bindDataToViewNV(spModel: spModel);
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn sản phẩm để sửa!!!");
            }
        }

        private void btnXoaNV_Click(object sender, EventArgs e)
        {
            dialog = new ConfirmDialog(textConfirm: "Bạn có chắc chắn muốn xóa\n nhân viên này không?");
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                if (idNVCurrent.Length > 0)
                {
                    Boolean kt = svc.xoaNhanVien(idNV: idNVCurrent);
                    if (kt == true)
                    {
                        MessageBox.Show("Xóa nhân viên %s thành công!!!", idNVCurrent);
                        showListNV();
                    }
                }
                else
                {
                    MessageBox.Show("Bạn chưa chọn nhân viên để xóa!!!");
                }
            }
        }

        private void btnTimKiemNV_Click(object sender, EventArgs e)
        {
            if (txtNV.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã nhân viên!!!");
            }
            else
            {
                NhanVienModel spModel = svc.traCuuThongTinNhanVien(idNV: txtNV.Text);
                if (spModel == null)
                {
                    MessageBox.Show("Mã nhân viên không tồn tại hoặc đã bị xóa. Mời nhập lại!!!!");
                }
                else
                {
                    bindDataToViewNV(spModel: spModel);
                }
            }
        }
        private void btnThemNV_Click(object sender, EventArgs e)
        {
            if (txtMaSP.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã nhân viên!!!");
            }
            else
            {
                NhanVienModel model = new NhanVienModel();
                model.idNhanVien = txtMaNV.Text;
                model.tenNhanVien = txtTenNV.Text;
                model.idChiNhanh = txtMaCNNV.Text;
                model.sdt = txtSDTNV.Text;
                model.gioitinh = txtgioiTinhNV.Text;
                model.diaChi = txtDiaChiNV.Text;
                Boolean kt = svc.ThemNhanVien(model: model);
                if (kt == true)
                {
                    MessageBox.Show("Thêm sản phẩm thành công");
                    showListNV();
                }
                else
                {
                    MessageBox.Show("Thêm nhân viên thất bại");
                }
            }
        }

        private void btnCapNhatNV_Click(object sender, EventArgs e)
        {
            NhanVienModel model = new NhanVienModel();
            model.idNhanVien = txtMaNV.Text;
            model.tenNhanVien = txtTenNV.Text;
            model.idChiNhanh = txtMaCNNV.Text;
            model.sdt = txtSDTNV.Text;
            model.gioitinh = txtgioiTinhNV.Text;
            model.diaChi = txtDiaChiNV.Text;
            Boolean kt = svc.updateThongTinNV(model: model);
            if (kt == false)
            {
                MessageBox.Show("Nhân Viên không tồn tại hoặc đã bị xóa, mời nhập lại");
            }
            else
            {
                MessageBox.Show("Cạp nhật thông tin nhân viên thành công!");
                showListNV();
            }
        }

        private void tabs_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TabPage current = (sender as TabControl).SelectedTab;
           // current.
            // Validate the current page. To cancel the select, use:
        }

        private void tabsView_Selecting(object sender, TabControlCancelEventArgs e)
        {
            currentTabIndex = (sender as TabControl).SelectedIndex ;
            if (currentTabIndex == 0)
            {
                showListSP();
            }
            else if (currentTabIndex == 1)
            {
                showListNV();
            }
            else if (currentTabIndex == 2)
            {
                showListNCC();
            }
            else if (currentTabIndex == 1)
            {

            }
            else if (currentTabIndex == 1)
            {

            }
            else if (currentTabIndex == 1)
            {

            }
            else if (currentTabIndex == 1)
            {

            }
            // Validate the current page. To cancel the select, use:
            e.Cancel = false;
        }

        private void grcViewNV_SelectionChanged(object sender, EventArgs e)
        {
            try
            {

                idNVCurrent = grcViewNV.SelectedRows[0].Cells[0].Value.ToString();
            }
            catch
            {

            }
        }

        private void btnXemNCC_Click(object sender, EventArgs e)
        {
            if (idCNCurrent.Length > 0)
            {

                txtMaNCC.Enabled = false;
                txtTenNCC.Enabled = false;
                txtDiaChiNCC.Enabled = false;
                txtSDTNCC.Enabled = false;
                txtFaxNCC.Enabled = false;
                btnThemNCC.Enabled = false;
                btnCapNhatNCC.Enabled = false;
                NhaCungCapModel spModel = svc.traCuuNhaCC(idNhaCC: idCNCurrent);
                bindDataToViewNCC(spModel: spModel);
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn nhà cung cấp để xóa!!!");
            }
        }


        private void btnSuaNCC_Click(object sender, EventArgs e)
        {
            if (idCNCurrent.Length > 0)
            {
                txtMaNCC.Enabled = true;
                txtTenNCC.Enabled = true;
                txtDiaChiNCC.Enabled = true;
                txtSDTNCC.Enabled = true;
                txtFaxNCC.Enabled = true;
                btnCapNhatNCC.Enabled = true;
                btnThemNCC.Enabled = true;
                NhaCungCapModel spModel = svc.traCuuNhaCC(idNhaCC: idCNCurrent);
                bindDataToViewNCC(spModel: spModel);
            }
            else
            {
                MessageBox.Show("Bạn chưa chọn nhà cung cấp để sửa!!!");
            }
           
        }

        private void btnXoaNCC_Click(object sender, EventArgs e)
        {
            dialog = new ConfirmDialog(textConfirm: "Bạn có chắc chắn muốn xóa\n nhà cung cấp này không?");
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                if (idCNCurrent.Length > 0)
                {
                    Boolean kt = svc.xoaNhaCC(idNhaCC: idCNCurrent);
                    if (kt == true)
                    {
                        MessageBox.Show("Xóa nhà cung cấp %s thành công!!!", idCNCurrent);
                        showListNCC();
                    }
                }
                else
                {
                    MessageBox.Show("Bạn chưa chọn nhà cung cấp để xóa!!!");
                }
            }
        }

        private void btnTimKiemNCC_Click(object sender, EventArgs e)
        {
            if (txtNCC.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã nhà cung cấp!!!");
            }
            else
            {
                txtMaNCC.Enabled = false;
                txtTenNCC.Enabled = false;
                txtDiaChiNCC.Enabled = false;
                txtSDTNCC.Enabled = false;
                txtFaxNCC.Enabled = false;
                btnThemNCC.Enabled = false;
                btnCapNhatNCC.Enabled = false;
                NhaCungCapModel spModel = svc.traCuuNhaCC(idNhaCC: txtNCC.Text);
                if (spModel == null)
                {
                    MessageBox.Show("Sản phẩm không tồn tại hoặc đã bị xóa. Mời nhập lại!!!!");
                }
                else
                {
                    bindDataToViewNCC(spModel: spModel);
                }
            }
        }

        private void btnDongNCC_Click(object sender, EventArgs e)
        {
            if (txtMaNCC.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập mã nhân viên!!!");
            }
            else
            {
                NhaCungCapModel model = new NhaCungCapModel();
                model.idNhaCUngCap = txtMaNCC.Text;
                model.tenNhaCC = txtTenNCC.Text;
                model.diaChi = txtDiaChiNCC.Text;
                model.sdt = txtSDTNCC.Text;
                model.fax = txtFaxNCC.Text;
                Boolean kt = svc.themNhaCC(model: model);
                if (kt == true)
                {
                    MessageBox.Show("Thêm nhà cung cấp thành công");
                    showListNCC();
                }
                else
                {
                    MessageBox.Show("Thêm nhà cung cấp thất bại");
                }
            }
        }

        private void btnCapNhatNCC_Click(object sender, EventArgs e)
        {
            NhaCungCapModel model = new NhaCungCapModel();
            model.idNhaCUngCap = txtMaNCC.Text;
            model.tenNhaCC = txtTenNCC.Text;
            model.diaChi = txtDiaChiNCC.Text;
            model.sdt = txtSDTNCC.Text;
            model.fax = txtFaxNCC.Text;
            NhaCungCapModel kt = svc.capNhatNhaCungCap(model: model);
            if (kt == null)
            {
                MessageBox.Show("Nhà cung cấp không tồn tại hoặc đã bị xóa, mời nhập lại");
            }
            else
            {
                MessageBox.Show("Cập nhật thông tin nhà cung cấp thành công!");
                showListNCC();
            }
        }

        
    }
}
