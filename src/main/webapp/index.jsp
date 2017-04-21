<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>代课网</title>
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

        .myFrame {
            border: 2px solid beige;
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
        $(document).ready(function () {

        })
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
            <h3>我的代理</h3>
            <hr>
            <table class="table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>产品</th>
                    <th>交付时间</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>TB - Monthly</td>
                    <td>01/04/2012</td>
                    <td>Default</td>
                </tr>
                <tr class="success">
                    <td>1</td>
                    <td>TB - Monthly</td>
                    <td>01/04/2012</td>
                    <td>Approved</td>
                </tr>
                <tr class="error">
                    <td>2</td>
                    <td>TB - Monthly</td>
                    <td>02/04/2012</td>
                    <td>Declined</td>
                </tr>
                <tr class="warning">
                    <td>3</td>
                    <td>TB - Monthly</td>
                    <td>03/04/2012</td>
                    <td>Pending</td>
                </tr>
                <tr class="info">
                    <td>4</td>
                    <td>TB - Monthly</td>
                    <td>04/04/2012</td>
                    <td>Call in to confirm</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <h3>我的发布</h3>
            <hr>
            <table class="table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>产品</th>
                    <th>交付时间</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>TB - Monthly</td>
                    <td>01/04/2012</td>
                    <td>Default</td>
                </tr>
                <tr class="success">
                    <td>1</td>
                    <td>TB - Monthly</td>
                    <td>01/04/2012</td>
                    <td>Approved</td>
                </tr>
                <tr class="error">
                    <td>2</td>
                    <td>TB - Monthly</td>
                    <td>02/04/2012</td>
                    <td>Declined</td>
                </tr>
                <tr class="warning">
                    <td>3</td>
                    <td>TB - Monthly</td>
                    <td>03/04/2012</td>
                    <td>Pending</td>
                </tr>
                <tr class="info">
                    <td>4</td>
                    <td>TB - Monthly</td>
                    <td>04/04/2012</td>
                    <td>Call in to confirm</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <hr>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-4 myFrame">
            <h2>介绍</h2>
            <p>方便学生
                <del>与保安</del>
                代课的网站
            </p>
            <br>
            <a href="#" class="btn">查看全文>></a>
        </div>
        <div class="col-md-4 myFrame">
            <h2>使用说明</h2>
            <p>登录后可进行进行查找与发布</p><br>
            <a href="#" class="btn">查看全文>></a>
        </div>
        <div class="col-md-4 myFrame">
            <h2>Q&A</h2>
            <p>问：如何查看我的发布？<br>问：如何得知发布者是否接受我的代课</p>
            <a href="#" class="btn">查看全文>></a>
        </div>
    </div>
</div>
</body>
</html>