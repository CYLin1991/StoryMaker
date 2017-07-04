$(document).ready(function () {
    if ($('.item').length > 0) {
        $('#divNone').hide();
        $('.item').first().addClass('active');
    }
    else
    {
        $('#divRec').hide();
        $('#carousel1').hide();
    } 
    $('.btnA').click(function (even) {
        var storyT = $('#lblStory').text();
        var pageT = $(this).children().text().toString();
        var imageT = $(this).attr('id').toString();
        var image2 = $(this).parent(".imgContain");
        $(image2).animate({ width: '0px', height: '0px' }, 300, 'linear', function () {
            $(this).hide();
            $(document).delay(5000, function () {
                $.ajax({
                    type: 'POST',
                    url: 'StoryService.asmx/DelImage',
                    data: { Image: imageT, Story: storyT, Page: pageT },
                    success: function () {
                        alert('您刪除了一張圖片');

                        window.location.href = "PageShow.aspx";
                    },
                    error: function () {
                        alert('操作無效');
                    }
                });
            });

        });
        //alert(storyT + " ; " + pageT + " ; " + imageT);

    });


    //var embed1 = document.createElement("embed");
    //	        embed1.src = "0001.wav"; //你的音效檔案位置 
    //	        embed1.hidden = "true";
    //	        document.body.appendChild(embed1); 
    var pageNo = 1;
    var MusicNo;
    var Sound;

    function add0(str, length) {
        if (str.length >= length)
            return str
        else
            return ("0" + str)
    }

    function MusicChange()
    {       
        MusicNo = "#sound" + add0(pageNo.toString(), 2);
        Sound = $(MusicNo);
        if (Sound.length > 0)//檢查ID為sound"NN"(<audio>)的物件是否存在
            Sound.attr('controls', 'controls');
    }
    MusicChange();
    //alert(MusicNo);
    function MusicStop()
    {       
        if (Sound.length > 0) {
            Sound.trigger('pause');
            Sound.prop("currentTime", 0);
            Sound.removeAttr("controls");
        }
    }

    $('.carousel-control').click(function () {
        MusicStop();
        switch ($(this).prop('id'))
        {
            case "prev":
                if (pageNo > 1)
                    pageNo--;
                else pageNo = $('.item').length;
                break;
            case "next":
                if (pageNo < $('.item').length)
                    pageNo++;
                else pageNo = 1;
                break;
        }
        MusicChange();
        //alert(MusicNo);
    })

    //$('input.imgBtn').mouseover(function () {
    //    $(this).attr("bacrground-color","gold")
    //})
})

