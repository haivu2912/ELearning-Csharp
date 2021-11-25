﻿using System;
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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
            using(SqlConnection cnn = new SqlConnection(constr))
            {
                using(SqlCommand cmd = new SqlCommand("sp_danhsachlop_GV", cnn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sGiangvienID", Session["UserId"]);
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

        protected void rptLophoc_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}