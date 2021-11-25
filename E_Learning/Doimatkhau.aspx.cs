using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace E_Learning
{
    public partial class Doimatkhau : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("spDoimatkhau", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sAccount", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@sOldPassword", txtOldPassword.Text);
                    cmd.Parameters.AddWithValue("@sNewPassword", txtNewPassword.Text);
                    cnn.Open();
                    try
                    {
                        int check = cmd.ExecuteNonQuery();
                        if (check > 0)
                        {
                            lbMsg.Text = "Đổi mật khẩu thành công";
                        }
                        else
                        {
                            lbMsg.Text = "Đổi mật khẩu thất bại";
                        }
                    }
                    catch
                    {
                        lbMsg.Text = "Lỗi";
                    }
                }
            }
        }
    }
}

/*
 * cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sGiangVienID", txtMa);
                    cmd.Parameters.AddWithValue("@sTen", txtTen);
                    if (rblGioitinh.SelectedValue == "Nam")
                    {
                        cmd.Parameters.AddWithValue("@sGioitinh", "Nam");
                    }
                    else if (rblGioitinh.SelectedValue == "Nữ")
                    {
                        cmd.Parameters.AddWithValue("@sGioitinh", "Nữ");
                    }
                    cmd.Parameters.AddWithValue("@dNgaysinh", txtNgaysinh);
                    cmd.Parameters.AddWithValue("@sDiachi", txtDiachi);
                    cmd.Parameters.AddWithValue("@sEmail", txtEmail);
                    cmd.Parameters.AddWithValue("@sCMND", txtCMND);
                    cmd.Parameters.AddWithValue("@sSDT", txtSDT);
                    cmd.Parameters.AddWithValue("@sBangcap", txtBangcap);
 */