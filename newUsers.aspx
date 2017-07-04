<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newUsers.aspx.cs" Inherits="newUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>StoryMaker</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/newUser.css" rel="stylesheet" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>"
             SelectCommand="SELECT * FROM [User]"
             InsertCommand="insert into User(User_ID, Password,Registration_Date, UserName, Nickname,EMail,BlackList) values(@User_ID, @Password,@Registration_Date,@UserName, @Nickname,@EMail,@BlackList)"
             UpdateCommand="update [User] set,Password=@Password,Registration_Date=@Registration_Date,UserName=@UserName,Nickname=@Nickname,EMail=@EMail where User_ID=@User_ID"
                >

            </asp:SqlDataSource>
            <h1>會員註冊</h1>
            <div class="form-group ">
                <label for="User_ID" class="font16">會員帳號：</label>
                <asp:TextBox ID="User_ID" class="form-control" runat="server" placeholder="需為五到十碼" OnTextChanged="txtID_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="16pt"></asp:Label>
                <%--<span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Font-Size="16pt" runat="server" ErrorMessage="(必填)" ForeColor="Red" ControlToValidate="User_ID" Display="Dynamic"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Font-Size="16pt" runat="server" ErrorMessage="輸入格式錯誤，需為五到十碼" Display="Dynamic" ValidationExpression="^.{5,10}$" ControlToValidate="User_ID" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group ">
                <label for="Password" class="font16">密碼：</label>
                <asp:TextBox ID="Password" class="form-control" runat="server" placeholder="請輸入密碼" TextMode="Password" ></asp:TextBox>
               <%-- <span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Font-Size="16pt" runat="server" ErrorMessage="(必填)" ForeColor="Red" ControlToValidate="Password"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group ">
                <label for="rePassword" class="font16">再次輸入密碼：</label>
                <asp:TextBox ID="rePassword" class="form-control" runat="server" placeholder="請輸入密碼" TextMode="Password" ></asp:TextBox>
               <%-- <span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Font-Size="16pt" ErrorMessage="輸入不一致" ForeColor="Red" ControlToCompare="Password" ControlToValidate="rePassword" Display="Dynamic"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Font-Size="16pt" runat="server" ErrorMessage="(必填)" ForeColor="Red" ControlToValidate="Password"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="Registration_Date" class="font16">註冊日期：</label>
                <asp:Label ID="Registration_Date" class="form-control" runat="server"></asp:Label>
            </div>
            <div class="form-group <%--has-error has-feedback--%>">
                <label for="UserName" class="font16">姓名：</label>
                <asp:TextBox ID="UserName"  class="form-control" runat="server" placeholder="請輸入姓名"></asp:TextBox>
                <%--<span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="16pt" runat="server" ErrorMessage="(必填)" ForeColor="Red" ControlToValidate="UserName"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="Nickname" class="font16">暱稱：</label>
                <asp:TextBox ID="Nickname" class="form-control" runat="server" placeholder="請輸入暱稱"></asp:TextBox>
                
            </div>
            <div class="form-group ">
                <label for="EMail" class="font16">Email：</label>
                <asp:TextBox ID="EMail" runat="server" class="form-control" placeholder="Email" OnTextChanged="txtEmail_TextChanged" AutoPostBack="true" ></asp:TextBox>
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Font-Size="16pt"></asp:Label>
                <%--<span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Font-Size="16pt" runat="server" ErrorMessage="(必填)" ForeColor="Red" ControlToValidate="EMail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Font-Size="16pt" runat="server" ErrorMessage="輸入格式錯誤" Display="Dynamic" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="EMail" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>


            <asp:Button  ID="Button1" runat="server" type="submit" class="btn btn-default" OnClick="Button1_Click" Text="送出"></asp:Button>
        </div>
    </form>



 <%--   <form id="form1" runat="server">
    <div>--%>

<%--        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" 
            SelectCommand="SELECT * FROM [User]" 
            InsertCommand="Insert into User(@User_ID,@Password,@Registration_Date,@UserName,@Nickname,@E-Mail)"
            >
        </asp:SqlDataSource>--%>



       <%-- <div class="container" style="border: 1px solid">
            <div>
                <div ><span class="col-sm-4">會員編號：</span><asp:TextBox ID="TextBox2" runat="server" Text="需為五碼"  class="col-sm-8"></asp:TextBox></div>
                <div><span  class="col-sm-4">密碼：</span><asp:TextBox ID="TextBox7" runat="server" Text="請輸入密碼"  class="col-sm-8"></asp:TextBox></div>
                <div><span  class="col-sm-4">註冊日期：</span>
                    <asp:Label ID="Datetime" runat="server"></asp:Label></div>
                <div><span  class="col-sm-4">姓名：</span><asp:TextBox ID="TextBox5" runat="server" Text="請輸入姓名"  class="col-sm-8"></asp:TextBox></div>
                <div><span  class="col-sm-4">暱稱：</span><asp:TextBox ID="TextBox1" runat="server" Text="請輸入暱稱"  class="col-sm-8"></asp:TextBox></div>
                <div><span  class="col-sm-4">E-mail：</span><asp:TextBox ID="TextBox3" runat="server" Text="請輸入E-mail"  class="col-sm-8"></asp:TextBox></div>
            </div>
        </div>

    </div>
    </form>--%>
</body>
</html>
