package com.ggs.imsg.bean;

import org.ggs.orm.annotation.PK;
import org.ggs.orm.annotation.PKType;
import org.ggs.orm.annotation.Table;


/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-11-24
 * Time: 上午11:41
 * To change this template use File | Settings | File Templates.
 */

@Table("t_addr_log")
public class AddrLog {

    @PK(PKType.increment)
    private Integer id;
    private String datetime;
    private Integer addrid;
    private String content;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Integer getAddrid() {
        return addrid;
    }

    public void setAddrid(Integer addrid) {
        this.addrid = addrid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
