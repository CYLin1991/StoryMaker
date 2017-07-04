 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="test02.aspx.cs" Inherits="test02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>StoryMaker</title>

     <%--↓↓↓↓↓jQuery bootstrap 自行更改路徑↓↓↓↓↓--%>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/html2canvas.js"></script>
    <link href="Content/test02.css" rel="stylesheet" />
    <%--↑↑↑↑↑jQuery bootstrap 自行更改路徑↑↑↑↑↑--%>
    <style>
         #MakerTemplate {
            background-image: url('圖/BG004.jpg');
            background-size:contain;
            background-repeat:no-repeat;
            border:5px solid black;
        }
    </style>
    <script>
        var StoryServiceUrl = 'StoryService.asmx/SaveImage'
        var A;
        //alert(typeof(A));
        function allowDrop(ev) {
            ev.preventDefault();
        }
        function drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
        }
        function drop(ev) {
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            ev.target.appendChild(document.getElementById(data));
        }
        var sessionc = sessionStorage.canvas
        //alert(sessionc)
        $(document).ready(function () {
            
            
            var imgCount = 1;//畫布中新增的圖片ID變數
            var imgVal;//圖片的html變數
            var imgSrc = "圖/AAAAA.png";//被選的圖片的路徑以變數存放，並給預設值
            if(sessionStorage.Canvas)
            $("#Canvas").html(
                          $("<img />", { src: sessionc, "class": "output" }
                ));
            //var img5 = '<asp:Image ID="Image1" runat="server" ImageUrl="' + A + '" />';
            //$("#Canvas").append(img5);
<%--            var St=<%=Session["Save"]%>;
            alert(St);--%>
 

            //對可放置的Div做點擊事件
            $('.Box1').click(function () {
                //只要被選中的圖片為橡皮擦，就將Div裡面的東西清空--操作DOM
                //若不是，先將Div裡原來的圖片清空，再將圖片塞進去--同樣是操作DOM
                if (imgSrc.valueOf() == "圖/eraser.gif") {
                    $(this).children().remove();
                }
                else {
                    imgVal = "<img id='image" + imgCount + "' src=" + imgSrc
                             + " draggable='true' ondragstart='drag(event)' />"
                    imgCount++;
                    $(this).children().remove();//先將原來Div有的圖片
                    $(this).append(imgVal);
                }
            })
            
            //當"素材選擇"按下去show出類別按鈕並以botton group的形式呈現--bootstrap的botton group
            $('#SortSelect button').click(function () {
                $(this).siblings().show();
                $(this).parent().addClass('btn-group')
            })

            var imgBackground;//背景變數
            $('.BGselect').click(function () {
                //"選擇背景"裡的清單點擊時，把下一層看不見的圖片ID放進背景變數並改變畫布的背景屬性
                imgBackground = "url("+$(event.target).attr('src').valueOf()+")";
                $('#MakerTemplate').css('background-image',imgBackground.valueOf() );
            })

            //當素材名稱被點擊時 素材清單以下拉式切換顯示
            //將類別選單中的id和素材清單中的class都設有Sort_id故可做為jQuery選擇器的篩選條件
            //可參考把字變大變小的寫法--錄影檔"jQuery2"把程式寫活
            $('.sort').click(function () {
                var imgclass = "." + $(this).prop('id');//取id值的另一種寫法，並在id字串前面加入"."
                                                        //使其成為類別選擇器的關鍵字
                $('#row2').slideUp(200, 'linear', function () {
                    //$('#BakList td').hide()
                    //$('#MatList td').hide();
                    //先把所有素材藏起來imgContain
                    $('.imgContain').hide()
                    $(imgclass).parent().show();//再把選到的圖片(class=Sort_id)顯示
                    //由於是在選單收回的callback Function轉換所以看起來很像清單切換
                });
                $('#row2').delay(200);
                $('#row2').slideDown(200, 'linear');
            })
            
            //將素材圖設定change類別，並做點擊事件
            $('.change').click(function (event) {
                //將路徑變數更改為選取的圖片路徑--配合上方的$('.box1').clilck事件              
                if ($(event.target).is('img')) {
                    imgSrc = $(event.target).attr('src').valueOf();
                    //類別選單收回
                    $('#SortSelect button').siblings().hide();
                    $('#SortSelect').removeClass('btn-group');
                }
                //橡皮擦跟目前選用的素材按鈕顏色切換
                if ($(event.target).prop('id') != "eraser") {
                    //如不是橡皮擦
                    $('#NowMat').attr('src', $(event.target).attr('src').valueOf())
                    $('#NowMat').removeClass().addClass('btn btn-danger change')//目前素材改為紅色
                    $('#eraser').removeClass().addClass('btn btn-default change')//橡皮擦改成綠色
                } else {
                    //相反
                    $('#eraser').removeClass().addClass('btn btn-danger change')
                    $('#NowMat').removeClass().addClass('btn btn-default change')
                }

            })
            $('#preview').click(function () {
                html2canvas($("#MakerTemplate"), {
                    onrendered: function (canvas) {
                        // canvas is the final rendered <canvas> element
                        //$("#Canvas").html(canvas);

                        var myImage = canvas.toDataURL("image/png");
                        $("#Canvas").html($("<img />", { src: myImage, "class": "output" }));
                        sessionStorage.canvas = myImage;
                        //window.open(myImage);
                        //A = myImage;
                    }
                });
            });
            $('#save').click(function () {
                A = sessionStorage.canvas;
                //alert($('#UserID').text() + ";" + $('#StoryID').text()+";"+A);
                $.ajax({
                    type: 'POST',
                    url: StoryServiceUrl,
                    data: { Image: A, Story: $('#StoryID').text(), User: $('#UserID').text() },                  
                    success: function () {
                        //alert($('#UserID').text() + ";" + $('#StoryID').text());
                        alert('您新增了一張圖片');
                        window.location.href="PageShow.aspx"
                    },
                    error: function () {
                        alert('操作無效');
                    }
                });
            });


        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" SelectCommand="SELECT * FROM [Sort] WHERE [Sort_id] like '9%'">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" SelectCommand="SELECT * FROM [Sort] WHERE [Sort_id] like '0%' ORDER BY [Sort_id]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" SelectCommand="SELECT * FROM [Mat_Classify_View] WHERE [Sort_id] like '0%'">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:StoryMakerTestConnectionString %>" SelectCommand="SELECT * FROM [Mat_Classify_View] WHERE [Sort_id] like '9%'">
        </asp:SqlDataSource>
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
     <div class="container" style="height:1200px">
         <%--<asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>--%>
         <asp:Label ID="UserID" runat="server" Text="" CssClass="invisible"></asp:Label><span class="invisible">;</span><asp:Label ID="StoryID" runat="server" Text="" CssClass="invisible"></asp:Label>
         <br />
         <input id="preview" type="button" class="btn" value="Preview" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"/>
         
         <asp:Button ID="Cancel" runat="server" CssClass="btn" Text="取消編輯" OnClick="Cancel_Click" />
         <asp:Panel ID="row1" runat="server" CssClass="row">
             <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                             </button>
                             <h4 class="modal-title" id="exampleModalLabel">圖片預覽</h4>
                         </div>
                         <div class="modal-body">
                             <div id="form2" runat="server" class="form-horizontal container">
                                 <div class="form-group">
                                     <div class="col-md-9">
                                         <div id="Canvas">
                                         </div>

                                     </div>
                                 </div>

                                 <div class="form-group">
                                     <div class="col-md-offset-5 col-md-1">
                                         <input id="save" type="button" value="save" />
                                         <%--<asp:Button ID="new" runat="server" Text="確定" CssClass="btn btn-success" ValidationGroup="new" />--%>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-10" id="col1">
             <table id="MakerTemplate">
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>         
             </table>
        </div>
<%--             <div class="col-md-2">
                 <div id="Canvas2">
                 </div>

             </div>--%>
             <%--col-md-2--%>
         </asp:Panel>
         <br />
         <div class="row">
             <div class="col-md-1">
                 <div class="dropdown">
                     <div class="btn-group">
                         <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">
                             選擇背景
                             <span class="caret"></span>
                         </button>
                         <ul class="dropdown-menu btn-warning">
                             <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                 <ItemTemplate>
                                     <li class="btn-warning"><a class="sort" id="<%# Eval("Sort_ID") %>"><%#ImageName("Sortname") %></a></li>
                                 </ItemTemplate>
                             </asp:Repeater>
                         </ul>
                     </div>
                 </div>
             </div>
             <div class="col-md-2" id="col2">
                 <img id="eraser" class="btn btn-default btn-sm change" src="圖/eraser.gif" />
                 <img id="NowMat" class="btn btn-danger btn-sm change" src="圖/AAAAA.png" />
             </div>
             <div class="col-md-8">
                 <div class="btn " id="SortSelect" role="group" aria-label="Basic example">
                     <button type="button" class="btn btn-success">素材選擇</button>
                     <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                         <ItemTemplate>
                             <span id="<%# Eval("Sort_ID") %>" class="btn btn-success sort"><%# Eval("Sortname") %></span>
                         </ItemTemplate>
                     </asp:Repeater>
                 </div>
             </div>
         </div>
         <br />
         

<%--         <asp:Image ID="Image1" runat="server" />--%>
         <div class="row " id="row2">
             <div id="BakList" class="col-xs-11 col-md-10 btn-primary">
                 <asp:ListView ID="ListView1" runat="server" DataKeyField="Image_ID" DataSourceID="SqlDataSource4">
                     <ItemTemplate>
                    <div class="imgContain col-xs-4 col-sm-2" >
                        <img class="<%# Eval("Sort_ID") %> BGselect" title="<%# Eval("ImageName") %>"  src="圖/<%# Eval("Image_ID") %>.jpg" />
                    </div>
                </ItemTemplate>
                 </asp:ListView>
             </div>
             <div id="MatList" class="col-xs-11 col-md-10 btn-primary">
                 <asp:ListView ID="ListView2" runat="server" DataKeyField="Image_ID" DataSourceID="SqlDataSource3">
                     <ItemTemplate>
                    <div class="imgContain col-xs-4 col-sm-2" >
                        <img class="<%# Eval("Sort_ID") %> change" title="<%# Eval("ImageName") %>"  src="圖/<%# Eval("Image_ID") %>.png" />
                    </div>
                </ItemTemplate>
                 </asp:ListView>
             </div>
         </div>

    </div>
    </form>
    <script>
        var Box1 = "<div class='Box1' ondrop='drop(event)' ondragover='allowDrop(event)'></div>"
        $('#MakerTemplate td').append(Box1);//在畫布的每個td加入可托放的Div
        $('#SortSelect').removeClass('btn-group')
        $('#SortSelect button').siblings().hide();
        $('#row2').hide();
        
    </script>
</body>
</html>
