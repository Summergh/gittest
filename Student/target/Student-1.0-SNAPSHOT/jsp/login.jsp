
<%@ page pageEncoding="utf-8" isELIgnored="false" isErrorPage="false" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
   
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/static/css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="/static/css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">

    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min.css-v=4.0.0.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">spk</h1>

            </div>
            <h3>欢迎使用 达腾超市管理系统</h3>

            <form class="m-t" role="form" action="/admin/tologin" method="post"  target="_self">
                <div class="form-group">
                    <input type="username" class="form-control" name="adminname" placeholder="用户名" >
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="adminpwd" placeholder="密码">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


                <p class="text-muted text-center"> <a href="login.jsp#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p>

            </form>
        </div>
    </div>
    <script src="/static/js/jquery.min.js-v=2.1.4"></script>
    <script src="/static/js/bootstrap.min.js-v=3.3.5"></script>

</body>

</html>