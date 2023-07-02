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
using System.Security.Cryptography;
using lab4_20120335;

namespace lab4_20120335
{
    public partial class Login : Form
    {
        public SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-A79AAA6\MSSQLSERVER01;Initial Catalog=QLSV;Integrated Security=True");
        public SqlCommand cmd;
        public SqlDataReader rd;
        public Login()
        {
            InitializeComponent();
        }

        private void showPass_CheckedChanged(object sender, EventArgs e)
        {
            if(showPass.Checked)
            {
                textBox2.UseSystemPasswordChar = true;
            }
            else
            {
                textBox2.UseSystemPasswordChar = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            // MD5
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            Byte[] buffer1 = md5.ComputeHash(Encoding.UTF8.GetBytes(textBox2.Text));
            //SHA256
            SHA256 sha256 = SHA256.Create();
            Byte[] buffer2 = sha256.ComputeHash(Encoding.UTF8.GetBytes(textBox2.Text));

            cmd = new SqlCommand("SELECT NV.MANV, NV.TENDN FROM NHANVIEN AS NV where nv.TENDN = @username and NV.MATKHAU = @password", con);
            cmd.Parameters.AddWithValue("@username", user);
            cmd.Parameters.AddWithValue("@password", buffer2);

            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                MessageBox.Show("Đăng nhập thành công!");
                Hide();
                QLNV nv = new QLNV();
                nv.Show();
            }
            else
            {
                MessageBox.Show("Tên đăng nhập và mật khẩu không hợp lệ!");
            }
            con.Close();
        }
    }
}
