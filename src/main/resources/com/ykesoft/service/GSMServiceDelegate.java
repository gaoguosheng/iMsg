package com.ykesoft.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * 
 */
@WebService(name = "GSMServiceDelegate", targetNamespace = "http://service.ykesoft.com/")
public interface GSMServiceDelegate {

	/**
	 * 
	 * @param arg1
	 * @param arg0
	 * @return returns int
	 */
	@WebMethod
	@WebResult(targetNamespace = "")
	@RequestWrapper(localName = "sendMsg", targetNamespace = "http://service.ykesoft.com/", className = "com.ykesoft.service.SendMsg")
	@ResponseWrapper(localName = "sendMsgResponse", targetNamespace = "http://service.ykesoft.com/", className = "com.ykesoft.service.SendMsgResponse")
	public int sendMsg(
            @WebParam(name = "arg0", targetNamespace = "") String arg0,
            @WebParam(name = "arg1", targetNamespace = "") String arg1);

}
