package com.ggs.imsg.bean;
import org.ggs.orm.annotation.Table;
import org.ggs.orm.annotation.PK;
import org.ggs.orm.annotation.PKType;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-16
 * Time: 下午4:35
 * To change this template use File | Settings | File Templates.
 */
@Table("t_user")
public class User {
    @PK(PKType.increment)
    private Integer id;
    private String username;
    private String pwd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
