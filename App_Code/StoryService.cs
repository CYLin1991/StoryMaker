using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

/// <summary>
/// StoryService 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
// [System.Web.Script.Services.ScriptService]
public class StoryService : System.Web.Services.WebService
{
    protected SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
    public StoryService()
    {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public string SaveImage(string Image, string Story, string User)
    {
        Conn.Close();
        SqlCommand test = new SqlCommand("select dbo.fn_jpgPage(@Story,@User)", Conn);
        test.Parameters.AddWithValue("Story", Story);
        test.Parameters.AddWithValue("User", User);
        string pageNo;
        Conn.Open();
        pageNo = Story + (test.ExecuteScalar()).ToString();
        test.Cancel();
        Conn.Close();

        SqlCommand newPage = new SqlCommand("newPage_proc", Conn);
        newPage.CommandType = CommandType.StoredProcedure;
        newPage.Parameters.AddWithValue("Story_ID", Story);
        newPage.Parameters.AddWithValue("User_ID", User);
        newPage.Parameters.AddWithValue("picture", pageNo);
        Conn.Open();
        newPage.ExecuteNonQuery();
        newPage.Cancel();
        Conn.Close();
        String path = Server.MapPath("~/StoryPage/" + pageNo + ".jpg");
        Image = Image.Substring(22);
        try
        {
            byte[] arr = Convert.FromBase64String(Image);
            MemoryStream ms = new MemoryStream(arr);
            Bitmap bmp = new Bitmap(ms);

            bmp.Save(path, ImageFormat.Jpeg);
            //bmp.Save("test.bmp", ImageFormat.Bmp);
            //bmp.Save("test.gif", ImageFormat.Gif);
            //bmp.Save(path, ImageFormat.Png);
            ms.Close();
        }
        catch
        {
            return null;
        }

        return pageNo;
    }
    [WebMethod]
    public string DelImage(string Image, string Story, string Page)
    {
        Conn.Close();
        if (Image.Length == 10 && Image.Substring(5, 1).Equals("P"))
        {
            SqlCommand delPage = new SqlCommand("del_page_proc", Conn);
            delPage.CommandType = CommandType.StoredProcedure;
            delPage.Parameters.AddWithValue("Story_ID", Story);
            delPage.Parameters.AddWithValue("Page_ID", Page);
            Conn.Open();
            delPage.ExecuteNonQuery();
            delPage.Cancel();
            Conn.Close();
            File.Delete(Server.MapPath("~/StoryPage/" + Image + ".jpg"));//儲存路徑自行更改
            File.Delete(Server.MapPath("~/Sound/" + Image + ".wav"));
        }
        return Image;
    }
}
