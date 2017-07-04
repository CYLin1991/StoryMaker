using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;


public partial class newUsers : System.Web.UI.Page
{
    SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Registration_Date.Text = DateTime.Now.ToString("yyyy/MM/dd");
        Conn.Close();
    }

    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        int Length = User_ID.Text.Length;
        if (Length >= 5 && Length <= 10)
        {
            SqlCommand objCmd = new SqlCommand("select dbo.fnCheckUserID(@ID)", Conn);
            objCmd.Parameters.AddWithValue("@ID", User_ID.Text);

            SqlDataReader rd;

            Conn.Open();
            rd = objCmd.ExecuteReader();
            rd.Read();
            if (rd[0].ToString() == "1")
            {
                Label1.Text = "此帳號已有人使用";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Label1.Text = "此帳號目前可以使用";
                Label1.ForeColor = System.Drawing.Color.Gold;
            }
        }
        else
        {
            Label1.Text = "";
            RegularExpressionValidator1.IsValid = false;
        }
        Conn.Close();
    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        //SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        if (RegularExpressionValidator3.IsValid == true)
        {
            SqlCommand objCmd = new SqlCommand("select dbo.fnCheckEmail(@email)", Conn);
            objCmd.Parameters.AddWithValue("@email", EMail.Text);

            SqlDataReader rd;

            Conn.Open();
            rd = objCmd.ExecuteReader();
            rd.Read();
            if (rd[0].ToString() == "1")
            {
                Label2.Text = "此Email已有人使用";
                Label2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Label2.Text = "此Email目前可以使用";
                Label2.ForeColor = System.Drawing.Color.Gold;
            }
            
        }
        else
        {
            Label2.Text = "";
            RegularExpressionValidator3.IsValid = false;
        }
        Conn.Close();
    }
        
        

    protected void Button1_Click(object sender, EventArgs e)
    {
   
        SqlCommand User1 = new SqlCommand("insert into [User]([User_ID], [Password],Registration_Date, [UserName], Nickname,[E-Mail],BlackList) values(@User_ID, @Password,@Registration_Date,@UserName, @Nickname,@EMail,@BlackList)", Conn);
        User1.Parameters.AddWithValue("@User_ID", User_ID.Text);
        User1.Parameters.AddWithValue("@Password", Password.Text);
        User1.Parameters.AddWithValue("@Registration_Date", Registration_Date.Text);
        User1.Parameters.AddWithValue("@UserName", UserName.Text);
        User1.Parameters.AddWithValue("@Nickname", Nickname.Text);
        User1.Parameters.AddWithValue("@EMail", EMail.Text);
        User1.Parameters.AddWithValue("@BlackList", 0);

        Conn.Open();
        //User1.ExecuteNonQuery();
        try
        {
            User1.ExecuteNonQuery();
            Response.Write("<Script>alert('新增完成');window.location.href='RecorderHome.aspx'</Script>");
        }
        catch
        {
            Response.Write("<Script>alert('新增失敗!!')</Script>");
        }
        User1.Cancel();
        Conn.Close();


        User_ID.Text = "";
        Password.Text = "";
        Registration_Date.Text = "";
        UserName.Text = "";
        Nickname.Text = "";
        EMail.Text = "";

    }
}