using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace E_Learning.User.Admin
{
    public partial class ThemGiangVien : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool check_PersonExist(string userid)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblGiangvien where sGiangvienId = @userid", cnn))
                {
                    SqlParameter param = new SqlParameter();
                    cmd.Parameters.AddWithValue("@userid", userid);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        private string hash_md5(string password_txt)
        {
            byte[] hs = new byte[50];
            string pass = password_txt;
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] hash = md5.ComputeHash(inputBytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                hs[i] = hash[i];
                sb.Append(hs[i].ToString("x2"));
            }
            var hash_pass = sb.ToString();
            return hash_pass;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (check_PersonExist(txtMagiangvien.Text.Trim()))
            {
                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "Mã giảng viên đã tồn tại";
            }
            else
            {
                SqlConnection cnn = new SqlConnection(constr);
                cnn.Open();
                SqlCommand cmd = new SqlCommand("sp_themgiangvien", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sGiangvienid", txtMagiangvien.Text);
                cmd.Parameters.AddWithValue("@sTen", txtHoten.Text);
                cmd.Parameters.AddWithValue("@sGioitinh", rdoPriceRange.SelectedItem.Value.ToString());
                cmd.Parameters.AddWithValue("@dNgaysinh", txtNgaysinh.Text);
                cmd.Parameters.AddWithValue("@sDiachi", txtDiachi.Text);
                cmd.Parameters.AddWithValue("@sEmail", txtEmail.Text);
                cmd.Parameters.AddWithValue("@sCmnd", txtCmnd.Text);
                cmd.Parameters.AddWithValue("@sSodienthoai", txtSodienthoai.Text);
                cmd.Parameters.AddWithValue("@sBangcap", ddlBangcap.SelectedItem.Value.ToString());


                int a = cmd.ExecuteNonQuery();
                cnn.Close();
                if (a == 0)
                {
                    message.ForeColor = System.Drawing.Color.Red;
                    message.Text = "Thêm giảng viên thất bại!";

                }
                else
                {
                    SqlConnection con1 = new SqlConnection(constr);
                    con1.Open();
                    SqlCommand cmd1 = new SqlCommand("sp_creatAccount", con1);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@sAccount", txtMagiangvien.Text);
                    cmd1.Parameters.AddWithValue("@sPassword", hash_md5(txtCmnd.Text));
                    cmd1.Parameters.AddWithValue("@iMaquyen", 2);
                    cmd1.ExecuteNonQuery();
                    con1.Close();
                    message.ForeColor = System.Drawing.Color.Green;
                    message.Text = "Thêm giảng viên và tài khoản thành công!";
                }
            }
        }
    }
}