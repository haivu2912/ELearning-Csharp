using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_Learning.User.Admin
{
    public partial class ListSinhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblSinhVien", cnn))
                {
                    cmd.CommandType = CommandType.Text;
                    cnn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptSinhvien.DataSource = dt;
                    rptSinhvien.DataBind();
                    cnn.Close();
                }
            }
        }
        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                cnn.Open();
                LinkButton linkButton = (LinkButton)sender;
                var id = linkButton.Attributes["Tagkey1"];
                var acc = linkButton.Attributes["Tagkey2"];
                using (SqlCommand cmd = new SqlCommand("sp_XoaSV", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@acc", acc);
                    int check = cmd.ExecuteNonQuery();
                    if(check > 0)
                    {
                        lbMsg.Visible = true;
                        lbMsg.ForeColor = System.Drawing.Color.Green;
                        lbMsg.Text = "Xóa thành công";
                    }
                    else
                    {
                        lbMsg.Visible = true;
                        lbMsg.ForeColor = System.Drawing.Color.Green;
                        lbMsg.Text = "Xóa thất bại";
                    }
                }
                cnn.Close();
                LoadData();
            }
        }
    }
}