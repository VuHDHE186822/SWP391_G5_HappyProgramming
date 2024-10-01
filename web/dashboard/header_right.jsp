<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="images/logo1.png"/>

        <style>
            .option_avt {
                font-size: 16px;
                padding: 7px 15px;
                width: 130px;
            }

            .option_avt:hover{
                color: orange;
                background-color: rgba(0,0,0,0.1);
            }
            a:hover{
                color: orange;
            }
            .header_avt {
                animation: headerNotifyGrowth ease-in 0.2s;
                cursor: default;
                transform-origin: calc(100% - 20px) top;
                display: none;
                will-change: opacity, transform;
            }

            .header_avt::before {
                color: white;
                content: "";
                border-width: 20px 27px;
                border-style: solid;
                border-color: transparent transparent white transparent;
                position: absolute;
                top: -32px;
                right: 4px;
            }

            @keyframes headerNotifyGrowth {
                from {
                    opacity: 0;
                    transform: scale(0);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }
        </style>
    </head>
    <body>
        <div id="head_vip" class="header_container sticky-header" style="width: 100%;
             background-color: #edf2fa;
             padding: 21px;
             margin-bottom: 40px;
             z-index: 1">
        </div>
        <div class="modal fade" id="modal_box" role="dialog"></div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/clickevents.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script type="text/javascript">
            function change() {
                var a = document.getElementById("avt");
                if (a.style.display === 'none' || a.style.display === '') {
                    a.style.display = 'block';
                } else {
                    a.style.display = 'none';
                }
            }
            function checkLogout() {
                let ok = confirm('Are you sure you want to logout?');
                console.log(ok)
                if (ok) {
                    document.getElementById('logout').href = 'logout';
                }
            }

        </script>
    </body>
</html>
