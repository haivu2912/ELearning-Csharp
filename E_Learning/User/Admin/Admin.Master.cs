using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning.User.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(HttpContext.Current.Session["UserId"] == null)
            {
                Response.Redirect("https://localhost:44387/Login");
            }
            Label1.Text = HttpContext.Current.Session["UserId"].ToString();
        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("https://localhost:44387/Login");
        }
    }
}