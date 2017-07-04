<%@ Page Language="C#" AutoEventWireup="true" CodeFile="idea.aspx.cs" Inherits="idea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/idea.css" rel="stylesheet" />

    <title>StoryMaker核心理念</title>
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
                <h1>製作理念</h1>
                <p id="P1"></p>
                <a href="#" class="btn btn-primary">Learn more ....</a>
            </div>
            <div class="media-body">
                <div class="panel panel-heading"><h3>背景與動機</h3></div>
                
                <div class="panel-body">
                    在現今大環境下，很難找到能夠錄製多樣化聲音的有聲書，大多是使用預設的固定音效，
                    而這會讓整個有聲書變得死板，缺乏活力，於是在這個前提之下，
                    我們決定製作能夠自由錄音跟任意搭配的圖文有聲書軟體。
                    <br />
                    一般的有聲書在使用時大多缺乏互動遊戲性，而我們所製作的有聲書軟體
                    能讓其更加有趣，例如：在錄製每一頁故事時能夠選擇圖片、幫它加入
                    喜歡的角色元素、同時加入自己的聲音、再加上使用者自身所撰寫的
                    台詞，而串接完以上的所有步驟以後，得到的將是獨一無二屬於自己的
                    有聲書。
                    <br />
                    經過以上這些步驟，如此一來，一般家庭不必為了故事書而大量
                    花費金錢，電子有聲書可以直接載入，而且不用實體書本佔用空間，
                    而且可讓家庭關係更加親密，總結來說，資訊科技都是來自人性，
                    為了讓生活更加豐富所使用，本軟體也是秉持相同理念而設計，
                    期許能為人類提供貢獻。

                </div>

                <div class="panel panel-heading"><h3>目的</h3></div>
                
                <div class="panel-body">
                    <ul>
                        <li>此實作以淺顯易懂的順序，進行故事頁面的編輯、聲音的錄製，並加以合併為影片輸出，以最簡易的步驟去製作個人化的故事。
                        </li>
                        <li>期許本系統可廣泛為家庭或任何故事創作者使用。

                        </li>
                    </ul>
                </div>




            </div>

            
        </div>

    </form>
    <script>
        var intCounter = 0;
        function ShowMessage() {
            intCounter++;
            MEG="每件作品的產生，都有其故事......"
            $('#P1').text(MEG.substr(0, intCounter));
            if (intCounter <= MEG.length)
                setTimeout("ShowMessage()", 200)
        }
        ShowMessage();
    </script>
</body>
</html>
