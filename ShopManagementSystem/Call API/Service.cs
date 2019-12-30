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
    class Service
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-T6MTVBD\SQLEXPRESS;Initial Catalog=QL_BanHang15;Integrated Security=True");
        public LoginModel login(String userName, String password)
        {
             LoginModel model = new LoginModel();

            String sql = "select * from NhanVien where userName = '" + userName+"' and password ='" + password +"'";
            SqlCommand com = new SqlCommand(sql, con);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                UserInfoModel user = new UserInfoModel();
                LoginModel mod = new LoginModel(errrorCode: 0, message: "Thành công", user: user, status: "");
                return mod;
            }
            else
            {
                UserInfoModel user = null;
                LoginModel mod = new LoginModel(errrorCode: 1, message: "Sai tên đăng nhập hoặc mật khẩu", user: user, status: "false");
                return mod;
            }
            con.Close();
            Console.WriteLine(dt);


         return model;
        }
    }
}
