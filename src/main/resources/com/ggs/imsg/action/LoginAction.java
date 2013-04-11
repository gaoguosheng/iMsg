package com.ggs.imsg.action;

import com.ggs.imsg.bean.Msg;
import com.ggs.imsg.bean.User;
import com.ggs.imsg.comm.CommUtil;
import com.ggs.imsg.util.MD5;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.ggs.web.BaseAction;
import org.ggs.web.annotation.Action;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-16
 * Time: 下午4:34
 * To change this template use File | Settings | File Templates.
 */
@Action
public class LoginAction extends BaseAction {
    private Gson gson = new GsonBuilder().create();
    private User model = new User();
    @Override
    public Object getModel() {
        return model;
    }

    public void login(){
        int counter = CommUtil.ormUtil.queryForInt("select count(*) from t_user where username=? and pwd=?",new Object[]{
                this.model.getUsername(),
                MD5.getMD5(this.model.getPwd())
        });
        Msg msg = new Msg();
        if(counter>0){
            msg.setIsok(1);
            Map<String,String> userMap = CommUtil.ormUtil.queryForMap("select * from t_user where username=?",new Object[]{this.model.getUsername()});
            Integer userid = Integer.parseInt( userMap.get("id"));
            User user = new User();
            user.setUsername(this.model.getUsername());
            user.setId(userid);
            session.setAttribute("admin",user);
        }else{
            msg.setIsok(0);
        }
        this.out(gson.toJson(msg));
    }
}
