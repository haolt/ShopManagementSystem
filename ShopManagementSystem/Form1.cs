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

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            login(userName: txtName.Text.Trim(), password: txtPhoneNumber.Text.Trim());  
            //frmTableManagement f = new frmTableManagement();
         //   this.Hide();
            // Asynct Steps
          //  f.ShowDialog();
          //  this.Show();
        }

    

        private void login(String userName, String password)
        {
            loginModel = ser.login(userName: userName, password: password);
         if (loginModel.getErrorCode() == 0)
         {
            frmTableManagement f = new frmTableManagement();
               this.Hide();
           //  Asynct Steps
              f.ShowDialog();
              this.Show();
         }
         else
         {
           Console.WriteLine(loginModel.getMessage());
         }
          //  String sql = "select * from NhanVien";
         //   SqlCommand com = new SqlCommand(sql, con);
         //   com.CommandType = CommandType.Text;
          //  SqlDataAdapter da = new SqlDataAdapter(com);
         //   DataTable dt = new DataTable();
          //  da.Fill(dt);
        //    con.Close();
         //   Console.WriteLine(dt);
        }
    }
}
