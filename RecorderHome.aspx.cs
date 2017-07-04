using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecorderHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //ConnectionStrings是來自Web.config的connectionStrings的name
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("select * from [User] where User_ID = @id and Password= @pswd ", Conn);

        objCmd.Parameters.AddWithValue("@id", txtus_ID.Text);
        objCmd.Parameters.AddWithValue("@pswd", txtus_Pwd.Text);
        SqlDataReader rd;
        Conn.Open();
        rd = objCmd.ExecuteReader();
        if (rd.Read())
        {
            Response.Write("開門");
            Session["ID"] = rd[0];
            Session["name"] = rd[3];
            Response.Redirect("Success.aspx");
        }
        else
        {
            Response.Write("<script>alert('帳號或密碼錯誤!!')</script>");
        }
        Conn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //ConnectionStrings是來自Web.config的connectionStrings的name
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("select * from Administrator where AD_ID = @id and password= @pswd", Conn);

        objCmd.Parameters.AddWithValue("@id", txtad_ID.Text);
        objCmd.Parameters.AddWithValue("@pswd", txtad_Pwd.Text);
        SqlDataReader rd;
        Conn.Open();
        rd = objCmd.ExecuteReader();
        if (rd.Read())
        {
            Response.Write("開門");
            Session["ID"] = rd[0];
            Session["Password"] = rd[1];
            Response.Redirect("AdFunction.aspx");
        }
        else
        {
            Response.Write("<script>alert('帳號或密碼錯誤!!')</script>");
        }
        Conn.Close();
    }
}