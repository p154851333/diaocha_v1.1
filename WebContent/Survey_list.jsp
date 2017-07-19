<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ec.survey.dao.*" %>
<%@ page import="com.ec.survey.dto.*" %>
<%@ page import="com.swufe.pager.*" %>
<jsp:useBean id="pageConfig" class="com.swufe.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>
<%
	ConfigDAO cdao=DAOFactory.getConfigDAO();
	Config cfg=cdao.findConfig();
	SurveyDAO dao=DAOFactory.getSurveyDAO();
	pageConfig.setAction("front_end");
	PageControl pc=new PageControl(dao,pageConfig,"Survey_list.jsp");
	pc.setSizePage(20);
	List<Survey> slist=pc.getRecord();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content=""/>
<meta http-equiv="description" content=""/>
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
<link rel="stylesheet" href="Css/Admin.css" type="text/css" />
<style type="text/css">
	/*设置td超出文字，自动换行  */
	td {
		word-wrap:break-word;
		word-break:break-all;
	}
</style>
<script language="JavaScript" src="Js/Func.js"></script>
<script language="javascript">window.onload=tableFix;
</script>
<title><%=cfg.getCSiteName() %>---问卷列表</title>
</head>
<body>
<div id="head">
<img src="<c:url value='/images/head.jpg'/>" style="width:770px;height:140px">
</div>
<%@ include file="banner.jsp"%>
<div id="box">
<div class="title">问卷列表</div>
<div>
<table  class="table" id=SurveyAdmin>
<tr><td align=left width="35%">问卷名称</td><td width="35%">问卷发起者</td><td width="15%">问卷创建日期</td><td width="15%">问卷结束日期</td></tr>
<% 
 
for(Survey s:slist){
 
	if(s.getSIsAudited()==false||s.getSIsOpen()==false)
		continue;
%>
<tr><td align="left" style="text-align:left"><a href="SurveyShow.jsp?sid=<%=s.getSId() %>" target="_blank"><%=s.getSName()%></a></td><td><%=s.getSAuthor() %></td><td><%=s.getSCreateDate() %></td><td><%=s.getSExpireDate() %></td></tr>
 <%
 
}
 %>
 <tr> <td colspan=4 align="right" style="text-align:right"><%=pc.getCurrentPageHTML() %><%=pc.getCountPageHTML() %>|<%=pc.getFirstPageHTML() %>|<%=pc.getPageUpHTML() %>|<%=pc.getPageDownHTML() %>|<%=pc.getLastPageHTML() %></td></tr>
</table>
</div>
</div><!--main box-->



<div id="bottom">
		<span style="color: #999999"> <%=cfg.getCSiteName()%></span><br />
		<span style="color: #999999"> <%=cfg.getCopyright()%>&nbsp;DM</span>
</div>
</body>
</html>