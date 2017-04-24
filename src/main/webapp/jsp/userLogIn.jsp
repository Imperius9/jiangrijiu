<%--
  Created by IntelliJ IDEA.
  User: 花间一壶酒
  Date: 2017/4/7
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户登录</title>
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
        function verify() {        
            //判断提交表单是否为空
            var form = document.getElementById('form');//获取form标签元素        
            var inputArray = form.getElementsByTagName("input");// 获取form下元素下所有input标签
            var inputArrayLength = inputArray.length;     
            for (var int = 0; int < inputArrayLength; int++) {//循环input元素数组
                //判断每个input元素的值是否为空        
                if (inputArray[int].value === null || inputArray[int].value === '') {
                    alert('第' + (int + 1) + '个input的值为空.');
                    return false;
                }
            }
            return true;//如果所有Input标签的值都不为空的话
        }
    </script>
    <script>
        window.onunload=function () {
            setCookie("msg", 0, -1);
        };
        $(document).ready(function () {

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
            <form onsubmit="return verify();" role="form" id="form" action="${pageContext.request.contextPath}/user/login" method="post">
                <h2 class="form-signin-heading">登录</h2>
                    <label class="sr-only" for="username">Email address</label>
                    <input class="form-control" required id="username" name="userLoginName" type="text" placeholder="邮箱/电话">
                    <label class="sr-only" for="password">Password</label>
                    <input class="form-control" required id="password" name="password" type="password" placeholder="密码">
                <div class="checkbox text-right">
                    <div>
                        <a href="${pageContext.request.contextPath}/jsp/userFound.jsp">找回密码</a>
                    </div>
                    <label>
                        <input type="checkbox" value="remember-me" id="rememberMe">记住我
                    </label>
                </div>
                <button class="btn btn-primary btn-block" type="submit">登录</button>
                <button class="btn btn-default btn-block" type="button"
                        onclick="location.href='${pageContext.request.contextPath}/jsp/userRegister.jsp'">注册
                </button>
            </form>
        </div>
        <div class="col-md-6" id="watch">

        </div>
    </div>
</div>
</body>
</html>
