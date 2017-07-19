package com.ec.survey.ctrl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.ec.survey.dao.AdminDAO;
import com.ec.survey.dao.ConfigDAO;
import com.ec.survey.dao.DAOFactory;
import com.ec.survey.dao.LinkDAO;
import com.ec.survey.dao.mssqlimpl.AdminDAOimpl;
import com.ec.survey.dto.Admin;
import com.ec.survey.dto.Config;
import com.ec.survey.dto.Link;
import com.opensymphony.xwork2.ActionSupport;
import com.swufe.util.StringUtil;




public class LinkAction extends BaseAction
{

 private LinkDAO dao=DAOFactory.getLinkDAO();

	public String AddLink() throws Exception{
	
		String url=StringUtil.encodeString(request.getParameter("url"));
		String sitename=StringUtil.encodeString(request.getParameter("sitename"));
		String description=StringUtil.encodeString(request.getParameter("description"));
		 
	
		Link link=new Link();
		link.setLAddtime(new java.sql.Date(new java.util.Date().getTime()));
		link.setLInfo(description);
		link.setLIsLock(false);
		link.setLName(sitename);
		link.setLUrl(url);
		
		boolean ret1=dao.addLink(link);
		if(ret1){
//			response.sendRedirect("../admin/FriendLinkAdmin.jsp");
			return "success";
		}else{
			this.message=URLEncoder.encode("增加友情链接出错！请联系管理员", "UTF-8");
			//response.sendRedirect("../admin/OpResult.jsp?op=default&ret=false&words="+URLEncoder.encode("增加友情链接出错！请联系管理员", "UTF-8"));
			return "fail";
		}
	}
	public String DelLink(){
		Long lid=Long.valueOf(request.getParameter("lid"));
		LinkDAO dao=DAOFactory.getLinkDAO();
		
		boolean ret1=dao.delLink(lid);
		if(ret1){
//			response.sendRedirect("../admin/FriendLinkAdmin.jsp");
			return "success";
		}else{
//			response.sendRedirect("../admin/OpResult.jsp?op=default&ret=false&words="+URLEncoder.encode("删除友情链接出错！请联系管理员", "UTF-8"));
			return "fail";
		}
	}
	public String EditLink() throws Exception{
		Long lid=Long.valueOf(request.getParameter("lid"));
		String url=StringUtil.encodeString(request.getParameter("url"));
		String sitename=StringUtil.encodeString(request.getParameter("sitename"));
		String description=StringUtil.encodeString(request.getParameter("description"));
		LinkDAO dao=DAOFactory.getLinkDAO();
		
		Link link=dao.findLink(lid);
		link.setLId(lid);
		link.setLInfo(description);
		link.setLIsLock(false);
		link.setLName(sitename);
		link.setLUrl(url);
		boolean ret1=dao.updateLink(link);
		if(ret1){
//			response.sendRedirect("../admin/FriendLinkAdmin.jsp");
			return "success";
		}else{
			this.message=URLEncoder.encode("编辑友情链接出错！", "UTF-8");
//			response.sendRedirect("../admin/OpResult.jsp?op=default&ret=false&words=编辑友情链接出错！");
			return "fail";
		}
	}
	 
}
