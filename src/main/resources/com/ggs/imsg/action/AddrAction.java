package com.ggs.imsg.action;

import com.ggs.imsg.bean.Addr;
import com.ggs.imsg.bean.AddrLog;
import com.ggs.imsg.bean.Page;
import com.ggs.imsg.bean.User;
import com.ggs.imsg.comm.CommUtil;
import com.ggs.imsg.util.DateUtil;
import com.ggs.imsg.util.NullUtil;
import com.ggs.imsg.util.PinYinUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ykesoft.service.MsgClient;
import org.ggs.web.BaseAction;
import org.ggs.web.annotation.Action;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-16
 * Time: 下午9:30
 * To change this template use File | Settings | File Templates.
 */
@Action
public class AddrAction extends BaseAction{
    private Addr model = new Addr();

    @Override
    public Object getModel() {
        return model;
    }


    private Gson gson = new GsonBuilder().create();

    private void init(){
        User user =(User)session.getAttribute("admin");
        if(NullUtil.isNotNull(user))
            this.model.setAdmin(user);
    }

    /**
     * 通讯录列表
     * */
    public void addrList(){
        init();
        StringBuilder sql = new StringBuilder(" select * from v_addr where 1=1 and userid="+this.model.getAdmin().getId());
        if(NullUtil.isNotNull(model.getClassid())){
            sql.append(" and classid="+model.getClassid());
        }
        if(NullUtil.isNotNull(model.getCname())){
            sql.append(" and cname like '%"+model.getCname()+"%'");
        }
        paging(sql,true);
    }

    /***
     *通用分页
     * */
    private void paging(StringBuilder sql,boolean haspage){
        Page page = new Page();
        int records = CommUtil.ormUtil.executeCount(sql.toString());
        page.setRecords(records);
        if(NullUtil.isNotNull(this.model.getSidx())){
            sql.append(" order by "+this.model.getSidx()+" "+this.model.getSord());
        }
        if(haspage){
            sql.append(" limit "+(this.model.getPage()-1)*this.model.getRows()+","+this.model.getRows());
            int total = (records-1)/this.model.getRows()+1;
            page.setTotal(total);
        }
        List data = CommUtil.ormUtil.queryForList(sql.toString());

        page.setRows(this.model.getRows());
        page.setData(data);
        page.setPage(this.model.getPage());
        this.out(gson.toJson(page));
    }

    /**
     * 分类列表
     * */
    public void classList(){
        init();
        StringBuilder sql=new StringBuilder("select * from t_class where userid="+this.model.getAdmin().getId());
        paging(sql,false);

    }

    /**
     * 记录列表
     * */
    public void logList(){
        init();
        StringBuilder sql=new StringBuilder("select * from v_addr_log where userid="+this.model.getAdmin().getId());
        paging(sql,true);
    }

    /**
     * 发送消息
     * */
    public void sendMsg(){
        String ids = request.getParameter("ids");
        String msg = request.getParameter("msg");
        List<Map<String,String>>itemList = CommUtil.ormUtil.queryForList("select * from t_addr where id in ('"+ids+"')");
        for(Map<String,String>item:itemList){
            AddrLog log  = new AddrLog();
            String content=item.get("cname")+"，您好！"+msg;
            int status = MsgClient.sendMsg(item.get("mobile"), content);
            log.setStatus(status);
            log.setContent(content);
            log.setDatetime(DateUtil.getCurrDatetime());
            log.setAddrid(Integer.parseInt(item.get("id")));
            CommUtil.ormUtil.save(log);
        }
    }

    public void save(){
        init();
        model.setUserid(model.getAdmin().getId());
       model.setFspell(PinYinUtil.cn2FirstSpell(model.getCname()));
        if(NullUtil.isNotNull(model.getId())){
            CommUtil.ormUtil.update(model);
        }else{
            CommUtil.ormUtil.save(model);
        }
    }
    public void del(){
        CommUtil.ormUtil.del(model);
    }

    /**
     * 所有通讯录姓名列表
     * **/
    public void allAddrNameList(){
        List itemList = CommUtil.ormUtil.queryForList("select cname from t_addr");
        this.out(gson.toJson(itemList));
    }
}
