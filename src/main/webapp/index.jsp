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
        <td width="320"><input id='tags' class="input-block-level" placeholder="姓名" title="姓名" style="width:300px;height: 30px;"></td>
        <td valign="top"><button class="ui-button-primary" id='searchBtn' style="width:80px;height: 30px;">搜索</button></td>
    </tr>
</table>
    <table align="center" cellspacing="0" cellpadding="0" width="1000">
        <tr>
            <td valign="top">
                <table id="classGrid"></table>
            </td>
            <td valign="top">
                <table id="addrGrid"></table>
                <div id="addrGridPager"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea  id="msgText" rows="3" maxlength="60" class="input-block-level" title="消息内容(最多60字符)" placeholder="消息内容(最多60字符)" style="width: 1004px"></textarea>
                <div align="right">
                    <button class="ui-button-default" id="clearBtn">清空内容</button>
                    <button class="ui-button-primary" id="sendBtn">发送消息</button>
                </div>
            </td>
        </tr>
    </table>


    <script type="text/javascript">
        var myHeight = screen.availHeight-420;



        $("#classGrid").jqGrid({
            url: "AddrAction!classList.action",
            datatype: "json",
            mtype:"POST",//提交方式
            width:200,
            height: myHeight+46,
            rownumbers:true,//添加左侧行号
            hidegrid:false,
            colModel:[
                {name:'id',index:'id',label:'ID',width:50,editable: true,hidden:true,editrules:{edithidden:true}},
                {name:'cname',index:'cname',label:'名称'}
            ],
            viewrecords: false,


            altRows: true ,
            jsonReader : {
                root : "data",
                repeatitems : false

            },
            onSelectRow: function(id) {
                if(id != null) {
                    jQuery("#addrGrid").jqGrid('setGridParam',{url:"AddrAction!addrList.action?q=1&classid="+id,page:1}).trigger('reloadGrid');

                }
            }
        });


        $("#t_classGrid").css("height","30px");
        $("#t_classGrid").html("<button id=\"addClassBtn\">添加</button> <button id=\"delClassBtn\">删除</button>");

        $("#addrGrid").jqGrid({
            url:'AddrAction!addrList.action',
            datatype: "json",
            width:800,
            height: myHeight,
            mtype:"POST",//提交方式
            rownumbers:true,//添加左侧行号
            hidegrid:false,
            rowNum: 20,
            rowList: [10,20,30],
            colModel:[
                {name:'id',index:'id',label:'ID',width:50,editable: true,hidden:true,editrules:{edithidden:true}},
                {name:'fword',index:'fword',label:'首字母',width:50,align:'center'},
                {name:'cname',index:'cname',label:'姓名'},
                {name:'mobile',index:'mobile',label:'手机'},
                {name:'memo',index:'memo',label:'备注'}
            ],

            sortname:'fword',
            sortorder:'asc',
            multiselect: true,
            pager: "#addrGridPager",
            viewrecords: true,


            altRows: true ,
            jsonReader : {
                root : "data",
                repeatitems : false
            }

        });


        jQuery("#sendBtn").click( function() {
            var ids = jQuery("#addrGrid").jqGrid('getGridParam','selarrrow');
            if(ids==""){
                f_alert("还未选择人员");
                return false;
            }
            if($.trim($("#msgText").val())==""){
                f_alert("消息内容不能为空！");
                return false;
            }


            var s="";
            for(var i=0;i<ids.length;i++){
                s+=ids[i];
                if(i<ids.length-1){
                    s+=",";
                }
            }
            var msg= $("#msgText").val();
            $GGS.ajax("AddrAction!sendMsg.action",{ids:s,msg:msg});
            f_alert("发送完成！");
        });

        $("#clearBtn").click(function(){
            $("#msgText").val("");
        });


        //初始化按钮
        $('button').button();

        // Autocomplete
        var availableTags=new Array();
        var json = $GGS.getJSON("AddrAction!allAddrNameList.action",{});
        for(var i=0;i<json.length;i++){
            availableTags[i]=json[i].cname;
        }
        $("#tags").autocomplete({
            source: availableTags
        });

        function f_search(){
            var id = jQuery("#classGrid").jqGrid('getGridParam','selrow');
            $("#addrGrid").jqGrid('setGridParam',{
                url:"AddrAction!addrList.action",
                postData:{'classid':id,'cname':$("#tags").val()}, //发送数据
                page:1
            }).trigger("reloadGrid"); //重新载入
        }

        $("#searchBtn").click(f_search) ;
        $("#tags").keydown(function(){
            if(event.keyCode==13){
                f_search();
            }
        });

    </script>
<%@include file="bottom.jsp"%>