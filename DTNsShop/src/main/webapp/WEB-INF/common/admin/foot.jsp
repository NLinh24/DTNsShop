<!-- JavaScript files-->
    <script src="<c:url value='/templates/admin/js/bootstrap-datetimepicker.vi.js'/>" charset="UTF-8"></script>
    <script src="<c:url value='/templates/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/templates/admin/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<c:url value='/templates/admin/vendor/just-validate/js/just-validate.min.js'/>"></script>
    <script src="<c:url value='/templates/admin/vendor/choices.js/public/assets/scripts/choices.min.js'/>"></script>
    <script src="<c:url value='/templates/admin/js/charts-home.js'/>"></script>
    <!-- Main File-->
    <script src="<c:url value='/templates/admin/js/front.js'/>"></script>
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function (e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // this is set to BootstrapTemple website as you cannot 
        // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
        // while using file:// protocol
        // pls don't forget to change to your domain :)
        injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');


    </script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	 <script>
        $(window).on("load", function () {
            $('body').addClass('loaded');
        });
    </script>
	 <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="<c:url value='/templates/admin/js/datatables-simple-demo.js'/>"></script>
        