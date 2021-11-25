using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace E_Learning.User.Admin
{
    public partial class Themlophoc : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool check_PersonExist(string lopid)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblLop where sLopId = @lopid", cnn))
                {
                    SqlParameter param = new SqlParameter();
                    cmd.Parameters.AddWithValue("@lopid", lopid);
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (check_PersonExist(txtMalop.Text.Trim()))
            {
                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "Mã lớp đã tồn tại";
            }
            else
            {
                SqlConnection cnn = new SqlConnection(constr);
                cnn.Open();
                SqlCommand cmd = new SqlCommand("sp_themlop", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sLopId", txtMalop.Text);
                cmd.Parameters.AddWithValue("@sTenLop", txtTenlop.Text);
                cmd.Parameters.AddWithValue("@sQuanLyId", Session["UserId"]);
                cmd.Parameters.AddWithValue("@sGiangVienId", txtGiangvien.Text);
                cmd.Parameters.AddWithValue("@sMonHocId", txtMonhoc.Text);
                int a = cmd.ExecuteNonQuery();
                cnn.Close();
                if (a == 0)
                {
                    message.ForeColor = System.Drawing.Color.Red;
                    message.Text = "Thêm giảng viên thất bại!";

                }
                else
                {
                    message.Text = "Thêm giảng viên và tài khoản thành công!";
                }
            }
        }
    }
}