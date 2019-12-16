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
    public partial class frmTableManagement : Form
    {
        public frmTableManagement()
        {
            InitializeComponent();
        }

        private void BtnLogout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BtnAccountProfile_Click(object sender, EventArgs e)
        {
            fAccountProfile _fAccountProfile = new fAccountProfile();
            _fAccountProfile.ShowDialog();
        }

        private void AdminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdminView _fAdminView = new fAdminView();
            _fAdminView.ShowDialog();
        }

        private void AdminToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            fAdminView _fAdminView = new fAdminView();
            _fAdminView.ShowDialog();
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Thanh toán thành công!");
        }
    }
}
