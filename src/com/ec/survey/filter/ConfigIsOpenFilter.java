package com.ec.survey.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.ec.survey.dao.ConfigDAO;
import com.ec.survey.dao.DAOFactory;
import com.ec.survey.dto.Config;

public class ConfigIsOpenFilter implements Filter {

    public ConfigIsOpenFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		ConfigDAO cdao=DAOFactory.getConfigDAO();
		Config cfg=cdao.findConfig();
		if(cfg.getCIsOpen()){
			chain.doFilter(request, response);
		}else {
			response.getWriter().print("<h1>"+cfg.getCCloseWord()+"</h1>");
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
