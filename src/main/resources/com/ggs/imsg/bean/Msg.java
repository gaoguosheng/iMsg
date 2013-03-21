package com.ggs.imsg.bean;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 13-3-16
 * Time: 下午4:39
 * To change this template use File | Settings | File Templates.
 */
public class Msg {
    private int isok;
    private String content;

    public Msg() {
    }

    public Msg(int isok) {
        this.isok = isok;
    }

    public Msg(int isok, String content) {
        this.isok = isok;
        this.content = content;
    }

    public int getIsok() {
        return isok;
    }

    public void setIsok(int isok) {
        this.isok = isok;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
