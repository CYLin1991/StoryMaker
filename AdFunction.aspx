 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdFunction.aspx.cs" Inherits="AdFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>StoryMaker的後花園</title>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <link href="Content/ADstyle.css" rel="stylesheet" />
    <style>
       body {
    background-color: #337ab7;
    background-image: url('images/snow03.png');
}

.nav-tabs {
    border-bottom: 1px solid white;
}

    .nav-tabs > li {
        float: left;
        margin-bottom: -1px;
        background-color: #5f8db5;
    }

        .nav-tabs > li > a {
            margin-right: 2px;
            line-height: 1.42857143;
            border: 1px solid white;
            border-radius: 4px 4px 0 0;
            color:white;
        }

            .nav-tabs > li > a:hover {
                border-color: #eee #eee #ddd;
                color:#337ab7;
            }

        .nav-tabs > li.active > a,
        .nav-tabs > li.active > a:hover,
        .nav-tabs > li.active > a:focus {
            color: white;
            cursor: default;
            background-color: black;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
        }

    .nav-tabs.nav-justified {
        width: 100%;
        border-bottom: 0;
    }

        .nav-tabs.nav-justified > li {
            float: none;
            
        }

            .nav-tabs.nav-justified > li > a {
                margin-bottom: 5px;
                text-align: center;
            }

        .nav-tabs.nav-justified > .dropdown .dropdown-menu {
            top: auto;
            left: auto;
        }

@media (min-width: 768px) {
    .nav-tabs.nav-justified > li {
        display: table-cell;
        width: 1%;
    }

        .nav-tabs.nav-justified > li > a {
            margin-bottom: 0;
        }
}

.nav-tabs.nav-justified > li > a {
    margin-right: 0;
    border-radius: 4px;
}

.nav-tabs.nav-justified > .active > a,
.nav-tabs.nav-justified > .active > a:hover,
.nav-tabs.nav-justified > .active > a:focus {
    border: 1px solid #ddd;
}

@media (min-width: 768px) {
    .nav-tabs.nav-justified > li > a {
        border-bottom: 1px solid #ddd;
        border-radius: 4px 4px 0 0;
    }

    .nav-tabs.nav-justified > .active > a,
    .nav-tabs.nav-justified > .active > a:hover,
    .nav-tabs.nav-justified > .active > a:focus {
        border-bottom-color: white;
    }
}
.nav-tabs-justified {
    border-bottom: 0;
}

    .nav-tabs-justified > li > a {
        margin-right: 0;
        border-radius: 4px;
    }

    .nav-tabs-justified > .active > a,
    .nav-tabs-justified > .active > a:hover,
    .nav-tabs-justified > .active > a:focus {
        border: 1px solid #ddd;
    }

