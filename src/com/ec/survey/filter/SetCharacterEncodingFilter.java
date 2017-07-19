package com.ec.survey.filter;


import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class SetCharacterEncodingFilter implements javax.servlet.Filter {
   
  protected String encoding = "utf-8";
  protected FilterConfig filterConfig = null;
  protected boolean ignore = false;

  public void destroy() {
    this.encoding = null;
    this.filterConfig = null;
  }

  public void doFilter(ServletRequest request, ServletResponse response,
                       FilterChain chain) throws IOException, ServletException {
	  
	HttpServletRequest req = (HttpServletRequest)request;
	//响应乱码问题
	response.setContentType("text/html;charset=utf-8");
	//判断请求方式
	if (req.getMethod().equals("GET")) {//get请求方式
		//get请求乱码问题
		if (ignore || (request.getCharacterEncoding() == null)) {
		      String encoding = selectEncoding(request);
		      if (encoding != null) {
		        request.setCharacterEncoding(encoding);
		      }
		    }
		    chain.doFilter(request, response);
	}else if (req.getMethod().equals("POST")) {
		//post请求乱码问题
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

  }

  public void init(FilterConfig filterConfig) throws ServletException {

    this.filterConfig = filterConfig;
    this.encoding = filterConfig.getInitParameter("encoding");
    String value = filterConfig.getInitParameter("ignore");
    if (value == null) {
      this.ignore = true;
    } else if (value.equalsIgnoreCase("true")) {
      this.ignore = true;
    } else if (value.equalsIgnoreCase("yes")) {
      this.ignore = true;
    } else {
      this.ignore = false;
    }

  }

  protected String selectEncoding(ServletRequest request) {
    return (this.encoding);
  }

}
