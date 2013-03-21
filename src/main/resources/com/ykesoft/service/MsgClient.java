package com.ykesoft.service;

import com.ggs.imsg.comm.CommConst;

public class MsgClient {

	public static int sendMsg(String phone,String msg){		
        GSMServiceDelegate delegate = new GSMService().getGSMServicePort();		
		int result=0;
		msg+=CommConst.SOFT_NAME;
        try{
            result =delegate.sendMsg(phone, msg);
        }catch (Exception e){
            e.printStackTrace();
        }
		return result;
	}

}
