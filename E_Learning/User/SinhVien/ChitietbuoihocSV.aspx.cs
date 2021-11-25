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
    public partial class ChitietbuoihocSV : System.Web.UI.Page
    {
        string cnn = ConfigurationManager.ConnectionStrings["db_ELearning"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            if (CheckDiemDanh())
            {
                lbDiemdanh.Text = "Bạn đã ghi danh buổi học này";
                lbDiemdanh.ForeColor = System.Drawing.Color.Green;
                btnDiemdanh.Visible = false;
            }
            else
            {
                lbDiemdanh.Text = "Bạn chưa ghi danh buổi học này";
                lbDiemdanh.ForeColor = System.Drawing.Color.Red;
            }
        }
        private void FileDownload(string filename)
        {
            Response.ContentType = "“application / octet - stream";
            Response.AddHeader("Content - Disposition", "attachment; filename =" +filename);
            Response.TransmitFile("~/FileDownLoad/ " + filename);
        }

        private void LoadData()
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblBuoihoc where iBuoihocid=@id", con);
            cmd.Parameters.AddWithValue("@id", Int32.Parse(Request.QueryString["ID"]));
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    lbTitle.Text = dt.Rows[i]["sTieude"].ToString();
                    lbContent.Text = dt.Rows[i]["sNoidung"].ToString();
                    lbDate.Text = dt.Rows[i]["dThoigian"].ToString();
                    lbTimeStart.Text = dt.Rows[i]["sThoigianbatdau"].ToString();
                    lbTimeEnd.Text = dt.Rows[i]["sThoigianketthuc"].ToString();
                    lbTepdinhkem.Text = dt.Rows[i]["sTepdinhkem"].ToString();

                    //Hiển thị nội dung lên textbox
                    //txtTieude.Text = dt.Rows[i]["sTieude"].ToString();
                    //txtNoidung.Text = dt.Rows[i]["sNoidung"].ToString();


                    if (dt.Rows[i]["sTrangthai"].ToString() == "Học")
                    {
                        lbTrangThai.Text = "Học";
                        lbTrangThai.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lbTrangThai.Text = "Nghỉ";
                        lbTrangThai.ForeColor = System.Drawing.Color.Red;
                    }


                }


            }
            con.Close();
        }

        private bool CheckDiemDanh()
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblDiemdanh where iBuoihocid=@id and sSinhvienId=@userid", con);
            cmd.Parameters.AddWithValue("@userid", Session["userId"]);
            cmd.Parameters.AddWithValue("@id", Int32.Parse(Request.QueryString["ID"]));
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                return true;
            }
            else
            { 
                return false; 
            }
            con.Close();
        }

        protected void btnDiemdanh_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblDiemdanh(iBuoihocid,sSinhvienid,bDiemdanh) values(@id,@userid,@bdiemdanh)", con);
            cmd.Parameters.AddWithValue("@id", Int32.Parse(Request.QueryString["ID"]));
            cmd.Parameters.AddWithValue("@userid", Session["userId"]);
            cmd.Parameters.AddWithValue("@bdiemdanh", 1);
            int a = cmd.ExecuteNonQuery();
            if (a == 0)
            {
                lbDiemdanh.Text = "Bạn chưa ghi danh buổi học này";
                lbDiemdanh.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lbDiemdanh.Text = "Bạn đã ghi danh buổi học này";
                lbDiemdanh.ForeColor = System.Drawing.Color.Green;
                btnDiemdanh.Visible = false;
            }
            con.Close();

        }
    }
}