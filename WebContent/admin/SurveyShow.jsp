<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ec.survey.dao.DAOFactory"%>
<%@ page import="com.ec.survey.dto.Question"%>
<%@ page import="com.ec.survey.dao.QuestionDAO"%>
<%@ page import="com.swufe.pager.*"%>

<jsp:useBean id="pageConfig" class="com.swufe.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig"
	value="<%=request%>" />
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	QuestionDAO dao=DAOFactory.getQuestionDAO();
	PageControl pc=new PageControl(dao,pageConfig,"QuestionAdmin.jsp?rand=1");
	pc.setSizePage(5);
	List<Question> sList=pc.getRecord();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'SurveyAudi.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="<c:url value ='/Css/Admin.css'/>">
<style type="text/css">
	/*设置td超出文字，自动换行  */
	td {
		word-wrap:break-word;
		word-break:break-all;
	}
</style>
<script type="text/javascript" src="../Js/Func.js"></script>
<script type="text/javascript">window.onload=tableFix;</script>
<script type="text/javascript" src="../Js/QuestAdd.js"></script>
<script type="text/javascript">
function delQuestion(qid){
	if(confirm("确定要删除这个题目吗？")==true)
	window.location="<%=basePath%>question/delQuestion.do?&qid="+qid+"&sid=<%=request.getParameter("sid") %>";
}
function showType(typecode){ 
	//typecode: dx--单选 ;fx--复选;
	document.getElementById("qEditor").innerHTML=document.getElementById(typecode).innerHTML;
}
function editQuestion(qid){
	var sUrl=setQueryString("op","editQuestion","QuestionEdit.jsp");
	sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
	window.location=setQueryString("qid",qid,sUrl);
}
function setJD(qid){
	var sUrl=setQueryString("op","setJD","QuestionJD.jsp");
	sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
	window.location=setQueryString("qid",qid,sUrl);
} 
function setTZ(qid){
	var sUrl=setQueryString("op","setTZ","QuestionTZ.jsp");
	sUrl=setQueryString("sid","<%=request.getParameter("sid")%>",sUrl);
	window.location=setQueryString("qid",qid,sUrl);
} 
</script>
</head>
<body>
	<div class=nav>
		<a href=admin_main.jsp>桌面</a>»<a href=SurveyAdmin.jsp>问卷列表</a>»预览
		<hr />
	</div>
	<table class=table cellspacing="0" cellpadding="0" align="center">
		<tbody>
			<tr>
				<th width=3% align="center">编号</th>
				<th>题目标题</th>
				<th width=60%>题目选项</th>
				<th width=20%>操作 <br></th>
			</tr>
			<%
				for(Question question:sList){
			%>
			<tr>
				<td><%=question.getQId()%></td>
				<td><%=question.getQHead()%></td>
				<td><%=question.getQBody()%></td>
				<td><a href="javascript:editQuestion(<%=question.getQId()%>)">查看问题</a>||<a
					href='javascript:delQuestion(<%=question.getQId()%>)'>删除</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan=4 align="right"><%=pc.getCurrentPageHTML()%><%=pc.getCountPageHTML()%>|<%=pc.getFirstPageHTML()%>|<%=pc.getPageUpHTML()%>|<%=pc.getPageDownHTML()%>|<%=pc.getLastPageHTML()%></td>
			</tr>
			<tr>
				<td colspan=4 align="left">
					<button onclick="JavaScript:window.history.back(-1)">返回上一页</button>
				</td>
			</tr>
			
		</tbody>
	</table>
</body>
</html>
