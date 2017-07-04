using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            if (Session["Story"] != null)
            {
                //int PageCount=0;
                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
                SqlCommand cmdPC = new SqlCommand("select dbo.get_pageCount(@Story_ID)", Conn);
                cmdPC.Parameters.AddWithValue("Story_ID", Session["Story"]);
                try
                {
                    Conn.Open();
                    int PageCount = Convert.ToInt16(cmdPC.ExecuteScalar().ToString());
                    if (PageCount >= 20)
                    {
                        Conn.Close();
                        Response.Write("<script>alert('不可以多於20頁喔!!');window.location.href='PageShow.aspx'</script>");
                    }
                }
                catch
                {
                    Conn.Close();
                    Response.Write("<script>alert('意料之外的錯誤');window.location.href='PageShow.aspx'</script>");
                }
                Conn.Close();
                UserID.Text = Session["ID"].ToString();
                StoryID.Text = Session["Story"].ToString();
            }
            else
                Response.Write("<script>alert('請先選擇故事');window.location.href='Success.aspx'</script>");
        }
        else
            Response.Write("<script>alert('警衛:給我從正門進來');window.location.href='RecorderHome.aspx'</script>");
            //Response.Write("<script>alert('請先登入');window.location.href='RecorderHome.aspx'</script>");


    }
    protected string ImageName(string ImageName)
    {
        string name = Eval(ImageName).ToString().Substring(3);
        return name;
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('取消編輯,回頁面總覽');window.location.href='PageShow.aspx'</script>");
    }
}