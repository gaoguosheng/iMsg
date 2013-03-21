<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.ggs.imsg.comm.CommConst" %>
<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%=CommConst.SOFT_NAME%></title>


    <!-- Le styles -->
    <link href="res/assets/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="res/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
    <link type="text/css" href="res/assets/css/font-awesome.min.css" rel="stylesheet" />

    <link href="res/assets/css/docs.css" rel="stylesheet">
    <link href="res/assets/js/google-code-prettify/prettify.css" rel="stylesheet">

    <!--begin wijmo menu-->
    <link href="res/third-party/wijmo/jquery.wijmo-open.1.5.0.css" rel="stylesheet" type="text/css" />
    <!--End wijmo menu-->

    <!-- jqGrid-->
    <link rel="stylesheet" href="res/third-party/jqGrid/jqGrid/css/ui.jqgrid.css" />
    <link rel="stylesheet" href="res/third-party/jqGrid/jqGrid.overrides.css">

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="res/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="res/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="res/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="res/assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="images/logo.jpg">

    <script src="res/assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="res/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="res/assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
    <script src="res/assets/js/google-code-prettify/prettify.js" type="text/javascript"></script>
    <script src="res/assets/js/docs.js" type="text/javascript"></script>
    <!--wijmo-->
    <script src="res/third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
    <script src="res/third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>
    <!--End wijmo-->
    <!--jqGrid-->
    <script src="res/third-party/jqGrid/jqGrid/js/i18n/grid.locale-cn.js"></script>
    <script src="res/third-party/jqGrid/jqGrid/js/jquery.jqGrid.min.js"></script>

    <script src="res/ggs.js"></script>


</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">
<!-- Navbar
================================================== -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#"><font color='white'><%=CommConst.SOFT_NAME%></font></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="#"><b>${sessionScope.admin.username}</b></a></li>
                    <li class="${param.at==null || param.at==1 ?'active':''}">
                        <a href="index.jsp?at=1">发送消息</a>
                    </li>
                    <li class="${param.at==2?'active':''}">
                        <a href="log.jsp?at=2">消息记录</a>
                    </li>
                    <li class="dropdown ${param.at>2?'active':''}" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">系统管理<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="${param.at==3?'active':''}"><a href="class.jsp?at=3">分组管理</a></li>
                            <li class="${param.at==4?'active':''}"><a href="addr.jsp?at=4">人员管理</a></li>
                            <li class="divider"></li>
                            <li class="disabled"><a href="#">用户管理</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="logout.jsp" onclick="return confirm('是否确认退出<%=CommConst.SOFT_NAME%>？');">退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<br/>
