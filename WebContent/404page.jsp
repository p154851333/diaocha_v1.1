<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.ec.survey.dao.*"%>
<%@ page import="com.ec.survey.dto.*"%>
<%
	ConfigDAO cdao = DAOFactory.getConfigDAO();
	Config cfg = cdao.findConfig();
	SurveyDAO sdao = DAOFactory.getSurveyDAO();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 Error</title>
<meta name="description" content="404 Error" />
<meta name="keywords" content="404, error" />
<link rel="stylesheet" type="text/css" href="<c:url value ='/Css/404style.css'/>" />
<script type="text/javascript">

	/*搜索的焦点文字隐现设置  */
	function onfocus1() {
		var search = document.getElementById("search");
		if(search.value=="百度搜索"){
			search.value="";
		}
	}
	function onblur1(){
		var search = document.getElementById("search");
		if(search.value==""){
			search.value="百度搜索";
		}
	}
	/*搜索跳转到百度  */
	function fromsubmit(){
		var search = document.getElementById("search");
		var searchValue=search.value;
		location.href="https://www.baidu.com/s?wd="+searchValue;
	}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<div id="whoops"></div>
			<p>
				你要找的那页似乎不见了。<br /> <a href="javascript:history.go(-1)">Go back</a>或者返回
				<a href='<c:url value="/index.jsp"/>'>首页</a><br /> 
				<a href='<c:url value="/login.jsp"/>'>管理员登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
				如有任何意见或建议，请及时 <a href="mailto:friday.pei@gmail.com">反馈给我们。</a>.
			</p>
			<div id="divider"></div>
			
			<!--搜索框  -->
			<div class="search">
				<div class="input-box">
					<input id="search"
						onfocus="onfocus1()" onblur="onblur1()"
						name="search" value="百度搜索" type="text" />
				</div>
				<input id="submit" class="submit" value="Search" type="submit" onclick="fromsubmit()"/>
			</div>

			<div id="bottom">
				<span style="color: #999999"> <%=cfg.getCSiteName()%></span><br />
				<span style="color: #999999"> <%=cfg.getCopyright()%>&nbsp;DM</span>
			</div>
			<!--bottom end-->
		</div>
	</div>
</body>
</html>