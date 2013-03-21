<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="top.jsp"%>
<table align="center" cellspacing="0" cellpadding="0" width="1000">
    <tr>
        <td valign="top">
            <table id="logGrid"></table>
            <div id="logGridPager"></div>
        </td>
    </tr>
</table>


    <script type="text/javascript">
        var myHeight = screen.availHeight-350;
        function f_loadLogGrid(){
            $("#logGrid").jqGrid({
                url:'AddrAction!logList.action',
                datatype: "json",
                width:1000,
                height: myHeight,
                mtype:"POST",//提交方式
                rownumbers:true,//添加左侧行号
                hidegrid:false,
                rowNum: 20,
                rowList: [10,20,30],

                sortname:'datetime',
                sortorder:'desc',
                colModel:[
                    {name:'status',index:'status',label:'状态',width:60,align:'center',formatter:function(cellvalue, options, rowObject){
                        if(cellvalue==1){
                            return "<img src='images/ok.png' title='发送成功'>";
                        }else{
                            return "<img src='images/no.png' title='发送失败'>";
                        }
                    }},
                    {name:'datetime',index:'datetime',label:'时间',width:80,align:'center'},
                    {name:'addrname',index:'addrname',label:'接收者',width:80},
                    {name:'content',index:'content',label:'消息内容'}
                ],
                /*
                grouping:true,
                groupingView: {
                    groupField: ['date'],
                    groupColumnShow: [false],
                    groupText: ['<b>{0}</b>'],
                    groupCollapse: false,
                    groupOrder: ['desc'],
                    groupSummary: [false],
                    groupDataSorted: true
                },
                */
                multiselect: false,
                pager: "#logGridPager",
                viewrecords: true,
                caption: "消息记录",
                altRows: true ,
                jsonReader : {
                    root : "data",
                    repeatitems : false
                }

            });
        }

        f_loadLogGrid();
        //初始化按钮
        $('button').button();

    </script>
<%@include file="bottom.jsp"%>
