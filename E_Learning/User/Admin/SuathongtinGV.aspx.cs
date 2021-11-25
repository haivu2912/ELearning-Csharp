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

namespace E_Learning.User.Admin
{
    public partial class SuathongtinGV : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadData();
        }
       /*private void LoadData()
        {
            SqlConnection cnn = new SqlConnection(constr);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("select * from tblGiangVien where sGiangVienId=@id", cnn);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["ID"]);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    txtMagiangvien.Text = dt.Rows[i]["sGiangvienId"].ToString();
                    txtHoten.Text = dt.Rows[i]["sTen"].ToString();
                    //DateTime ns = DateTime.Parse(dt.Rows[i]["dNgaysinh"].ToString());
                    //txtNgaysinh.Text = ns.ToString();
                    txtDiachi.Text = dt.Rows[i]["sDiachi"].ToString();
                    txtCmnd.Text = dt.Rows[i]["sCmnd"].ToString();
                    txtSodienthoai.Text = dt.Rows[i]["sSodienthoai"].ToString();
                    txtEmail.Text = dt.Rows[i]["sEmail"].ToString();
                }

            }
            cnn.Close();
        }*/
        /*private bool check_PersonExist(string cmnd)
        {
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblGiangvien where sCmnd = @cmnd", cnn))
                {
                    SqlParameter param = new SqlParameter();
                    cmd.Parameters.AddWithValue("@cmnd", cmnd);
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
        }*/

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {
            /*if (check_PersonExist(txtCmnd.Text.Trim()))
            {
                message.ForeColor = System.Drawing.Color.Red;
                message.Text = "CMND đã tồn tại";
            }*/
            //else
            //{
                SqlConnection cnn = new SqlConnection(constr);
                cnn.Open();
                SqlCommand cmd = new SqlCommand("sp_suagiangvien", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@gvId", Request.QueryString["ID"].ToString());
                cmd.Parameters.AddWithValue("@sTen", txtHoten.Text);
                cmd.Parameters.AddWithValue("@sGioitinh", rbGoitinh.SelectedItem.Value.ToString());
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
                    message.ForeColor = System.Drawing.Color.Green;
                    message.Text = "Thêm giảng viên và tài khoản thành công!";
                }
            //}
        }
    }
}