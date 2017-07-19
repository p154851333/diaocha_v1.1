<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ec.survey.dao.DAOFactory"%>
<%@ page import="com.ec.survey.dto.Answersheet" %>
<%@ page import="com.ec.survey.dao.AnswersheetDAO" %>
<%@ page import="com.swufe.pager.*" %>
<jsp:useBean id="pageConfig" class="com.swufe.pager.PageConfig"></jsp:useBean>
<jsp:setProperty property="request" name="pageConfig" value="<%=request %>"/>
<%
	AnswersheetDAO dao=DAOFactory.getAnswersheetDAO();
	PageControl pc=new PageControl(dao,pageConfig,"ShowText.jsp");
	pc.setSizePage(20);
	List<Answersheet> aList=pc.getRecord();
 %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'SurveyAudi.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../Css/Admin.css">
	<style type="text/css">
	/*设置td超出文字，自动换行  */
	td {
		word-wrap:break-word;
		word-break:break-all;
	}
</style>
	<script language="JavaScript" src="../Js/Func.js"></script>
	<script language="javascript">window.onload=tableFix;</script>
  </head>
  <body>
 <div class=nav style="text-align:left"><a href=admin_main.jsp>桌面</a>»<a href=SurveyStatis.jsp>问卷列表</a>»答卷列表
 <hr>
 </div>   
 <table class=table cellspacing="0" cellpadding="0" align="center">
<tbody><tr>
<th width=7%>编号</th>
<th width=20%>提交日期</th>
<th width=15%>用户IP<br></th>
<th>文本 <br></th></tr>
<%
for(int i = 0 ;i<aList.size();i++){
	String text ="";
	String results = aList.get(i).getAsResult();
	String pageQid = request.getParameter("qid");
	String temp = "&@@&"+pageQid+":text=";
	if(!(results.indexOf(temp)==-1)){
		String []result=results.split("&@@&");
		for(int j = 0 ; j <result.length;j++){
			//得到题号
			String	qid=result[j].substring(0,result[j].indexOf(":"));
			if(qid.equals(pageQid)){
				 text = result[j].substring(result[j].indexOf("text=")+5);
				 System.out.println(text);
			}
		}
 %>
<tr>
<td><%=aList.get(i).getAsId() %></td>
<td><%=aList.get(i).getAsPostdate() %></td>
<td><%=aList.get(i).getAsUserIp() %></td>
<td><%=text %></td>
<%-- <td><a href=ShowSheet.jsp?asid=<%=aList.get(i).getAsId() %>&sid=<%=aList.get(i).getSurvey() %>>查看</a>|<a href="javascript:DelSheet(<%=aList.get(i).getAsId() %>,<%=aList.get(i).getSurvey() %>)">删除</a></td> --%>
</tr>
 <%}	
} %>
<tr>
	<td><a href="javascript:history.back();" >&nbsp;返回</a></td> 
	<td colspan=6 align="right"><%=pc.getCurrentPageHTML() %><%=pc.getCountPageHTML() %>|<%=pc.getFirstPageHTML() %>|<%=pc.getPageUpHTML() %>|<%=pc.getPageDownHTML() %>|<%=pc.getLastPageHTML() %>
	</td>
</tr>
</tbody></table>
</body>
</html>
