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
    public partial class InHoaDon : Form
    {

        private Service svc = new Service();
        public InHoaDon()
        {
            InitializeComponent();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtMaHD.Text.Length == 0)
            {
                MessageBox.Show(text: "Bạn chưa nhập mã hóa đơn, xin thử lại!!!");
            }
            else
            {
                HoaDonModel model = svc.traCuuHoaDon(idHD: txtMaHD.Text);
                grdView.DataSource = model;
                grdView.Refresh();
            }
        }

 


    }
}
