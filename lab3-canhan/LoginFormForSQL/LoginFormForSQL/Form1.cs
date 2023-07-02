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

namespace LoginFormForSQL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-A79AAA6\MSSQLSERVER01;Initial Catalog=QLSV;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("select * from NHANVIEN where TENDN=@username and MATKHAU=(select HASHBYTES('SHA1',convert(varchar,@password)))", con);
                cmd.Parameters.AddWithValue("@username", txtName.Text);
                cmd.Parameters.AddWithValue("@password", txtPass.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    MessageBox.Show("Đăng nhập thành công!");
                }
                else
                {
                    MessageBox.Show("Đăng nhập thất bại, thử lại!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("" + ex);
            }
        }
        private void Form1_Load_1(object sender, EventArgs e)
        {
            this.button1.Click += new System.EventHandler(this.button1_Click);
        }

        private void txtName_TextChanged_1(object sender, EventArgs e)
        {

        }
    }
}
