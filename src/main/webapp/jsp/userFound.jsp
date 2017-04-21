<%--
  Created by IntelliJ IDEA.
  User: 花间一壶酒
  Date: 2017/4/10
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>密码找回</title>
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
        function onL() {
            $("#wayFound").hide();
        }
        function wayOfFind(var1) {
            $("#wayFound").show();
            if (var1 === '1') {
                setCookie('msg', 1,-1);
                $("#msg").text("通过邮箱找回");
                $("#infoFound").attr('placeholder', "请输入邮箱");
            } else if (var1 === "2") {
                setCookie('msg', 2, -1);
                $("#msg").text("通过电话找回");
                $("#infoFound").attr('placeholder', "请输入号码");
            }
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#foundPassword").click(function () {
                var msg = getCookie('msg');
                if (msg === '1') {
                    setCookie('msg',msg,-1);
                    alert("正在前往邮箱找回页面");
                } else if (msg === '2') {
                    setCookie('msg',msg,-1);
                    var s = $("#infoFound").val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: '${pageContext.request.contextPath}/user/userRegister',
                        data: JSON.stringify({"number": s}),
                        dataType: "json",
                        success: function (data) {
                            if (data.msg === "a") {
                                setCookie('number', data.number, -1);//将号码保存到cookie
                                setCookie('code', data.code, -1);//将返回的验证码保存到cookie
                                alert("正在向" + data.number + "发送验证码");
                                window.location.href = '${pageContext.request.contextPath}/jsp/userVerification.jsp';
                            }else {
                                alert("未查询到此号码，请前往注册");
                            }
                        },
                        error: function () {
                            alert("失败");
                        }
                    });
                } else {
                    alert("对话已过期，正在前往登录页面");
                    window.location.href='${pageContext.request.contextPath}/jsp/userLogIn';
                }
            });
        });
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
            <form role="form" id="form">
                <h2 class="form-signin-heading" style="margin-bottom: 25px">密码找回</h2>
                <p>选择一种找回方式</p>
                <div class="btn-group" role="group" style="margin-bottom: 25px">
                    <button type="button" class="btn btn-primary" onclick="wayOfFind('1')">邮箱</button>
                    <button type="button" class="btn btn-primary" onclick="wayOfFind('2')">电话</button>
                </div>
                <div id="wayFound">
                    <p id="msg"></p>
                    <input class="form-control" style="margin-bottom: 25px" required id="infoFound" type="text"
                           placeholder="">
                    <button class="btn btn-primary btn-block" id="foundPassword" type="button">找回密码</button>
                </div>
            </form>
        </div>
        <div class="col-md-6" id="watch">

        </div>
    </div>
</div>
</body>
</html>
