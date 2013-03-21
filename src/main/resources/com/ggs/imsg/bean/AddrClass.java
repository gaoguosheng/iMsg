package com.ggs.imsg.bean;

import org.ggs.orm.annotation.*;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-19
 * Time: 下午8:28
 * To change this template use File | Settings | File Templates.
 */
@Table("t_class")
public class AddrClass extends Page{
    @PK(PKType.increment)
    private Integer id;
    private String cname;
    private Integer upid=0;
    private Integer userid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getUpid() {
        return upid;
    }

    public void setUpid(Integer upid) {
        this.upid = upid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}
