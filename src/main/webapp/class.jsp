<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 13-3-16
  Time: 下午4:44
  To change this template use File | Settings | File Templates.
--%>

<%@include file="top.jsp"%>


<table align="center" cellspacing="0" cellpadding="0" width="1000">
    <tr>
        <td valign="top">
            <table id="classGrid"></table>


        </td>

    </tr>
</table>
<div id="classDialog" style="display: none;" title="分组管理">
    <input type="text" id="cname" class="input-block-level" placeholder="分组名称" title="分组名称">
</div>


<script type="text/javascript">
    var myHeight = screen.availHeight-330;



    $("#classGrid").jqGrid({
        url: "!classList.action",
        datatype: "json",
        mtype:"POST",//提交方式
        width:1000,
        rowNum:99,
        height: myHeight,
        rownumbers:true,//添加左侧行号
        hidegrid:false,
        colModel:[
            {name:'id',index:'id',label:'ID',width:50,hidden:true},
            {name:'cname',index:'cname',label:'名称',editable:true},
            {name:'userid',index:'userid',label:'用户',editable:true,hidden:true},
            {name:'upid',index:'upid',label:'父结点',editable:true,hidden:true}
        ],
        viewrecords: false,
        caption: "分组管理",
        pager:'#classpager',
        altRows: true ,
        jsonReader : {
            root : "data",
            repeatitems : false

        },
        toolbar:[true,'top'],
        onSelectRow: function(id) {
            if(id != null) {

            }
        }
    });
    $("#t_classGrid").css("height","30px");
     $("#t_classGrid").html("<button id=\"addClassBtn\">添加</button> <button  id=\"modifyClassBtn\">修改</button>  <button  id=\"delClassBtn\">删除</button>");


    //初始化按钮
    $('button').button();

    function f_openDialog(id){
       $("#classDialog").css("display","");
        $('#classDialog').dialog({
            autoOpen: true,
            modal: true,
            width: 600,
            buttons: {
                "保存": function () {
                    var cname = $("#cname").val();
                    if($.trim(cname)==""){
                        alert("分组名称不能为空！");
                        return false;
                   }
                    $GGS.ajax("AddrClassAction!save.action",{
                        cname:cname,id:id
                    });
                    $(this).dialog("close");
                    f_reload();
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    function f_reload(){
        $("#classGrid").jqGrid().trigger('reloadGrid');;
    }

    $("#addClassBtn").click(function(){
        $("#cname").val("");
        f_openDialog();
    });
    $("#modifyClassBtn").click(function(){
        var id = jQuery("#classGrid").jqGrid('getGridParam','selrow');
        if(!id){
            alert("还未选择记录");
            return false;
        }
        var data = $("#classGrid").jqGrid('getRowData',id);
         $("#cname").val(data.cname);
        f_openDialog(id);

    });

    $("#delClassBtn").click(function(){
        var id = jQuery("#classGrid").jqGrid('getGridParam','selrow');
        if(!id){
            alert("还未选择记录");
            return false;
        }
        if(confirm("是否确认要删除？")){
            $GGS.ajax("AddrClassAction!del.action",{id:id});
            f_reload();
        }
    });



</script>
<%@include file="bottom.jsp"%>