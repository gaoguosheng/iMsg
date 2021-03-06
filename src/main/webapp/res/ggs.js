var $GGS={
    //Ajax更新
    ajax:function(url,data){
        var result;
        $.ajax({
            type: "POST",
            url:url,
            data:data,
            async:false,
            success: function(msg){
                result=msg;
            }
        });
        return result;
    } ,
    ajaxAsync:function(url,data,fun){
        var result;
        $.ajax({
            type: "POST",
            url:url,
            data:data,
            async:true,
            success: function(msg){
                result=msg;
                fun();
            }
        });
        return result;
    } ,

    //获取JSON(同步)
    getJSON:function(url,data){
        var node;
        $.ajax({
            type: "POST",
            url:url,
            data:data,
            async:false,
            dataType:"json",
            success: function(json){
                node=json;
            }
        });
        return node;
    }

}