@media (min-width: 768px) {
    .nav-tabs-justified > li > a {
        border-bottom: 1px solid #ddd;
        border-radius: 4px 4px 0 0;
    }

    .nav-tabs-justified > .active > a,
    .nav-tabs-justified > .active > a:hover,
    .nav-tabs-justified > .active > a:focus {
        border-bottom-color: black;
    }
}
.nav-tabs .dropdown-menu {
    margin-top: -1px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

.container-fluid > div > h1 {
    color: white;
    font-family: Arial Unicode MS;
    background-color: #337ab7;
    border:3px dashed white;
    width:485px;
    
}

img {
    width: 300px;
    height: 300px;
}

.PageBtn {
    font-family: Webdings;
    text-decoration: none;
}


.btn-success {
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
}

    .btn-success:focus,
    .btn-success.focus {
        color: #fff;
        background-color: #449d44;
        border-color: #255625;
    }

    .btn-success:hover {
        color: #fff;
        background-color: #449d44;
        border-color: #398439;
    }

    .btn-success:active,
    .btn-success.active,
    .open > .dropdown-toggle.btn-success {
        color: #fff;
        background-color: #449d44;
        border-color: #398439;
    }

        .btn-success:active:hover,
        .btn-success.active:hover,
        .open > .dropdown-toggle.btn-success:hover,
        .btn-success:active:focus,
        .btn-success.active:focus,
        .open > .dropdown-toggle.btn-success:focus,
        .btn-success:active.focus,
        .btn-success.active.focus,
        .open > .dropdown-toggle.btn-success.focus {
            color: #fff;
            background-color: #398439;
            border-color: #255625;
        }

    .btn-success:active,
    .btn-success.active,
    .open > .dropdown-toggle.btn-success {
        background-image: none;
    }

    .btn-success.disabled:hover,
    .btn-success[disabled]:hover,
    fieldset[disabled] .btn-success:hover,
    .btn-success.disabled:focus,
    .btn-success[disabled]:focus,
    fieldset[disabled] .btn-success:focus,
    .btn-success.disabled.focus,
    .btn-success[disabled].focus,
    fieldset[disabled] .btn-success.focus {
        background-color: #5cb85c;
        border-color: #4cae4c;
    }

    .btn-success .badge {
        color: #5cb85c;
        background-color: #fff;
    }

    </style>
    <script>
        $(document).ready(function () {
            var MaxChar = 20;
            var AllowKeyIn;
            //var Sort = "00002";
            $('#txtName').keypress(function () {
                AllowKeyIn = MaxChar - $(this).val().length;
                if (AllowKeyIn <= 0) {
                    alert('不得超過20個字')
                    event.preventDefault();
                }
            })
            $('.sort').click(function () {
                $('#txtSort').text($(this).prop('id'));
                $('#ddmSort').text($(this).prop('id'));
            })
            //$('#ddlSortN').change(function () {
            //    var value = $('#ddlSortN option:selected').val();
            //    //alert(value);
            //    Sort = value;
            //    alert(Sort);
            //})
        })
    </script>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <div class="container-fluid">
            <div>
                <h1 class="center-block">歡迎來到StoryMaker的後花園</h1>
            </div>
            <asp:Button ID="SignOut" runat="server" CssClass="btn btn-success pull-right " Text="登出" OnClick="SignOut_Click" />
        </div>
        <div class="container-fluid">
            <ul class="nav nav-tabs nav-justified ">
                <li class="active "><a href="#tab1" data-toggle="tab">素材管理</a></li>
                <li class=""><a href="#tab2" data-toggle="tab">素材新增</a></li>
                <li class=""><a href="#tab3" data-toggle="tab">分類新增</a></li>
            </ul>

        </div>
        <div>


            <div class="tab-content well ">
                <%--tab-content--%>
                <div class="tab-pane active " id="tab1">
                    <%--tab1--%>

                    <div class="container-fluid" id="jumbotron">
                        <%--jumbotron--%>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>"
                            SelectCommand="ClassifyQuery" SelectCommandType="StoredProcedure" DeleteCommand="Del_Material" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl" PropertyName="SelectedValue" Name="Sort_id" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="Image_ID" Type="String" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            SelectCommand="Select_Mat" SelectCommandType="StoredProcedure"
                            UpdateCommand="Update_Mat" UpdateCommandType="StoredProcedure"
                            ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TotalQuery" Name="Image_ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" SelectCommand="SELECT [Sort_id], [Sortname] FROM [Sort]"></asp:SqlDataSource>

                        <div class="col-md-7 container" id="gridView">
                            <%--gridView--%>
                            <asp:DropDownList ID="ddl" runat="server" AutoPostBack="true" AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="Sortname" DataValueField="Sort_id">
                                <asp:ListItem>請選擇分類</asp:ListItem>
                            </asp:DropDownList>
                            <asp:GridView ID="TotalQuery" runat="server" OnDataBound="TotalQuery_DataBound" PageSize="15"
                                AllowPaging="True" CssClass="table table-responsive table-striped"
                                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Image_ID">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" CausesValidation="false" />
                                    <asp:BoundField DataField="Image_ID" HeaderText="素材編號" SortExpression="Image_ID" />
                                    <asp:BoundField DataField="ImageName" HeaderText="素材名稱" SortExpression="ImageName" />
                                    <asp:TemplateField HeaderText="分類" SortExpression="Sortname">
                                        <ItemTemplate>
                                            <span>(</span>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Sort_id") %>'></asp:Label>
                                            <span>)</span>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sortname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"
                                                OnClientClick="return confirm('確定要刪除嗎？')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerTemplate>
                                    <table >
                                        <tr>
                                            <td>頁碼：<asp:DropDownList ID="ddlPager" runat="server" CausesValidation="false" OnSelectedIndexChanged="ddlPager_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                                <asp:LinkButton ID="lbnPrev" runat="server" CssClass="PageBtn" OnClick="ddlPager_SelectedIndexChanged" CausesValidation="false">3</asp:LinkButton>
                                                <asp:LinkButton ID="lbnNext" runat="server" CssClass="PageBtn" OnClick="ddlPager_SelectedIndexChanged" CausesValidation="false">4</asp:LinkButton>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Label ID="lblPageInfo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </PagerTemplate>
                            </asp:GridView>
                        </div>
                        <%--gridView--%>
                        <div class="col-md-4 container-fluid" id="formView">
                            <%--formView--%>
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" OnDataBound="FormView1_DataBound">
                                <HeaderTemplate>
                                    <h1>素材內容</h1>
                                </HeaderTemplate>
                                <EditItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblIDT" runat="server" Text='素材編號:' />
                                            </td>
                                            <td colspan="2">
                                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("Image_ID") %>' />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblNaT" runat="server" Text='素材名稱:' />
                                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='目前分類:' />
                                                <br />
                                                <asp:Label ID="Label5" runat="server" Text='修改選單:' />
                                            </td>
                                            <td>

                                                <asp:Label ID="lblSort" runat="server" Text='<%# Bind("Sort_id") %>' />
                                                <asp:Label ID="lblSortN" runat="server" Text='<%# Eval("SortName") %>' />
                                                <br />
                                                <asp:DropDownList ID="ddlSort" runat="server" DataSourceID="SqlDataSource3" DataTextField="SortName" DataValueField="Sort_id" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <span>圖片預覽:</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <img src="圖/<%# Eval("Image_ID") %><%# File("Sort_id") %>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text="新圖:"></asp:Label>
                                                <asp:FileUpload ID="fulImage" runat="server" />
                                                <asp:Button ID="btnUpload" runat="server" Text="上傳" OnClick="Image_Upload" CausesValidation="false" />
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                    </table>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" ValidationGroup="E" CommandName="Update" OnClientClick="return confirm('確定更新嗎？')" Text="更新"  />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblIDT" runat="server" Text='素材編號:' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("Image_ID") %>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="false" CommandName="Edit" Text="修改" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblNaT" runat="server" Text='素材名稱:' />
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("ImageName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text='分類:' />
                                            </td>
                                            <td>(<asp:Label ID="lblSID" runat="server" Text='<%# Eval("Sort_id") %>' />)
                            <asp:Label ID="lblSN" runat="server" Text='<%# Eval("Sortname") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <span>圖片預覽:</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <img src="圖/<%# Eval("Image_ID") %><%# File("Sort_id") %>" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                        <%--formView--%>
                    </div>
                    <%--jumbotron --%>
                </div>
                <%--tab1--%>
                <div class="tab-pane " id="tab2">
                    <%--tab2--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    
                            <div class="container">
                                <%--container--%>
                                <div class="col-md-offset-4 col-md-4">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <br />

                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="素材編號:"></asp:Label>
                                                <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ValidationGroup="N" ControlToValidate="txtID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="格式有誤" ValidationGroup="N" ControlToValidate="txtID" ForeColor="Red" ValidationExpression="[\w]{5}"></asp:RegularExpressionValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="素材名稱:"></asp:Label>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="N" ErrorMessage="必填" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="N" ErrorMessage="不能超過20字" ControlToValidate="txtName" ForeColor="Red" ValidationExpression="[\w|\W]{1,20}"></asp:RegularExpressionValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label4" runat="server" Text="素材類別:"></asp:Label>

                                                <asp:DropDownList ID="ddlSortN" runat="server" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>  
                                                                        
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="上傳圖片:"></asp:Label>
                                        <asp:FileUpload ID="fulImage" runat="server" />
                                    </div>
                                    <br />                      
                                    <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" ValidationGroup="N" />
                                </div>
                            </div>
                            <%--container--%>
                    
                </div>
                <div class="tab-pane " id="tab3">
                    <div class="container-fluid">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>"
                                SelectCommand="SELECT * FROM [Mat_Classify_View]"
                                InsertCommand="insert into Sort values(@Sort_ID,@SortName)">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="Sort_ID" Type="String" />
                                    <asp:ControlParameter ControlID="TextBox2" Name="SortName" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="種類編號:"></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ValidationGroup="S"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="S" runat="server" ErrorMessage="必填" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="格式有誤" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="[\w]{5}"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="種類名稱:"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ValidationGroup="S"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="S" ErrorMessage="必填" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="S" ErrorMessage="不能超過20字" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="[\w|\W]{1,20}"></asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="Button2" runat="server" Text="新增" OnClick="Button2_Click" ValidationGroup="S" />
                        </div>
                    </div>
            </div>
        </div>

        </div>
    </form>
</body>
</html>
