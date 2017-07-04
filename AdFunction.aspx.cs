using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdFunction : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
            SqlCommand objCmd = new SqlCommand("select * from Administrator where AD_ID = @id and password= @pswd", Conn);

            objCmd.Parameters.AddWithValue("@id", Session["ID"]);
            objCmd.Parameters.AddWithValue("@pswd", Session["Password"]);
            SqlDataReader rd;
            Conn.Open();
            rd = objCmd.ExecuteReader();
            if (rd.Read())
            {
                DataShow();
            }
            else
            {
                Response.Redirect("RecorderHome.aspx");
            }
            Conn.Close();
        }
        catch
        {
            Response.Redirect("RecorderHome.aspx");
        }

    }

    protected void DataShow()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        SqlCommand ddlCmd = new SqlCommand("select * from sort", Conn);
        SqlDataReader rd;

        ListItem limSort;
        ListItemCollection Item = ddlSortN.Items;
        Conn.Close();
        if (Item.Count == 0)
        {
            Conn.Open();
            rd = ddlCmd.ExecuteReader();
            while (rd.Read())
            {
                limSort = new ListItem();
                limSort.Text = "(" + rd[0].ToString() + ")" + rd[1].ToString();
                limSort.Value = rd[0].ToString();
                ddlSortN.Items.Add(limSort);
            }
            ddlCmd.Cancel();
            rd.Close();
            Conn.Close();
        }
    }

    protected void TotalQuery_DataBound(object sender, EventArgs e)
    {
        if (ddl.SelectedIndex > 0&& TotalQuery.Rows.Count>0)
        {
            GridViewRow myPagerRow = TotalQuery.BottomPagerRow;

            Label PagerInfo = ((Label)myPagerRow.Cells[0].FindControl("lblPageInfo"));
            PagerInfo.Text = "Page " + (TotalQuery.PageIndex + 1) + " of " + TotalQuery.PageCount;

            DropDownList ddlPager = (DropDownList)myPagerRow.Cells[0].FindControl("ddlPager");

            ListItem item;
            for (int i = 0; i < TotalQuery.PageCount; i++)
            {
                item = new ListItem((i + 1).ToString());
                if (i == TotalQuery.PageIndex)
                    item.Selected = true;
                ddlPager.Items.Add(item);
            }
        }
    }

    protected void ddlPager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow myPagerRow = TotalQuery.BottomPagerRow;
        DropDownList ddlPage = (DropDownList)myPagerRow.Cells[0].FindControl("ddlPager");

        if (sender is LinkButton)
        {
            switch (((LinkButton)sender).ID)
            {
                case "lbnPrev":
                    if (TotalQuery.PageIndex > 0)
                        ddlPage.SelectedIndex--;
                    break;
                case "lbnNext":
                    if (ddlPage.SelectedIndex < ddlPage.Items.Count - 1)
                        ddlPage.SelectedIndex++;
                    break;
            }
        }
        TotalQuery.PageIndex = ddlPage.SelectedIndex;



    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblSort = (Label)FormView1.FindControl("lblSort");
        Label lblSortN = (Label)FormView1.FindControl("lblSortN");
        DropDownList ddlSort = (DropDownList)FormView1.FindControl("ddlSort");
        lblSort.Text = ddlSort.SelectedValue;
        lblSortN.Text = ddlSort.SelectedItem.Text;

    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        TotalQuery.DataBind();

    }

    protected string File(string Sort_id)
    {
        string FileName;
        string AAA = Eval(Sort_id).ToString().Substring(0, 1);
        if (AAA.Equals("9"))
            FileName = ".jpg";
        else FileName = ".png";
        return FileName;
    }


    protected void Image_Upload(object sender, EventArgs e)
    {
        Label lblSort = (Label)FormView1.FindControl("lblSort");
        Label lblID = (Label)FormView1.FindControl("lblID");
        string IDText = lblID.Text;
        string FileName;
        string AAA = lblSort.Text.ToString().Substring(0, 1);
        if (AAA.Equals("9"))
            FileName = ".jpg";
        else FileName = ".png";
        FileUpload fulImage = (FileUpload)FormView1.FindControl("fulImage");
        fulImage.SaveAs(Server.MapPath("~/StoryMaker_ASP/圖/" + IDText + FileName));
        FormView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        Conn.Close();
        SqlCommand objCmd = new SqlCommand("Insert_Mat", Conn);
        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.Parameters.AddWithValue("@Image_ID", txtID.Text);
        objCmd.Parameters.AddWithValue("@Image_ID2", txtID.Text);
        objCmd.Parameters.AddWithValue("@ImageName", txtName.Text);
        objCmd.Parameters.AddWithValue("@Sort_id", ddlSortN.SelectedValue);

        Conn.Open();
        try
        {
            objCmd.ExecuteNonQuery();
            try
            {
                string IDText = txtID.Text;
                string FileName;
                string AAA = ddlSortN.SelectedValue.ToString().Substring(0, 1);
                if (AAA.Equals("9"))
                    FileName = "jpg";
                else FileName = "png";
                fulImage.SaveAs(Server.MapPath("~/圖/" + IDText + "." + FileName));

                Response.Write("<Script>alert('新增完成')</Script>");
                txtID.Text = "";
                txtName.Text = "";
            }
            catch
            {
                Response.Write("<Script>alert('圖片上傳失敗:\\n請至修改頁面重傳或刪除檔案')</Script>");
            }
        }
        catch
        {
            Response.Write("<Script>alert('新增失敗!!\\n相同素材可能已存在')</Script>");
        }
        objCmd.Cancel();
        TotalQuery.DataBind();
        Conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StoryMakerTestConnectionString"].ConnectionString);
        Conn.Close();
        SqlCommand objCmd2 = new SqlCommand("select * from Sort where Sort_ID = @Sort_ID", Conn);
        objCmd2.Parameters.AddWithValue("@Sort_ID", TextBox1.Text);
        objCmd2.Parameters.AddWithValue("@SortName", TextBox2.Text);


        SqlDataReader rd;
        Conn.Open();

        rd = objCmd2.ExecuteReader();

        if (rd.Read())
        {
            Response.Write("<Script>alert('此類別已存在或類別編號重複!!')</Script>");

        }
        else
        {
            //objCmd.CommandText = "Mat_Insert_proc";
            SqlDataSource4.Insert();
            ddl.Items.Clear();
            ddl.DataBind();
            ddlSortN.Items.Clear();
            ddlSortN.DataBind();
            TotalQuery.DataBind();
            FormView1.DataBind();
        }
        Conn.Close();
    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("RecorderHome.aspx");
    }
}