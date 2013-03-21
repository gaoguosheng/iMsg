<%@ page import="com.ggs.imsg.comm.CommConst" %>
<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 13-3-16
  Time: 下午4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title><%=CommConst.SOFT_NAME%></title>
    <%@include file="inc.jsp"%>

</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">


    <table align="center" cellspacing="0" cellpadding="0" width="400">
        <tr>
            <td colspan="2">
                <h2 class="form-signin-heading">iMsg管理平台</h2>
                <div class="ui-widget">
                    <div class="ui-state-highlight ui-corner-all">
                        <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
                            <span id="msgSpan">推荐使用谷歌浏览器 <a href="http://dl.vmall.com/c0fxaaaava">下载</a></span>
                        </p>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width:150px;" valign="top"><img src="images/logo-m.jpg"></td>
            <td valign="top">
                <div>
                    <input type="text" id="username" class="input-block-level" placeholder="用户名" title="用户名">
                    <input type="password" id="pwd" class="input-block-level" placeholder="密码" title="密码">
                    <button class="ui-button-primary" id="loginBtn" style="width: 130px;height:45px; ">登录</button>
                </div>
            </td>
        </tr>
     </table>


<script type="text/javascript">
    $('button').button();
    function f_login(){
        var user = $("#username").val();
        var pwd = $("#pwd").val();
        if($.trim(user)=="" ){
            $("#msgSpan").html("用户名不能为空！");
            $("#username").focus();
            return false;
        }
        if($.trim(pwd)==""){
            $("#msgSpan").html("密码不能为空！");
            $("#pwd").focus();
            return false;
        }
        var json = $GGS.getJSON("LoginAction!login.action",{username:user,pwd:pwd});
        if(json.isok){
            $("#msgSpan").html("登录成功");
            location='index.jsp';
        }else{
            $("#msgSpan").html("用户名或者密码不正确");
            return false;
        }
    }
    $("#loginBtn").click(f_login);
    function f_eventLogin(){
        if (event.keyCode==13)f_login();
    }
    $("#username").keydown(f_eventLogin);
    $("#pwd").keydown(f_eventLogin);

</script>
<%@include file="bottom.jsp"%>