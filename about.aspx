<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/about.css" rel="stylesheet" />
    <title>StoryMaker團隊介紹</title>
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
                    <li><a runat="server" href="RecorderHome.aspx" id="A1"><span class="glyphicon glyphicon-home">首頁</span></a></li>
                    <li><a runat="server" href="RecorderHome.aspx" id="A2"><span class="glyphicon glyphicon-record">錄音</span></a></li>
                    <li><a runat="server" href="PageShow.aspx" id="A3"><span class="glyphicon glyphicon-list-alt">故事總覽</span></a></li>
                    <li><a runat="server" href="about.aspx" id="A4"><span class="glyphicon glyphicon-user">團隊</span></a></li>
                    <li><a runat="server" href="idea.aspx" id="A5"><span class="glyphicon glyphicon-star">理念</span></a></li>

                </ul>
            </div>
            </div>
        </div>
        <div class="container">
            
            <div class="jumbotron">
                <h1>製作團隊</h1>
                <p id="P1"></p>
                <a href="#" class="btn btn-primary">Learn more ....</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                    <div class="media">
                        <div class="col-md-6">
                            <div class="media-left">
                                <a href="#">
                                    <img src="images/team.jpg" width="200" height="200" class="media-object img-thumbnail" />
                                </a>
                            </div>
                            <div class="media-body">
                                <h2 class="media-heading">StoryMaker專案小組</h2>
                                <p class="font-16">
                                    原本是一群來自<span class="red">醫管</span>、<span class="yellow">特教</span>、<span class="green">生技</span>、<span class="blue">化材</span>、<span class="purple">木工</span>的學者。如今他們捨棄舊有光環，全心全意投身於<span class="red">資訊領域</span>。他們了解現今資訊在生活上的重要性，及行動商務對未來的發展性，

                                    利用原來在學術界培養的<span class="green">強大學習力</span>運用於程式設計、網站系統的實作。在2017年高屏澎東分署的<span class="blue">行動商務系統設計與開發班</span>，跟隨<span class="orange">廖老師</span>的腳步一點一滴完成整套網站資訊系統及資料庫管理的能力奠定，

                                    並利用半年所學完成這套<span class="purple">StoryMaker</span>的系統架設。也透過<span class="green">系統分析與設計</span>一次又一次的研討和資料塑模，了解整套系統「從無到有」的整套流程。從原來對程式設計一無所知的<span class="red">社會新鮮人</span>，

                                    <span class="yellow">脫胎換骨</span>成為能在資訊工程獨當一面的程式設計師。但他們不會就此滿足，對於<span class="purple">最新技術</span>及趨勢也會隨時關注，將成為資訊界不可小覷的<span class="red">良苗</span>。
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="media-left">
                                <a href="#">
                                    <img src="images/mario_with_hammer_3.png" width="200" height="300" class="media-object img-thumbnail" />
                                </a>
                            </div>
                            <div class="media-body">
                                <h2 class="media-heading">來自逆天堂的技術顧問</h2>
                                <p class="font-16">
                                    是日本遊戲設計師宮本茂設計的一個<span class="blue">虛構遊戲人物</span>，他也是電視遊戲系列作品中的主角，同時也是該公司的<span class="red">吉祥物</span>。瑪利歐身高1米55，現居<span class="green">蘑菇王國</span>，是一位矮小結實的義大利水管工。由於多次挫敗庫巴綁架<span class="pink">碧琪公主</span>的計劃，
                                    
                                    瑪利歐的英名傳遍<span class="green">蘑菇王國</span>，並影響到和周邊一些國家。他的<span class="orange">勇敢的個性</span>、<span class="yellow">熱情無畏的精神</span>、敏捷的體格、跳躍技能、以及與<span class="pink">碧琪公主</span>的友情也更加鞏固了他的名聲。
                                    
                                    瑪利歐很喜歡意式麵食，也很喜歡熱帶海鮮。口頭禪為<span class="purple">「Let's a-go!」</span>!!
                                </p>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </div>
    </form>
    <script>
        var intCounter = 0;
        function ShowMessage() {
            intCounter++;
            MEG = "無資訊相關背景，努力創建而成"
            $('#P1').text(MEG.substr(0, intCounter));
            if (intCounter <= MEG.length)
                setTimeout("ShowMessage()", 200)
        }
        ShowMessage();
    </script>
</body>
</html>
