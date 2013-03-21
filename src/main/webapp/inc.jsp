<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.ggs.imsg.comm.CommConst" %>
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

<div id="msgDialog" style="display: none;" title="消息提示">
</div>
<script type="text/javascript">
    //消息框
    function f_alert(msg){
        $("#msgDialog").html(msg);
        $("#msgDialog").css("display","");
        $('#msgDialog').dialog({
            autoOpen: true,
            modal: true,
            width: 320,
            height:200,
            buttons: {
                "确定": function () {
                    $(this).dialog("close");
                    $("#msgDialog").css("display","none");
                }
            }
        });
    }
    //确认框
    function f_confirm(msg,fun){
        $("#msgDialog").html(msg);
        $("#msgDialog").css("display","");
        $('#msgDialog').dialog({
            autoOpen: true,
            modal: true,
            width: 320,
            height:200,
            buttons: {
                "确定": function () {
                    $(this).dialog("close");
                    $("#msgDialog").css("display","none");
                    fun();
                },
                "取消": function () {
                    $(this).dialog("close");
                    $("#msgDialog").css("display","none");
                }
            }
        });
    }

    /**
     * 退出
     * */
    function f_exit(){
        f_confirm("是否确认退出<%=CommConst.SOFT_NAME%>？",function(){
            location='logout.jsp';
        });
    }
</script>