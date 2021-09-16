    $(document).ready(function() {
        $("#search-box").on('keyup', debounce(function() {
            var $this = $(this);
            var t = $("#search-box").val();
            console.log(t);
            ajaxSearchForText(t);
        }, 500));
    });
    function ajaxSearchForText(text) {
        var base_url = 'https://theeffectbook.net'
        $.ajax({
            url: base_url + '/myscript.php',
            action: 'get',
            data: {
                'param': text
            },
            success: function(data) {
                $("#result-box").html("");
                if (data.length > 0) {
                    var d = JSON.parse(data);
                    d.forEach(function(element) {
                        if (element != null) {
                            $("#result-box").append('<a href="' + base_url + '/'+ element.url + '?highlight=' + text + '">' + element.title + '</a><br>')
                        }
                    })
                }
            },
            error: function() {
                $("#result-box").html("No Results Found");
            },
        })
    }
    function debounce(func, wait, immediate) {
        var timeout;
        return function() {
            var context = this,
                args = arguments;
            var later = function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    };