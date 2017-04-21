<%--
  Created by IntelliJ IDEA.
  User: 花间一壶酒
  Date: 2017/4/9
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册页面</title>
    <!-- jQuery文件，在bootstrap.min.js之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- Bootstrap核心JavaScript文件 -->
    <script src="http://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Bootstrap核心CSS文件 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件(一般不用引入) -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 50px;
        }
    </style>
    <script>
        function setCookie(name, value, time)//设置cookie
        {
            if (time < 0) {
                document.cookie = name + "=" + encodeURI(value) + ";expires=-1";
            } else {
                var Days = time;
                var exp = new Date();
                exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
                document.cookie = name + "=" + encodeURI(value) + ";expires=" + exp.toDateString();
            }
        }
        function judge() {
            var s = $("#numberOrEmail").val();
            var filter = /^([a-zA-Z0-9_.\-])+@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (/^\d+$/.test(s) && s.length === 11) {
                $("#registerBut").removeAttr('disabled');
                $("#registerBut").text("电话注册");
            } else if (filter.test(s)) {
                $("#registerBut").removeAttr('disabled');
                $("#registerBut").text("邮箱注册");
            } else {
                alert("请输入正确的电话号码或者邮箱");
            }
        }
        function onL() {
            $("#registerBut").attr('disabled', "true");
        }
    </script>
    <script>
        $(document).ready(function () {
            $(".btn-block").click(function () {
                var s = $("#numberOrEmail").val();
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: '${pageContext.request.contextPath}/user/userRegister',
                    data: JSON.stringify({"number": s}),
                    dataType: "json",
                    success: function (data) {
                        if (data.msg === "a") {
                            alert("此号码已注册，请前往密码找回");
                        }else {
                            alert("正在向" + data.number + "发送验证码");
                            setCookie('number', data.number, -1);//将号码保存到cookie
                            setCookie('code', data.code, -1);//将返回的验证码保存到cookie
                            window.location.href = '${pageContext.request.contextPath}/jsp/userVerification.jsp';
                        }
                    },
                    error: function () {
                        alert("失败");
                    }
                });
            });

        })
    </script>
</head>
<body onload="onL()">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid"><%--响应式布局设计 --%>
        <div class="navber-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">代课网</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://localhost:8080">代课网</a><%--导航栏大标题--%>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"><%--导航栏左侧--%>
            <ul class="nav navbar-nav">
                <li><a href="#">查找</a></li>
                <li><a href="#">发布</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right"><%--导航栏右侧--%>
                <li><a href="${pageContext.request.contextPath}/jsp/userLogIn.jsp">登录</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form onsubmit="return verify();" role="form" id="form"
                  action="${pageContext.request.contextPath}/user/userRegister" method="post">
                <h2 style="margin-bottom: 25px" class="form-signin-heading">用户注册</h2>
                <label class="sr-only" for="numberOrEmail">Email address</label>
                <input style="margin-bottom: 25px" required class="form-control" id="numberOrEmail" name="number"
                       onchange="judge()" type="text" placeholder="邮箱/电话">

                <button class="btn btn-primary btn-block" type="button" id="registerBut">注册</button>
            </form>
        </div>
        <div class="col-md-6" id="watch">

        </div>
    </div>
</div>
</body>
</html>
