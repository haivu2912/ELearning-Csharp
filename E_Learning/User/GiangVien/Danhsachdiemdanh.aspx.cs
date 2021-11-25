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
    public partial class Danhsachdiemdanh : System.Web.UI.Page
    {
        string cnn = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_DanhSachdiemdanh", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lopId", Request.QueryString["slopid"]);
            cmd.Parameters.AddWithValue("@buoihocId", Request.QueryString["ibuoihocid"]);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptdiemdanh.DataSource = dt;
            rptdiemdanh.DataBind();
            con.Close();
        }
    }
}