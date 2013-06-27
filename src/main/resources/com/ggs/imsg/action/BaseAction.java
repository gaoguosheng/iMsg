package com.ggs.imsg.action;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: GGS
 * Date: 13-6-27
 * Time: 上午8:48
 * To change this template use File | Settings | File Templates.
 */
public class BaseAction implements ServletRequestAware,ServletResponseAware {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected HttpSession session;


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request=httpServletRequest;
        session=request.getSession();
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response=httpServletResponse;
        response.setCharacterEncoding("UTF-8");
    }

    protected void out(String html){
        try {
            response.getWriter().print(html);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
