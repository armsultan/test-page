        var ref;
        function checkRefresh() {

            if (document.cookie.indexOf('refresh=1') != -1 ) {
                document.getElementById("check").checked = true;
                ref = setTimeout(function () { location.reload(); }, 1000);
            } else {
            }
        }
        function changeCookie() {
            if (document.getElementById("check").checked) {
                document.cookie = "refresh=1";
                ref = setTimeout(function () { location.reload(); }, 1000);
            } else {
                document.cookie = "refresh=0";
                clearTimeout(ref);
            }
        }
