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
    public partial class Default : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_DS_Lop", cnn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cnn.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptLophoc.DataSource = dt;
                        rptLophoc.DataBind();
                        cnn.Close();
                    }
                }
            }
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            
        }
    }
}