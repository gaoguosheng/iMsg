package com.ggs.imsg.bean;

import java.util.List;
import org.ggs.orm.annotation.*;

/**
 * Created with IntegerelliJ IDEA.
 * User: ggs
 * Date: 13-3-16
 * Time: 下午9:44
 * To change this template use File | Settings | File Templates.
 */
public class Page {
    @NotColumn
    private Integer page=1;
    @NotColumn
    private Integer total=0;
    @NotColumn
    private Integer records=0;
    @NotColumn
    private Integer rows=0;
    @NotColumn
    private List data;
    @NotColumn
    private String sidx;
    @NotColumn
    private String sord;
    @NotColumn
    private User admin;

    public User getAdmin() {
        return admin;
    }

    public void setAdmin(User admin) {
        this.admin = admin;
    }

    public Integer getPage() {
        if(this.page==null || this.page<1){
            this.page=1;
        }
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getRecords() {
        return records;
    }

    public void setRecords(Integer records) {
        this.records = records;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }
}
