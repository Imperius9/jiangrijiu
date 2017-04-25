<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .myTableCSS {
            height: 300px;
            overflow-y: auto;
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
            if (${!empty userAgentAndRelease.user}) {
                $(".nav.navbar-nav.navbar-right").html("<li class='dropdown'>" +
                    "<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>${userAgentAndRelease.user.username} <span class='caret'></span></a>" +
                    "<ul class='dropdown-menu'>" +
                    "<li><a href=''>个人信息</a></li>" +
                    "<li><a href=''>我的发布</a></li>" +
                    "<li><a href=''>我的代理</a></li>" +
                    "<li role='separator' class='divider'></li>" +
                    "<li><a href=''>注销</a></li>" +
                    "</ul>" +
                    "</li>");
            } else {
                $(".nav.navbar-nav.navbar-right").html("<li><a href='${pageContext.request.contextPath}/jsp/userLogIn.jsp'>登录</a></li>");
            }
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
            <ul class="nav navbar-nav navbar-right">
                <%--导航栏右侧 通过类选择器动态展示用户状态--%>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-6 myTableCSS">
            <h3><a href="#">我的代理</a></h3>
            <table class="table">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>地点</th>
                    <th>联系方式</th>
                    <th>状态</th>
                </tr>
                </thead>
                <c:if test="${!empty userAgentAndRelease}">
                    <c:forEach items="${userAgentAndRelease.agent}" var="Info">
                        <tr>
                            <td>第${Info.week}周&nbsp;周${Info.weekday}&nbsp;${Info.unit}单元</td>
                            <td>${Info.build}号楼${Info.roomOf}</td>
                            <td>${Info.contact}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${Info.conditionA=='1'}">
                                        已接受
                                    </c:when>
                                    <c:when test="${Info.conditionA=='2'}">
                                        被拒绝
                                    </c:when>
                                    <c:otherwise>
                                        等待回复
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
        <div class="col-md-6 myTableCSS">
            <h3><a href="#">我的发布</a></h3>
            <table class="table">
                <thead>
                <tr>
                    <th>时间</th>
                    <th>地点</th>
                    <th>联系方式</th>
                    <th>状态</th>
                </tr>
                </thead>
                <c:if test="${!empty userAgentAndRelease}">
                    <c:forEach items="${userAgentAndRelease.release}" var="Info">
                        <tr>
                            <td>第${Info.week}周&nbsp;周${Info.weekday}&nbsp;${Info.unit}单元</td>
                            <td>${Info.build}号楼${Info.roomOf}</td>
                            <td>${Info.contact}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${Info.conditionB=='1'}">
                                        有请求
                                    </c:when>
                                    <c:otherwise>
                                        寻找中
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
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