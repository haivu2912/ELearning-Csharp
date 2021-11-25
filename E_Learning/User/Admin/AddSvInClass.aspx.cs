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
    public partial class AddSvInClass : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private bool check_PersonExist(string lopid, string svid)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblDanhsach_SV_Lop where sLopId = @lopid and sSinhVienId = @svid", cnn))
                {
                    SqlParameter param = new SqlParameter();
                    cmd.Parameters.AddWithValue("@lopid", lopid);
                    cmd.Parameters.AddWithValue("@svid", svid);
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
            if (check_PersonExist(txtMaLop.Text.Trim(),txtMaSv.Text.Trim()))
            {
                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "Đã có sinh viên trong lớp";
            }
            else
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_SV_Lop", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cnn.Open();
                        cmd.Parameters.AddWithValue("@sLopID", txtMaLop.Text);
                        cmd.Parameters.AddWithValue("@sSinhVienID", txtMaSv.Text);
                        try
                        {
                            int check = cmd.ExecuteNonQuery();
                            if (check > 0)
                            {
                                message.Text = "Thêm thành công";
                                message.ForeColor = System.Drawing.Color.Green;
                            }
                            else
                            {
                                message.Text = "Thêm thành công";
                                message.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        catch
                        {
                            message.Text = "Lỗi";
                        }
                        cnn.Close();
                    }
                }
            }
        }
    }
}