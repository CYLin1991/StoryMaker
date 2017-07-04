if (!Date.prototype.toISOString) {

    (function () {

        function pad(number) {
            var r = String(number);
            if (r.length === 1) {
                r = '0' + r;
            }
            return r;
        }

        Date.prototype.toISOString = function () {
            return this.getUTCFullYear()
                + '-' + pad(this.getUTCMonth() + 1)
                + '-' + pad(this.getUTCDate())
                + 'T' + pad(this.getUTCHours())
                + ':' + pad(this.getUTCMinutes())
                + ':' + pad(this.getUTCSeconds())
                + '.' + String((this.getUTCMilliseconds() / 1000).toFixed(3)).slice(2, 5)
                + 'Z';
        };

    }());
}

window.onload = function () {

    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
    window.URL = window.URL || window.webkitURL;
    var recorder;

    var d = document.getElementById('d');
    for (var i = 0; i < 256; i++) {
        d.innerHTML += '<div></div>';
    }
    var dd = document.querySelectorAll('#d div');

    var s = document.getElementById('s');
    var p = document.getElementById('p');
    var timer;
    var context = new AudioContext();

    navigator.getUserMedia({ audio: true }, function (stream) {
        var microphone = context.createMediaStreamSource(stream);
        var analyser = context.createAnalyser();
        microphone.connect(analyser);
        //analyser.connect(context.destination);
        analyser.fftSize = 2048;
        var bufferLength = analyser.frequencyBinCount;
        var dataArray = new Uint8Array(analyser.fftSize);
        analyser.getByteFrequencyData(dataArray);

        function update() {
            console.log(dataArray);
            analyser.getByteFrequencyData(dataArray);
            for (var j = 0; j < 256; j++) {
                dd[j].style.height = dataArray[j] + 'px';
                dd[j].style.background = 'rgba(' + (255 - j) + ',' + j * 2 + ',0,1)';
            }
            timer = setTimeout(update, 20);
        }

        s.onclick = function () {
            clearTimeout(timer);
            p.disabled = false;
            s.disabled = true;
            recorder.stop();
            createDownloadLink();
            recorder.clear();
        };

        p.onclick = function () {
            recorder = new Recorder(microphone);
            recorder.record();
            p.disabled = true;
            s.disabled = false;
            update();
        };

        function createDownloadLink() {
            recorder.exportWAV(function (blob) {
                var url = URL.createObjectURL(blob);
                var li = document.createElement('li');
                var au = document.createElement('audio');
                var hf = document.createElement('a');

                au.controls = true;
                au.src = url;
                hf.href = url;
                hf.download = new Date().toISOString() + '.wav';

                hf.innerHTML = hf.download;
                li.appendChild(au);
                li.appendChild(hf);
                recordingslist.appendChild(li);
            });
        }

    }, function () {
        console.log('error');
    });
};