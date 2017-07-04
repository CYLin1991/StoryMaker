using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Success : System.Web.UI.Page
{
    static SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Conn.Close();
        //Session["ID"] = "1234567890";
        //Session["name"] = "abc";
        if (Session["ID"] != null&& Session["name"] !=null)
        {
            lblUserName.Text = "會員:"+Session["name"].ToString() + " 歡迎您登入";
            //lblUserName.Text = "恭喜:" + Session["name"].ToString() + " 你的電腦壞掉了UCCU";
            SqlCommand cmdStory = new SqlCommand("select Story_ID, StoryName from Film where User_ID=@User_ID", Conn);
            cmdStory.Parameters.AddWithValue("User_ID", Session["ID"].ToString());
            SqlDataReader rd;
            Conn.Open();
            try
            {
                rd = cmdStory.ExecuteReader();
                Label br;

                LinkButton list;
                while (rd.Read())
                {
                    list = new LinkButton();
                    list.ID = rd[0].ToString();
                    list.Text = rd[1].ToString();
                    list.Click += new System.EventHandler(listClick);
                    pnlStory.Controls.Add(list);

                    br = new Label();
                    br.Text = "<br />";
                    pnlStory.Controls.Add(br);
                }
            }
            catch
            {
                //Response.Write("<script>alert('出現無法分析的錯誤')</script>");
                //Conn.Close();
                //Response.Redirect("RecorderHome.aspx");
            }
            Conn.Close();
        }
        else Response.Write("<script>alert('GM:請登入');window.location.href='RecorderHome.aspx'</script>");
        //Response.Write("<script>alert('請登入');window.location.href='RecorderHome.aspx'</script>");



    }

    protected void listClick(object sender, EventArgs e)
    {
        Session["Story"] =((LinkButton)sender).ID;
        Response.Redirect("PageShow.aspx");
    }

    protected void new_Click(object sender, EventArgs e)
    {

        try
        {
            string ID = Session["ID"].ToString();
            string name = txtName.Text;
            //SqlCommand StoID = new SqlCommand("select dbo.get_StoID", Conn);
            SqlCommand newStory = new SqlCommand("new_Story_proc", Conn);
            Conn.Close();
            newStory.CommandType = CommandType.StoredProcedure;
            newStory.Parameters.AddWithValue("StoryName", name);
            newStory.Parameters.AddWithValue("User_ID", ID);
            Conn.Open();
            newStory.ExecuteNonQuery();
            Response.Write("<script>alert('新增完成')</script>");

            //LinkButton list = new LinkButton();
            //list.ID = story;
            //list.Text = name;
            //list.Click += new System.EventHandler(listClick);
            //pnlStory.Controls.Add(list);

            //Label br = new Label();
            //br.Text = "<br />";
            //pnlStory.Controls.Add(br);
            Conn.Close();
        }
        catch
        {

        }
        Response.Redirect("Success.aspx");
    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("RecorderHome.aspx");
    }
}