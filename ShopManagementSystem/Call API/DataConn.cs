using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ShopManagementSystem
{
    class DataConn
    {
        private static string source;
        private static SqlConnection con;
        private static SqlCommand cmd;
        private static SqlDataAdapter da;
        private static DataSet ds;
        static DataConn()
        {

            con = new SqlConnection(@"Data Source=DESKTOP-T6MTVBD\SQLEXPRESS;Initial Catalog=QL_BanHang15;Integrated Security=True");
            try
            {
                con.Open();
            }
            catch (SqlException)
            {
                MessageBox.Show("Lỗi cơ sở dữ liệu! Hãy xem trợ giúp!");
            }
        }
        public static void DongKetNoi()
        {
            cmd.Dispose();
            try
            {
                con.Close();
            }
            catch (SqlException)
            {
                MessageBox.Show("Lỗi cơ sở dữ liệu! Hãy xem trợ giúp!");
            }
            finally
            {
                con.Dispose();
            }
        }
        public static void ThucHienCmd(string select)
        {
            cmd = new SqlCommand(select, con);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (SqlException se)
            {
                MessageBox.Show("Lỗi cơ sở dữ liệu! Hãy nhấn F1!");
                MessageBox.Show("" + se.Message);
            }
        }
        public static DataSet GrdSource(string select)
        {
            da = new SqlDataAdapter(select, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public static SqlDataReader ThucHienReader(string select)
        {
            cmd = new SqlCommand(select, con);
            try
            {
                return cmd.ExecuteReader();
            }
            catch (SqlException)
            {
                return null;
            }
        }

    }
}
