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
            <table id="addrGrid"></table>
            <div id="addrGridPager"></div>

        </td>

    </tr>
</table>
<div id="addrDialog" style="display: none;" title="人员管理">
    <select id="classid" title="分组"></select>
    <input type="text" id="cname" class="input-block-level" placeholder="人员姓名" title="人员姓名">
    <input type="text" id="mobile" class="input-block-level" placeholder="手机"  title="手机">
    <input type="text" id="memo" class="input-block-level" placeholder="备注" title="备注">
</div>


<script type="text/javascript">
    var myHeight = screen.availHeight-360;

    $("#addrGrid").jqGrid({
        url: "!addrList.action",
        datatype: "json",
        mtype:"POST",//提交方式
        width:1000,
        height: myHeight,
        rownumbers:true,//添加左侧行号
        hidegrid:false,
        rowNum: 20,
        rowList: [10,20,30],
        pager: "#addrGridPager",
        colModel:[
            {name:'id',index:'id',label:'ID',width:50,hidden:true},
            {name:'classname',index:'classname',label:'分组',editable:true},
            {name:'cname',index:'cname',label:'名称',editable:true},
            {name:'mobile',index:'mobile',label:'手机',editable:true},
            {name:'memo',index:'memo',label:'备注',editable:true},
            {name:'userid',index:'userid',label:'用户',editable:true,hidden:true},
            {name:'classid',index:'classid',label:'分组',editable:true,hidden:true}
        ],
        sortname:'id',
        sortorder:'desc',
        viewrecords: true,
        caption: "人员管理",
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
    $("#t_addrGrid").css("height","30px");
    $("#t_addrGrid").html("<button id=\"addaddrBtn\">添加</button> <button  id=\"modifyaddrBtn\">修改</button>  <button  id=\"deladdrBtn\">删除</button>");


    //初始化按钮
    $('button').button();

    function f_openDialog(id){
       $("#addrDialog").css("display","");
        $('#addrDialog').dialog({
            autoOpen: true,
            modal: true,
            width: 600,
            buttons: {
                "保存": function () {
                    var cname = $("#cname").val();
                    if($.trim(cname)==""){
                        alert("人员不能为空！");
                        return false;
                    }
                    var mobile = $("#mobile").val();
                    if($.trim(mobile)==""){
                        alert("手机不能为空！");
                        return false;
                    }
                    var classid = $("#classid").val();
                    var memo = $("#memo").val();
                    $GGS.ajax("AddrAction!save.action",{
                        cname:cname,id:id,mobile:mobile,classid:classid,memo:memo
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
        $("#addrGrid").jqGrid().trigger('reloadGrid');;
    }

    function f_getClassList(){
        var json = $GGS.getJSON("AddrAction!classList.action");
        for(var i=0;i<json.data.length;i++){
            $("#classid").append("<option value='"+json.data[i].id+"'>"+json.data[i].cname+"</option>");
        }
    }

    $("#addaddrBtn").click(function(){
        $("#cname").val("");
        $("#mobile").val("");
        $("#memo").val("");
        f_openDialog();
    });
    $("#modifyaddrBtn").click(function(){
        var id = jQuery("#addrGrid").jqGrid('getGridParam','selrow');
        if(!id){
            alert("还未选择记录");
            return false;
        }
        var data = $("#addrGrid").jqGrid('getRowData',id);
        $("#classid").val(data.classid);
         $("#cname").val(data.cname);
        $("#mobile").val(data.mobile);
        $("#memo").val(data.memo);
        f_openDialog(id);

    });

    $("#deladdrBtn").click(function(){
        var id = jQuery("#addrGrid").jqGrid('getGridParam','selrow');
        if(!id){
            alert("还未选择记录");
            return false;
        }
        if(confirm("是否确认要删除？")){
            $GGS.ajax("AddrAction!del.action",{id:id});
            f_reload();
        }
    });

    f_getClassList();





</script>
<%@include file="bottom.jsp"%>