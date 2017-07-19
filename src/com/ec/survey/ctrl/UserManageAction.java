package com.ec.survey.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.survey.dao.DAOFactory;
import com.ec.survey.dao.UserDAO;
import com.ec.survey.dto.User;
import com.swufe.util.StringUtil;

public class UserManageAction extends BaseAction {
	public String addUser(){
		String email = request.getParameter("email");
		String nickname = StringUtil.encodeString(request.getParameter("nickname"));
		String password = request.getParameter("password");
		UserDAO dao = DAOFactory.getUserDAO();
		User user = new User();
		user.setEmail(email);
		user.setNickname(nickname);
		user.setPassword(password);
		try {
			dao.addUser(user);
			request.getSession().setAttribute("user", user);

			//response.sendRedirect("../OpResult.jsp?op=reg&ret=true");
			return "success";
		} catch (Exception e) {
		//	response.sendRedirect("../OpResult.jsp?op=reg&ret=false");
			return "fail";
		}
	}
	
	
	public String userLogin(){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDAO dao = DAOFactory.getUserDAO();
		User user;
		try {
			user = dao.findOneUserByEmail(username);
			if (user==null) {
				user = dao.findOneUserByNickname(username);
			}
			if (user.getPassword().equals(password)) {
				request.getSession().setAttribute("user", user);
				//response.sendRedirect("../OpResult.jsp?op=login&ret=true");
				return "success";
			} else {
				//response.sendRedirect("../OpResult.jsp?op=login&ret=false");
				return "fail";
			}
		} catch (Exception e) {
			//response.sendRedirect("../OpResult.jsp?op=login&ret=false");
			return "fail";
		}
	}
}
