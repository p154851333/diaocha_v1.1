<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ec.survey.dao.*"%>
<%@ page import="com.ec.survey.dto.*"%>
<%
	ConfigDAO cdao=DAOFactory.getConfigDAO();
	Config cfg=cdao.findConfig();
	SurveyDAO sdao=DAOFactory.getSurveyDAO();
	List<Survey> slist=sdao.listVisitableSurvey();
	List<Survey> shlist=sdao.listVisitableSurvey(OrderConst.UsehitsDesc);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<link rel="stylesheet" href="Css/Style.css" type="text/css" />
<link rel="stylesheet" href="Css/Admin.css" type="text/css" />
<title><%=cfg.getCSiteName()%>---首页</title>
</head>
<body>
	<div id="head">
		<img src="images/head.jpg;" style="width: 770px; height: 140px" />
	</div>
	<%@ include file="banner.jsp"%>
	<div id="main" class="middle">
		<div id="main_1">
			<div class="title"><div align="left" style="width:505px;float:left;">最新问卷</div><div align="center" style="width:45px;float:left;"><a href="Survey_list.jsp">更多</a></div> </div>
			<div class="head_new_flash">
				<script type='text/javascript'>
					function showLinkInfo(){
						
					}
				
					function gonggao_newpage(){
						out.print("登录成功!");
					}
					var imgUrl = new Array();
					var imgtext = new Array();
					var imgLink = new Array();
					<%int k=0;
						for(Survey s:slist){
							if(s.getSImg()!=null && (!"".equals(s.getSImg()))&&s.getSImg().endsWith(".jpg")){
								out.println("imgUrl["+k+"]='UploadImg/"+s.getSImg()+"';");
								out.println("imgtext["+k+"]='"+s.getSName()+"';");
								out.println("imgLink["+k+"]='SurveyShow.jsp?sid="+s.getSId()+"';");
								k++;
							}
					}%>
					var pics = imgUrl[0];
					var links = imgLink[0];
					var texts = imgtext[0];
					for (var i = 1; i < imgUrl.length; i++) {
						pics += '|' + imgUrl[i];
						links += '|' + imgLink[i];
						texts += '|' + imgtext[i];
					}
					var focus_width = 250;
					var focus_height = 188;
					var text_height = 22;
					var swf_height = focus_height + text_height;
				</script>
			</div>
			<div class="head_new_list">
				<ul>
					<%
						int i=0;
					for(Survey s:slist){
						if(i>7)
							break;
						if(s.getSIsAudited()==false||s.getSIsOpen()==false)
							continue;
					%>
					<li class=li><a href="SurveyShow.jsp?sid=<%=s.getSId()%>"
						target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName()%></a>&nbsp;&nbsp;&nbsp;&nbsp;<i><font
							color="grey"><%=s.getSCreateDate()%></font></i></li>
					<%
						i++;
					}
					%>
				</ul>
			</div>
		</div>

		<div id="main2_3">
			<div id="main_2">
			<div class="title"><div align="left" style="width:140px;float:left;">热门排行榜</div><div align="center" style="width:44px;float:left;"><a href="Survey_list.jsp">更多</a></div> </div>
				<div class="paihang_content">
					<ol class="list-item">
						<%
							i=0;
							for(Survey s:shlist){
							if(i>3)
								break;
							if(s.getSIsAudited()==false||s.getSIsOpen()==false)
								continue;
						%>
						<li><a href="SurveyShow.jsp?sid=<%=s.getSId()%>"
							target="_blank"><%=s.getSName().length()>12?s.getSName().substring(0,11)+"...":s.getSName()%></a></li>
						<%
							i++;
							}
						%>
					</ol>
				</div>
			</div>
			<!--main_2 end-->
			<div id="main_3">
			<div class="title">公告</div>
			<div class="gonggao_content">
				<ol class="list-item">
					<%
						if(cfg.getCIsOpen()){
					%>
					<li><a href="index.jsp" >无公告</a></li>
					<%
						}else{
					%>
					<li><a href="index.jsp" ><%=cfg.getCCloseWord()%></a></li>
					<%
						}
					%>
				</ol>
			</div>
		</div><!--main_3 end-->
		</div>
		
	</div>
	<!--main end-->

	<%
		LinkDAO ldao=DAOFactory.getLinkDAO();
		List<Link> llist=ldao.listAllLink();
	%>
	<div id="indexFriend" class="middle">
		<div class="title">友情链接</div>
		<div class="main">
			<ul>

				<%
					int j=0;
				for(Link link:llist){
					if(j>6)
						break;
					j++;
				%>
				<li class="friendBox"><a href="<%=link.getLUrl()%>" title="<%=link.getLInfo()%>"><%=link.getLName()%>
				</a></li>

				<%
					}
				%>
			</ul>

		</div>
	</div>


	<div id="bottom">
		<span style="color: #999999"> <%=cfg.getCSiteName()%></span><br />
		<span style="color: #999999"> <%=cfg.getCopyright()%>&nbsp;DM</span>
	</div>
	<!--bottom end-->
</body>
</html>