<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ec.survey.dao.*"%>
<%@ page import="com.ec.survey.dto.*"%>
<%@ page import="java.text.DecimalFormat"%>


<%
SurveyDAO sdao=DAOFactory.getSurveyDAO();
Survey survey=sdao.findSurvey(Long.valueOf(request.getParameter("sid")));
QuestionDAO qdao=DAOFactory.getQuestionDAO();
List<Question> qlist=qdao.listAllQuestion(Long.valueOf(request.getParameter("sid")));
DecimalFormat df=new DecimalFormat("0.00");
%>
<script type="text/javascript" src="../Js/Func.js"></script>
<script type="text/javascript">
	window.onload=tableFix;
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/Css/Admin.css' />" type="text/css"/>
<style type="text/css">
	/*设置td超出文字，自动换行  */
	td {
		word-wrap:break-word;
		word-break:break-all;
	}
</style>
</head>
<body>

	<title>问卷---<%=survey.getSName()%> 统计结果
	</title>
	<div class="nav" style="text-align: left">
		<a href="admin_main.jsp">桌面</a>»<a href="SurveyStatis.jsp">问卷列表</a>»查看统计
		<hr>
	</div>
	<!--startprint-->
	<table width="100%" align="center" cellpadding="0" cellspacing="0"
		id="Survey_title" class="table">
		<tr>
			<th colspan="4">
				<div class="Survey_title">
					<span class="large"><%=survey.getSName().length()>30?survey.getSName().substring(0,30)+"...":survey.getSName()%></span>
				</div></th>
		</tr>
		<%
			int i=1;
		for(Question q:qlist){
			String [] bodys=q.getQBody().split("&\\$\\$&");
			String [] results=q.getQResult().split(",");
			//当题目类型为5，主观问答题的时候。
			if(q.getQType()==5){
				out.print("<tr><th colspan=\"4\">"+i+++"、"+q.getQHead()+"</th></tr>");
				out.print("<tr><td></td><td>这是一道主观问答题</td><td></td><td><a href=ShowText.jsp?qid="+q.getQId()+"&sid="+survey.getSId()+">查看具体</a></td></tr>");
			}
			else{
				/*一道题目的各个选项选择次数总统计
					用于计算*/
				int total=0;
				for(String s:results){
					total=total+Integer.valueOf(s);
				}
		%>
		<tr >
			<%--页面显示的问卷各个题目。 --%>
			<th colspan="4"><%=i++%>、<%=q.getQHead()%></th>
		</tr>

		<%
				/*循环显示一个题目的，选项，进度条，百分比，查看更多  */
				for(int j=0;j<bodys.length;j++){
		%>

		<tr>
			<td width="30%"><%=bodys[j]%>:</td>
			<td width="50%"><img src="<c:url value='/admin/images/blue.gif'/>" width="<%=Integer.valueOf(results[j])*100.00/total*3%>" height="20" /></td>
			<td width="10%"><%=results[j]%>/<%=total%>&nbsp;&nbsp;<%=df.format(Integer.valueOf(results[j])*100.00/total)%>%</td>
			<td width="10%"><%=(q.getQType()==3||q.getQType()==4)&&j==bodys.length-1?"<a href=ShowText.jsp?qid="+q.getQId()+" target=_blank>查看具体</a>":""%></td>
		</tr>

		<%
				}
			}
		}
		%>
		<!--endprint-->
		<tr>
			<td>&nbsp;</td>
			<td align=center>
				<div id="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="button1" type="button" value="打印统计" onClick="preview();"/>
				</div>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</body>
</html>


