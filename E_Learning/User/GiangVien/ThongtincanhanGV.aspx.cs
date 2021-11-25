using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Learning.User.GiangVien
{
    public partial class ThongtincanhanGV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Thời gian truy cập: " + DateTime.Now.ToString();
            Label2.Text = "Số làn đăng nhập: " + Application["count"].ToString();
            string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GV_Infor", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sGiangvienID", Session["UserId"]);
                    cnn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptGVInfor.DataSource = dt;
                    rptGVInfor.DataBind();
                    cnn.Close();
                }
            }
        }
    }
}