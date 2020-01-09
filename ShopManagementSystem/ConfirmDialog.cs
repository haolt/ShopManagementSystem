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
    public partial class ConfirmDialog : Form
    {
        public ConfirmDialog()
        {
            InitializeComponent();
        }

        public ConfirmDialog(String textConfirm)
        {
            InitializeComponent();
            confirmLb.Text = textConfirm;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnConfirm_Click(object sender, EventArgs e)
        {
            this.AcceptButton = btnConfirm;
        }
    }
}
