package com.ggs.imsg.bean;

import org.ggs.orm.annotation.PK;
import org.ggs.orm.annotation.PKType;
import org.ggs.orm.annotation.Table;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-17
 * Time: 下午12:36
 * To change this template use File | Settings | File Templates.
 */
@Table("T_addr")
public class Addr extends Page {
    @PK(PKType.increment)
    private Integer id;
    private String cname;
    private String mobile;
    private String memo;
    private Integer userid;
    private Integer classid;
    private String fspell;

    public String getFspell() {
        return fspell;
    }

    public void setFspell(String fspell) {
        this.fspell = fspell;
    }

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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }



    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }
}
