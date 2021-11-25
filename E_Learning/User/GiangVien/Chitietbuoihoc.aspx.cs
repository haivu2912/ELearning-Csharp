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
    public partial class Chitietbuoihoc : System.Web.UI.Page
    {
        string cnn = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            LoadData();

        }
        private void LoadData()
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblBuoiHoc where iBuoihocid=@id", con);
            cmd.Parameters.AddWithValue("@id", Int32.Parse(Request.QueryString["ID"]));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    lbTieude.Text = dt.Rows[i]["sTieude"].ToString();
                    lbNoidung.Text = dt.Rows[i]["sNoidung"].ToString();
                    lbNgay.Text = dt.Rows[i]["dThoigian"].ToString();
                    lbThoigianbatdau.Text = dt.Rows[i]["sThoigianbatdau"].ToString();
                    lbThoigianketthuc.Text = dt.Rows[i]["sThoigianketthuc"].ToString();
                    lbTepdinhkem.Text = dt.Rows[i]["sTepdinhkem"].ToString();

                    //Hiển thị nội dung lên textbox
                    //txtTieude.Text = dt.Rows[i]["sTieude"].ToString();
                    //txtNoidung.Text = dt.Rows[i]["sNoidung"].ToString();


                    if (dt.Rows[i]["sTrangthai"].ToString() == "Học")
                    {
                        lbTrangthai.Text = "Học";
                        lbTrangthai.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lbTrangthai.Text = "Nghỉ";
                        lbTrangthai.ForeColor = System.Drawing.Color.Red;
                    }
                }


            }
            con.Close();
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            //if (FileUpload1.HasFile)
            //{
            if (FileUpload1.HasFile == true)
            {

                SqlConnection con = new SqlConnection(cnn);
                string strname = FileUpload1.FileName.ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/FileUpLoad/") + strname);
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_gv_capnhatbuoihoc", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Request.QueryString["ID"].ToString());
                cmd.Parameters.AddWithValue("@Tieude", txtTieude.Text);
                cmd.Parameters.AddWithValue("@sNoidung", txtNoidung.Text);
                cmd.Parameters.AddWithValue("@sTepdinhkem", strname);
                cmd.Parameters.AddWithValue("@sTrangthai", ddlTrangthai.SelectedItem.Value);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter sqlsda = new SqlDataAdapter(cmd);
                sqlsda.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        lbTieude.Text = dt.Rows[i]["sTieude"].ToString();
                        lbNoidung.Text = dt.Rows[i]["sNoidung"].ToString();
                        lbNgay.Text = dt.Rows[i]["dThoigian"].ToString();
                        lbThoigianbatdau.Text = dt.Rows[i]["sThoigianbatday"].ToString();
                        lbThoigianketthuc.Text = dt.Rows[i]["sThoigianketthuc"].ToString();
                        lbTepdinhkem.Text = dt.Rows[i]["stepdinhkem"].ToString();

                        //Hiển thị nội dung lên textbox
                        //txtTieude.Text = dt.Rows[i]["sTieude"].ToString();
                        //txtNoidung.Text = dt.Rows[i]["sNoidung"].ToString();


                        if (dt.Rows[i]["sTrangthai"].ToString() == "Học")
                        {
                            lbTrangthai.Text = "Học";
                            lbTrangthai.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lbTrangthai.Text = "Nghỉ";
                            lbTrangthai.ForeColor = System.Drawing.Color.Red;
                        }
                    }


                }
                con.Close();
            }

        }

        protected void ddlTrangthai_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label1.Text = ddlTrangthai.SelectedItem.Value;
        }

        protected void txtTieude_OnTextChanged(object sender, EventArgs e)
        {
            TextBox textBox = sender as TextBox;
            if (textBox != null)
            {
                string theText = textBox.Text;
                Label1.Text = theText;
            }
        }
    }
}