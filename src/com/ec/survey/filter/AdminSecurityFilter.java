package com.ec.survey.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ec.survey.dto.Admin;

public class AdminSecurityFilter implements Filter {

	public AdminSecurityFilter() {
	}
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		if (admin!=null) {
			chain.doFilter(request, response);
		}else {
			((HttpServletResponse) response).sendRedirect("../errorTo_/errorToAdminLogin.jsp");
		}
	}
	public void init(FilterConfig config) throws ServletException {

	}

}
