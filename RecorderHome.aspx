<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecorderHome.aspx.cs" Inherits="RecorderHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>StoryMaker</title>
    <script src="Scripts/record01.js"></script>
    <script src="Recorderjs-master/dist/recorder.js"></script>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-1.9.1.js"></script>

    <script type="text/javascript" src="Scripts/1.4.2JavaScript.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.slidertron-0.1.js"></script>
    <link href="Content/slidertron.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="Content/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        @import "slidertron.css";
    </style>
    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('New message to ' + recipient)
            modal.find('.modal-body input').val(recipient)
        })

        $('#myTabs a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });

    </script>
    <style>
        #d {
            height: 256px;
            width: auto;
        }

            #d:after {
                content: '';
                display: inline-block;
                height: 256px;
            }

            #d div {
                display: inline-block;
                width: 1px;
                margin: 0 0 0 1px;
                vertical-align: bottom;
            }

        ul {
            list-style: none;
        }

        #recordingslist audio {
            display: block;
            margin-bottom: 10px;
        }
        /*當解析度為手機大小時*/
        @media screem and (max-width:480px) {
        
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="logo">
                <h1><a href="#">Story Maker </a></h1>
                <p><em>Design by <a href="#">yourself</a></em></p>
            </div>
            <div id="header">
                <div id="menu">
                    <ul>
                        <li><a href="RecorderHome.aspx" id="pages1_bt"><span class="glyphicon glyphicon-home">首頁</span></a></li>
                    <li><a href="RecorderHome.aspx" id="pages2_bt"><span class="glyphicon glyphicon-record">錄音</span></a></li>
                    <li><a href="PageShow.aspx" id="pages3_bt"><span class="glyphicon glyphicon-list-alt">故事總覽</span></a></li>
                    <li><a href="about.aspx" id="pages4_bt"><span class="glyphicon glyphicon-user">團隊</span></a></li>
                    <li><a href="idea.aspx" id="pages5_bt"><span class="glyphicon glyphicon-star">理念</span></a></li>
                    </ul>
                </div>
                <!-- end #menu -->
                <div id="search">
                    <div>
                        <fieldset>
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">登入</button>

                            <!--<input type="text" name="s" id="search-text" size="15" />-->
                        </fieldset>
                    </div>
                </div>
                <!-- end #search -->
            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">登入畫面</h4>
                        </div>
                        <div class="modal-body">
                            <div class="well">
                                <div id="form2" runat="server" class="form-horizontal container">
                                    
                                    <ul class="nav nav-tabs" role="tablist" id="myTabs" style="width:45%">
                                        <li role="presentation" class="active"><a href="#Users" aria-controls="Users" role="tab" data-toggle="tab">Users</a></li>
                                        <li role="presentation" ><a href="#Administrator" aria-controls="Administrator" role="tab" data-toggle="tab">Administrator</a></li>
                                    </ul>

                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="Users">

                                            <div id="container1">
                                                <br />
                                                <div class="form-group">
                                                    <label for="email" class="col-md-3 control-label">使用者帳號:</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtus_ID" runat="server"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="輸入格式錯誤，頂多十碼" Display="Dynamic" ValidationExpression="^.{5,10}$" ControlToValidate="txtus_ID" ForeColor="Red" ValidationGroup="User"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password" class="col-md-3 control-label">使用者密碼:</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtus_Pwd" runat="server" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">

                                                    <div class="col-md-offset-3 col-md-9">
                                                        
                                                        <div class="form-group">

                                                            <%--<asp:CheckBox ID="RememberMe" runat="server" Text="記憶密碼供下次使用。" />--%>
                                                            <input id="Checkbox1" type="checkbox" />
                                                            <label for="Checkbox1" class="control-label">Remember me?</label>
                                                        </div>
                                                        <a href="newUsers.aspx">
                                                            <div>還不是會員嗎？註冊新會員</div>
                                                        </a>

                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="Button1" runat="server" Text="登入" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="User" />
                                                        <input id="Reset1" type="reset" value="取消" class="btn btn-default" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane " id="Administrator">
                                            <div id="container2">
                                                <div class="form-group">
                                                    <br />
                                                    <label for="email" class="col-md-3 control-label">管理者帳號:</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtad_ID" runat="server"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="輸入格式錯誤，需為五碼" Display="Dynamic" ValidationExpression="^.{5}$" ControlToValidate="txtad_ID" ForeColor="Red" ValidationGroup="AD" ></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password" class="col-md-3 control-label">管理者密碼:</label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtad_Pwd" runat="server" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">

                                                    <div class="col-md-offset-3 col-md-9">
                                                        <div class="form-group">

                                                            <%--<asp:CheckBox ID="RememberMe" runat="server" Text="記憶密碼供下次使用。" />--%>
                                                            <input id="Checkbox2" type="checkbox" />
                                                            <label for="Checkbox2" class="control-label">Remember me?</label>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="Button2" runat="server" Text="登入" CssClass="btn btn-primary" OnClick="Button2_Click" ValidationGroup="AD" />
                                                        <input id="Reset2" type="reset" value="取消" class="btn btn-default" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--<div class="modal-footer">
                    
                </div>-->
                    </div>
                </div>
            </div>



            <hr />
            <!-- end #logo -->
            <div id="slideshow">
                <!-- start -->
                <div id="foobar">
                    <div id="col1"><a href="#" class="previous">&nbsp;</a></div>
                    <div id="col2">
                        <div class="viewer">
                            <div class="reel">
                                <div class="slide">
                                    <img src="images/img04.jpg" width="726" height="335" alt="" />
                                    <span>Lorem Ipsum Dolor Sit Amet.</span>
                                </div>
                                <div class="slide">
                                    <img src="images/img07.jpg" width="726" height="335" alt="" />
                                    <span>Mauris vitae nisl nec metus placerat consectetuer.</span>
                                </div>
                                <div class="slide">
                                    <img src="images/img08.jpg" width="726" height="335" alt="" />
                                    <span>Nam bibendum dadn nulla tortor elementum ipsum</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="col3"><a href="#" class="next">&nbsp;</a></div>
                </div>
                <script type="text/javascript">

                    $('#foobar').slidertron({
                        viewerSelector: '.viewer',
                        reelSelector: '.viewer .reel',
                        slidesSelector: '.viewer .reel .slide',
                        navPreviousSelector: '.previous',
                        navNextSelector: '.next',
                        navFirstSelector: '.first',
                        navLastSelector: '.last'
                    });

                </script>
                <!-- end -->
            </div>

            <div id="page">
                <div id="page-bgtop">
                    <div id="content">
                        <div class="post">
                            <div id="recorder">
                                <h2 class="title"><a href="#">錄製配音</a></h2>
                                <asp:Button ID="p" CssClass="glyphicon glyphicon-record" runat="server" Text="錄製" CausesValidation="false" />
                                <asp:Button ID="s" CssClass="glyphicon glyphicon-stop" runat="server" Text="停止" CausesValidation="false" />
                                <%--<button id="p" class="glyphicon glyphicon-record">錄製</button>
                                <button id="s" class="glyphicon glyphicon-stop" disabled="disabled">停止</button>--%>

                                <div id="pic">
                                    <div id="d"></div>
                                </div>

                                <h2>錄音檔下載</h2>
                                <ul id="recordingslist"></ul>
                            </div>
                            
                        </div>
                       
                    </div>


                    <!-- end #content -->
                    <div id="sidebar">
                        <ul>
                            <li>
                                <h2>Aliquam tempus</h2>
                                <p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in consectetuer hendrerit, volutpat.</p>
                            </li>
                            <li>
                                <h2>Pellenteque ornare </h2>
                                <ul>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                    <li><a href="#">Magna lacus bibendum mauris</a></li>
                                    <li><a href="#">Velit semper nisi molestie</a></li>
                                    <li><a href="#">Eget tempor eget nonummy</a></li>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                    <li><a href="#">Velit semper nisi molestie</a></li>
                                    <li><a href="#">Eget tempor eget nonummy</a></li>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                </ul>
                            </li>
                            <li>
                                <h2>Turpis nulla</h2>
                                <ul>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                    <li><a href="#">Magna lacus bibendum mauris</a></li>
                                    <li><a href="#">Velit semper nisi molestie</a></li>
                                    <li><a href="#">Eget tempor eget nonummy</a></li>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                    <li><a href="#">Magna lacus bibendum mauris</a></li>
                                    <li><a href="#">Velit semper nisi molestie</a></li>
                                    <li><a href="#">Eget tempor eget nonummy</a></li>
                                    <li><a href="#">Nec metus sed donec</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- end #sidebar -->
                    <div style="clear: both;">&nbsp;</div>
                </div>
                <!-- end #page -->
            </div>
            <div id="footer">
               
            </div>
            <!-- end #footer -->
        </div>
    </form>
</body>
</html>
