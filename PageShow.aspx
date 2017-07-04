<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageShow.aspx.cs" Inherits="StoryMaker_ASP_PageShow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>StoryMaker</title>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/PageShow.css" rel="stylesheet" />
    <script src="Scripts/PageShow.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse">
            <div class="container">
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#Menu" aria-expanded="false">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>


                <a href="RecorderHome.aspx" class="navbar-brand">Story Maker</a>
            </div>
            <div class="navbar-collapse collapse" id="Menu">
                <ul class="nav navbar-nav">
                    <li><a runat="server" href="RecorderHome.aspx" id="pages1_bt"><span class="glyphicon glyphicon-home">首頁</span></a></li>
                    <li><a runat="server" href="RecorderHome.aspx" id="pages2_bt"><span class="glyphicon glyphicon-record">錄音</span></a></li>
                    <li><a runat="server" href="PageShow.aspx" id="pages3_bt"><span class="glyphicon glyphicon-list-alt">故事總覽</span></a></li>
                    <li><a runat="server" href="about.aspx" id="pages4_bt"><span class="glyphicon glyphicon-user">團隊</span></a></li>
                    <li><a runat="server" href="idea.aspx" id="pages5_bt"><span class="glyphicon glyphicon-star">理念</span></a></li>

                </ul>
            </div>
            </div>
        </div>
    <div class="container">
        <%--<asp:Button ID="btn_New" runat="server" CssClass="btn" Text="NewPage" OnClick="btn_New_Click" />--%>
        <asp:Label ID="lblStory" runat="server" CssClass="invisible"></asp:Label>
        <asp:Label ID="lblID" runat="server" CssClass="invisible"></asp:Label>
        <asp:Label ID="lblName" runat="server" CssClass="invisible"></asp:Label>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center green" id="exampleModalLabel">查看頁數</h4>
                </div>
                <div class="modal-body">
                    <div id="form2" runat="server" class="form-horizontal container">
                    <div class="form-group">
                        <div class="col-md-9">
                            <asp:Label ID="lblTitle" runat="server" Text="" CssClass="chinese"></asp:Label>
                            <asp:Label ID="lblPageCount" runat="server" Text="" CssClass="blue"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="" CssClass="chinese"></asp:Label>
                            <asp:Label ID="lblPageElse" runat="server" Text="" CssClass="blue"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="" CssClass="chinese"></asp:Label>
                            <asp:Label ID="lblAlert" runat="server" Text="" CssClass="chinese red"></asp:Label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-5 col-md-1">
                            <a id="new" runat="server" class="btn btn-success" data-dismiss="modal" aria-label="Close">確定</a>
                            <%--<asp:Button ID="new" runat="server" Text="確定" CssClass="btn btn-success" ValidationGroup="new" />--%>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="row" id="row1">
            <asp:ImageButton BackColor="#d9ebb1" ID="btn_New" runat="server" ImageUrl="~/images/writing.png" CssClass="btn imgBtn" OnClick="btn_New_Click" />
            <img id="Count" src="images/question.png" class="btn imgBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"/>
            <asp:ImageButton BackColor="#d9ebb1" ID="Back" runat="server" ImageUrl="~/images/Book.png" CssClass="btn imgBtn" OnClick="Back_Click" />
            <asp:ImageButton BackColor="#d9ebb1" ID="SignOut" runat="server" ImageUrl="~/images/logOut.png" CssClass="btn imgBtn" OnClick="SignOut_Click" />
        </div>
        <div class="row" id="row2">
                <div id="carousel1" class="carousel slide" data-ride="carousel" data-interval="false" >

                    <div class="carousel-inner" id="cal1" role="listbox">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="item">
                                    <img runat="server" src='<%# showPage("picture") %>' />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>


                    </div>

                    <a id="prev" class="left carousel-control" href="#carousel1" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    </a>
                    <a id="next" class="right carousel-control" href="#carousel1" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    </a>
                </div>


            <hr />

                    <asp:Repeater ID="audioRepeater" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <audio id='<%# getName("Page_ID") %>'>
                                <source src="Sound/<%# Eval("Rec_id") %>.wav" />
                            </audio>
                        </ItemTemplate>
                    </asp:Repeater>

                    <%---------------------------------------------------------------------------------------------%>
                    <hr />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>"
                        SelectCommand="SELECT * FROM [Rec] inner join StoryPage on Rec.Rec_id=StoryPage.Rec_id where Story_ID=@Story_ID"
                        DeleteCommand="Del_Rec" DeleteCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="Story" Name="Story_ID" Type="String" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Rec_id" Type="String" />
                            <asp:Parameter Name="Story_ID" Type="String" />
                            <asp:Parameter Name="Page_ID" Type="String" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
             <div class="col-md-5" id="divRec">
                    <asp:GridView ID="GridView1" runat="server"
                        DataSourceID="SqlDataSource5" AutoGenerateColumns="False" DataKeyNames="Rec_id,Story_ID,Page_ID" OnRowDeleted="GridView1_RowDeleted">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="音檔名稱" SortExpression="RecName">
                                <ItemTemplate>
                                    <asp:Label ID="RecName" runat="server" Text='<%#  Eval("RecName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="對應頁碼" DataField="Page_ID" />
                            <asp:TemplateField HeaderText="音檔" SortExpression="Rec_id">
                                <ItemTemplate>
                                    <audio controls="controls">
                                        <asp:Label ID="lblPlay" runat="server" Text='<%# Eval("Rec_id") %>'></asp:Label>
                                        <source id="player" src="Sound/<%# Eval("Rec_id") %>.wav" />
                                    </audio>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <%----------------------------------------------%>

                    <br />
           
                    <asp:Label ID="Rectitle" runat="server" Text="請選擇音檔上傳頁"></asp:Label><br />

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="Rec001" runat="server" DataSourceID="SqlDataSource1" DataTextField="Page_ID" DataValueField="picture" OnSelectedIndexChanged="Rec001_TextChanged" AutoPostBack="true">
                    </asp:DropDownList>

                    <asp:Label ID="Rectest" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
                    
                    


                    <%----------------------------------------------%>


                    <div id="sound">
                        <asp:Label ID="upsound" runat="server" Text="上傳音檔"></asp:Label>
                        <asp:FileUpload ID="FULsound" runat="server" />
                        <asp:Label ID="nameRec" runat="server" Text="音檔名稱"></asp:Label>
                        <asp:TextBox ID="RecName" runat="server"></asp:TextBox>
                        <asp:Label ID="RecDate" CssClass="form-control" Visible="false" runat="server"></asp:Label><br />
                        <asp:Button ID="Button1" runat="server" Text="上傳音檔" OnClick="Button1_Click" />
                    </div>
            </div>

            <div id="divNone" class="col-md-7">
                       <h2>尚無任何故事頁，請點選NewPage進行新增</h2>
                        
                    </div>
        </div>
            <hr />
       <%-- ------------------------------------------------------------------------------------------%>     
            <hr />
                      
            
        <div class="row">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Page_ID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="imgContain col-xs-4 text-center" >
                        <span>第</span>
                    <asp:Label ID="Page_IDLabel" runat="server" Text='<%# Eval("Page_ID") %>' />
                        <span>頁</span>
                    <br />
                        <asp:Image ID="Image1" runat="server" CssClass="img-responsiv" ImageUrl='<%# showPage("picture") %>' />
                        <br />
                        <a class="btn btn-danger btnA" id='<%# Eval("picture") %>'>Delete<span class="invisible"><%# Eval("Page_ID") %></span></a><br /><br /></div>
                </ItemTemplate>
            </asp:ListView>
        </div>
            
 
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" 
            SelectCommand="SELECT * FROM [StoryPage] where User_ID=@User_ID and Story_ID=@Story_ID">
            <SelectParameters>
                <asp:SessionParameter SessionField="ID" Name="User_ID" Type="String" />
                <asp:SessionParameter SessionField="Story" Name="Story_ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
