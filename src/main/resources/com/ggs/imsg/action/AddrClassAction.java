package com.ggs.imsg.action;

import com.ggs.imsg.bean.AddrClass;
import com.ggs.imsg.bean.User;
import com.ggs.imsg.comm.CommUtil;
import com.ggs.imsg.util.NullUtil;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-19
 * Time: 下午8:31
 * To change this template use File | Settings | File Templates.
 */

public class AddrClassAction extends BaseAction implements ModelDriven<AddrClass> {
    private AddrClass model = new AddrClass();

    @Override
    public AddrClass getModel() {
        return model;
    }

    private void init(){
        User user =(User)session.getAttribute("admin");
        if(NullUtil.isNotNull(user))
            this.model.setAdmin(user);
    }

    public void save(){
        init();
        model.setUserid(model.getAdmin().getId());
        if(NullUtil.isNotNull(model.getId())){
            CommUtil.ormUtil.update(model);
        }else{
            CommUtil.ormUtil.save(model);
        }
    }
    public void del(){
        CommUtil.ormUtil.del(model);
    }
}
