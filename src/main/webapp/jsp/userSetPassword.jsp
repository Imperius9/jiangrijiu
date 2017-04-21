<%--
  Created by IntelliJ IDEA.
  User: 花间一壶酒
  Date: 2017/4/10
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>设置密码</title>
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
        function getCookie(name) {//获取cookie
            var arr = document.cookie.split('; ');
            for (var i = 0; i < arr.length; i++) {
                var arr2 = arr[i].split('=');
                if (arr2[0] === name) {
                    return arr2[1]
                }
            }
            return ''
        }
    </script>
    <script>
        window.onload = function () {
            var msg = getCookie('msg');
            if (msg !== '0') {
                $("#settingPassword").text("完成密码找回");
            }
        };
        $(document).ready(function () {
            $('#settingPassword').click(function () {
                var p1 = document.getElementById("password1").value;
                var p2 = document.getElementById("password2").value;
                if (p1 === p2) {
                    var number = getCookie('number');
                    var data = $('#password1').val();
                    var msg = getCookie('msg');
                    var result = {"password": data,"msg":msg};
                    $.ajax({
                        type: "POST",
                        url: '${pageContext.request.contextPath}/user/SettingPassword?number=' + number,
                        data: result,
                        dataType: "json",
                        success: function (data) {
                            setCookie('password', data, -1);//将号码保存到cookie
                            alert(data);
                            window.location.href= 'http://localhost:8080';
                        },
                        error: function () {
                            alert("失败");
                        }
                    });
                } else {
                    alert("请确认俩次密码输入一致");
                }
            })
        });
    </script>
</head>
<body>
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
            <form role="form" id="form">
                <h2 class="form-signin-heading" style="margin-bottom: 25px">号码验证</h2>
                <input class="form-control" style="margin-bottom: 25px" required id="password1" type="password"
                       placeholder="请输入密码">
                <input class="form-control" style="margin-bottom: 25px" required id="password2" type="password"
                       placeholder="确认密码">
                <button class="btn btn-primary btn-block" id="settingPassword" type="button">完成注册</button>
            </form>
        </div>
        <div class="col-md-6" id="watch">

        </div>
    </div>
</div>
</body>
</html>
