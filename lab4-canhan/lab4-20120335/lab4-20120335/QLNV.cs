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
using static lab4_20120335.AES;


namespace lab4_20120335
{
    public partial class QLNV : Form
    {
        public SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-A79AAA6\MSSQLSERVER01;Initial Catalog=QLSV;Integrated Security=True");
        public SqlCommand cmd;
        public SqlDataReader rd;
        string choose = "none";
        public QLNV()
        {
            InitializeComponent();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void QLNV_Load(object sender, EventArgs e)
        {
            con.Open();
            string query = "exec SP_SEL_ENCRYPT_NHANVIEN";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();
            da.Fill(table);
            DataColumn newColumn = new DataColumn("LUONGNV", typeof(string));
            table.Columns.Add(newColumn);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                byte[] luongBytes = (byte[])table.Rows[i]["LUONG"];
                table.Rows[i]["LUONGNV"] = AES.Decrypt(luongBytes, "20120335");
            }
            if (table.Columns.Contains("LUONG"))
            {
                table.Columns.Remove("LUONG");
            }
            dataGridView1.DataSource = table;
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            choose = "add";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            choose = "delete";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            choose = "edit";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (choose == "none")
            {
                MessageBox.Show("Vui lòng chọn chức năng Thêm, Xoá hoặc Sửa");
            }    
            else
            {
                string t = "", manv, email, tendn, hoten;
                manv = textBox1.Text;
                email = textBox2.Text;
                tendn = textBox3.Text;
                hoten = textBox4.Text;
                SHA256 sha256 = SHA256.Create();
                Byte[] matkhau = sha256.ComputeHash(Encoding.UTF8.GetBytes(textBox6.Text));
                Byte[] luong = AES.Encrypt(textBox5.Text, "20120335");

                if (choose == "add")
                {
                    t = "exec SP_INS_ENCRYPT_NHANVIEN @manv, @hoten, @email, @luong, @tendn , @matkhau";
                }
                else if (choose == "edit")
                {
                    t = "exec SP_UPD_ENCRYPT_NHANVIEN @manv, @hoten, @email, @luong, @tendn , @matkhau";
                }
                else if (choose == "delete")
                {
                    t = "DELETE FROM NHANVIEN WHERE NHANVIEN.MANV = @manv";
                }
                cmd = new SqlCommand(t, con);
                cmd.Parameters.AddWithValue("@manv", manv);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@tendn", tendn);
                cmd.Parameters.AddWithValue("@hoten", hoten);
                cmd.Parameters.AddWithValue("@luong", luong);
                cmd.Parameters.AddWithValue("@matkhau", matkhau);
                con.Open();
                int rd = cmd.ExecuteNonQuery();
                if (rd > 0)
                {
                    MessageBox.Show("Ghi/Lưu thành công.");

                }
                else
                {
                    MessageBox.Show("Không thể ghi/lưu.");
                }
                con.Close();
                con.Open();
                string query = "exec SP_SEL_ENCRYPT_NHANVIEN";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable table = new DataTable();
                da.Fill(table);
                DataColumn newColumn = new DataColumn("LUONGNV", typeof(string));
                table.Columns.Add(newColumn);
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    byte[] luongBytes = (byte[])table.Rows[i]["LUONG"];
                    table.Rows[i]["LUONGNV"] = AES.Decrypt(luongBytes, "20120335");
                }
                if (table.Columns.Contains("LUONG"))
                {
                    table.Columns.Remove("LUONG");
                }
                dataGridView1.DataSource = table;
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();

                con.Close();
            }
        }
    }
}
