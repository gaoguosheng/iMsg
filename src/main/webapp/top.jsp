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
    <%@include file="inc.jsp"%>

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
                        <a href="#" onclick="f_exit();">退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div style="height: 5px;"></div>


