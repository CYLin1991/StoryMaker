<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>StoryMaker</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/Success.css" rel="stylesheet" />
    <style>

    </style>
    <script>
        $(document).ready(function () {
            function shining() {
                $('#lblUserName').delay(3000).fadeTo(1, 0, 'linear', function () {
                    $('#lblUserName').delay(500).fadeTo(1, 1, 'linear', function () {
                        shining()
                    });
                })
            }
            shining();
        })
    </script>
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
                    <li><a href="RecorderHome.aspx" id="pages1_bt"><span class="glyphicon glyphicon-home">首頁</span></a></li>
                    <li><a href="RecorderHome.aspx" id="pages2_bt"><span class="glyphicon glyphicon-record">錄音</span></a></li>
                    <li><a href="PageShow.aspx" id="pages3_bt"><span class="glyphicon glyphicon-list-alt">故事總覽</span></a></li>
                    <li><a href="about.aspx" id="pages4_bt"><span class="glyphicon glyphicon-user">團隊</span></a></li>
                    <li><a href="idea.aspx" id="pages5_bt"><span class="glyphicon glyphicon-star">理念</span></a></li>

                </ul>
            </div>
            </div>
        </div>
        <div class="container">

            <br />
            <div class="alert alert-success">
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </div>

            <div class="col-md-12">
                <div class="pull-right ">
                    <asp:Button ID="SignOut" runat="server" CssClass="btn" Text="登出" OnClick="SignOut_Click" />
                </div>
            </div>


            <div class="col-md-7">
                <h2>會員資料</h2>
                <br />
                <%--<asp:Label ID="Label1" runat="server" Text="會員資料"></asp:Label>--%>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="User_ID" HeaderText="User_ID" ReadOnly="True" SortExpression="User_ID" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:BoundField DataField="Registration_Date" HeaderText="Registration_Date" SortExpression="******" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="Nickname" HeaderText="Nickname" SortExpression="Nickname" />
                        <asp:BoundField DataField="E-Mail" HeaderText="EMail" SortExpression="EMail" />
                        <%--                <asp:CheckBoxField DataField="BlackList" HeaderText="BlackList" SortExpression="BlackList" />--%>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-5">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
                <h2>故事列表</h2>
                <br />
                <asp:Panel ID="pnlStory" runat="server">
                </asp:Panel>

                <div class="pull-right">
                    <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">NewStory</a>
                </div>
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">新增故事</h4>
                        </div>
                        <div class="modal-body">
                            <div id="form2" runat="server" class="form-horizontal container">
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">請輸入故事名稱:</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="請輸入20字以內的故事名稱" Display="Dynamic" ValidationGroup="new" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="請輸入20字以內的故事名稱" Display="Dynamic" ValidationExpression="^.{1,20}$" ControlToValidate="txtName" ForeColor="Red" ValidationGroup="new"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-offset-3 col-md-9">
                                        <asp:Button ID="new" runat="server" Text="完成" CssClass="btn btn-success" OnClick="new_Click" ValidationGroup="new" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>"
                SelectCommand="SELECT * FROM [User] where User_ID=@User_ID">
                <SelectParameters>
                    <asp:SessionParameter SessionField="id" Name="User_ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>
 </form>
</body>
</html>
