using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace E_Learning
{
    public partial class Login : System.Web.UI.Page
    {
        
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            byte[] hs = new byte[50];
            string pass = txtPassword.Text;
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] hash = md5.ComputeHash(inputBytes);
            StringBuilder sb = new StringBuilder();
            for(int i = 0 ; i < hash.Length ; i++)
            {
                hs[i] = hash[i];
                sb.Append(hs[i].ToString("x2"));
            }
            var hash_pass = sb.ToString();
            using(SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                using(SqlCommand cmd = new SqlCommand("sp_Dangnhap",cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sAccount", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@sPassword", txtPassword.Text);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        Application["count"] = Convert.ToInt32(Application["count"]) + 1;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            String UserId = dt.Rows[i]["sAccount"].ToString();/* lưu id user vào sessison*/
                            String Role = dt.Rows[i]["sTenQuyen"].ToString();
                            Session["UserId"] = UserId;
                            Session["Role"] = Role;
                            if (Role == "ADMIN")
                            {
                                Response.Redirect("User/Admin/Default.aspx");
                            }
                            else if (Role == "GV")
                            {
                                Response.Redirect("User/GiangVien/Default.aspx");
                            }
                            else if (Role == "SV")
                            {
                                Response.Redirect("User/SinhVien/Default.aspx");
                            }
                        }
                    }
                    else
                    {
                        error.Text = "Tên đăng nhập hoặc mật khẩu không chính xác!";
                    }
                }
            }

        }
    }
}