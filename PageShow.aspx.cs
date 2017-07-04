using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

public partial class StoryMaker_ASP_PageShow : System.Web.UI.Page
{
    int i = 0;
    static SqlConnection Conn
       = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["ID"] = "a1234";
        //Session["Story"] = "S0003";
        Conn.Close();
        if (Session["ID"] == null)
            //Response.Write("<script>alert('媽媽有沒有告訴你不能翻牆!');window.location.href='RecorderHome.aspx'</script>");
            Response.Write("<script>alert('請先登入!');window.location.href='RecorderHome.aspx'</script>");


        else if (Session["Story"] == null)
            Response.Write("<script>alert('請先選擇故事!');window.location.href='Success.aspx'</script>");
        else
        {
            lblStory.Text = Session["Story"].ToString();
            lblID.Text = Session["ID"].ToString();
            lblName.Text = Session["Name"].ToString();
            SqlCommand cmdPC = new SqlCommand("select dbo.get_pageCount(@Story_ID)", Conn);
            cmdPC.Parameters.AddWithValue("Story_ID", Session["Story"]);

            try
            {
                Conn.Open();
                int PageCount = Convert.ToInt16(cmdPC.ExecuteScalar().ToString());
                //Response.Write("<script>alert('test');</script>");
                lblTitle.Text = "您目前共有: ";
                lblPageCount.Text = PageCount.ToString();
                Label1.Text = " 頁!!<br>還可以編輯 ";
                lblPageElse.Text = (20 - PageCount).ToString();
                Label3.Text= " 頁!!<br>";
                lblAlert.Text = "※提醒您: 每個故事不得多於20頁※";
                //Response.Write("<script>alert('您目前共有: " + PageCount + " 頁!!\\n還可以編輯 " + (20 - PageCount) + " 頁!!\\n※提醒您:每個故事不得多於20頁※')</script>");
            }
            catch
            {
                lblPageCount.Text="發生無法計算的錯誤";
            }
            Conn.Close();
        }
    }

    protected void btn_New_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("test02.aspx");
    }
    protected string showPage(string picture)
    {
        picture = "StoryPage\\" +Eval(picture)+ ".jpg";
        return picture;
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session["ID"] = lblID.Text;
        Session["Name"] = lblName.Text;
        Response.Redirect("Success.aspx");
    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("RecorderHome.aspx");
    }

    protected void PageCount_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        string Page_ID = Rec001.SelectedItem.Text;
        string Story_ID = Session["Story"].ToString();
        string Rec_id = Rec001.SelectedValue;

        Conn.Open();
        try
        {
            
            SqlCommand Sound1 = new SqlCommand("insert into [Rec](Rec_id,RecDate,RecName) values(@Rec_id, @RecDate,@RecName)", Conn);

            Sound1.Parameters.AddWithValue("@Rec_id", Rec_id);
            Sound1.Parameters.AddWithValue("@RecDate", RecDate.Text);
            Sound1.Parameters.AddWithValue("@RecName", RecName.Text);

            Sound1.ExecuteNonQuery();

            FULsound.SaveAs(Server.MapPath("~/Sound/" + Rec_id + ".wav"));
            FULsound.Dispose();
            RecName.Text = "";

            SqlCommand UpRec = new SqlCommand("Update_RecID", Conn);
            UpRec.CommandType = CommandType.StoredProcedure;
            UpRec.Parameters.AddWithValue("@Rec_id", Rec_id);
            UpRec.Parameters.AddWithValue("@Page_ID", Page_ID);
            UpRec.Parameters.AddWithValue("@Story_ID", Session["Story"]);


            UpRec.ExecuteNonQuery();
            Rectest.Text = "已有檔案";
            Rectest.ForeColor = System.Drawing.Color.Red;
        }
        catch
        {
            Response.Write("<script>alert('檔案上傳沒有成功，原因是：已有錄音檔');window.location.href='PageShow.aspx'</script>");
            //string ID = Recid.ExecuteScalar().ToString();
        }

        //資料庫Rec_id  char(7)、RecDate (datetime)、RecName varchar(20)
        Conn.Close();
        GridView1.DataBind();
        audioRepeater.DataBind();
    }

    protected void Rec001_TextChanged(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        SqlCommand Recid = new SqlCommand("select dbo.fnGetRec_id(@Pid,@Sid)", Conn);
        string Page_ID = Rec001.SelectedItem.Text;
        Recid.Parameters.AddWithValue("Pid", Page_ID);
        Recid.Parameters.AddWithValue("Sid", Session["Story"]);
        SqlDataReader rd;

        Conn.Open();
        rd = Recid.ExecuteReader();
        rd.Read();
        if (rd[0].ToString() == "1")
        {
            Rectest.Text = "已有檔案";
            Rectest.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            Rectest.Text = "可上傳檔案";
            Rectest.ForeColor = System.Drawing.Color.Blue;
        }
        Conn.Close();

    }


    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Rectest.Text = "";
        audioRepeater.DataBind();
    }

    protected string getName(string Page_ID)
    {
        string name = "sound"+Eval(Page_ID).ToString();
        return name;
    }

}