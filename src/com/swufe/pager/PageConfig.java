package com.swufe.pager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>类名称	PageConfig </p>
* <p>类描述	页面信息</p>
* @author	裴健
* @date		2017年6月9日 下午3:27:00
 */
public class PageConfig {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;
	String Action;

	public String getAction() {
		return this.Action;
	}

	public void setAction(String action) {
		this.Action = action;
	}

	public HttpServletRequest getRequest() {
		return this.request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return this.response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpSession getSession() {
		return this.session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}
}