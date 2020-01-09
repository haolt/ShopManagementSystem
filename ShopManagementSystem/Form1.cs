using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ShopManagementSystem
{
    public partial class fLogin : Form
    {

        Service ser = new Service();
        LoginModel loginModel = new LoginModel();
        public fLogin()
        {
            InitializeComponent();
          //  connectDB();
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void FLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn thật sự muốn thoát chương trình?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }

    

        private void loginNV(String userName, String password)
        {
            loginModel = ser.login(userName: userName, password: password);
         if (loginModel.getErrorCode() == 0)
         {
            frmTableManagement f = new frmTableManagement();
               this.Hide();
              f.ShowDialog();
              this.Show();
         }
         else
         {
             MessageBox.Show(loginModel.getMessage());
         }
        }

        private void loginQL(String userName, String password)
        {
            loginModel = ser.qlLogin(userName: userName, passWord: password);
            if (loginModel.getErrorCode() == 0)
            {
                frmTableManagement f = new frmTableManagement();
                this.Hide();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show(loginModel.getMessage());
            }
        }

        private void fLogin_Load(object sender, EventArgs e)
        {

        }


        private void btnLoginNV_Click(object sender, EventArgs e)
        {
            loginNV(userName: txtUserNameNV.Text.Trim(), password: txtPassNV.Text.Trim());  
        }

        private void LoginBtnQL_Click(object sender, EventArgs e)
        {
            loginQL(userName: txtUserNameQL.Text.Trim(), password: txtPassQL.Text.Trim());  

        }
    }
}
