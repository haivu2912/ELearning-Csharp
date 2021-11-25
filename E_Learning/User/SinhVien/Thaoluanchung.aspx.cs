using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Learning.User.SinhVien
{
    public partial class Thaoluanchung : System.Web.UI.Page
    {
        string cnn = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblThaoluanchung where sLopid=@ID", con);
            cmd.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptThaoluan.DataSource = dt;
            rptThaoluan.DataBind();
            con.Close();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Themthaoluan", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sNoidung", txtNoidung.Text);
            cmd.Parameters.AddWithValue("@dNgay", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@sAccount", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@sLopid", Request.QueryString["ID"]);
            int a = cmd.ExecuteNonQuery();
            con.Close();
            if (a == 0)
            {
                Response.Write("fail");

            }
            else
            {
                SqlConnection con1 = new SqlConnection(cnn);
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("select * from tblThaoluanchung where sLopid=@ID", con1);
                cmd1.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                cmd1.ExecuteNonQuery();
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptThaoluan.DataSource = dt;
                rptThaoluan.DataBind();
                con1.Close();
                txtNoidung.Text = "";
            }

        }
    }
}