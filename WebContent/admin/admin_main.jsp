<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ec.survey.dao.*"%>
<%@ page import="com.ec.survey.dto.*"%>
<%
	ConfigDAO cdao = DAOFactory.getConfigDAO();
	Config cfg = cdao.findConfig();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<LINK href="images/Style.css" type=text/css rel=stylesheet>

<STYLE type=text/css>
a {
	text-decoration: none;
}

a:hover {
	font-size: 120%;
	text-decoration: underline;
} /* 当有鼠标悬停在链接上 */
BODY {
	MARGIN: 0px 0px;
	BACKGROUND-COLOR: #ffffff;
	background: url(images/desk.gif) center no-repeat;
}
</STYLE>
</HEAD>
<BODY>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top height="50%">
					<TABLE class=topdashed cellSpacing=0 cellPadding=0 width="100%"
						border=0>
						<TBODY>
							<TR>
								<TD align=right height=23>
									<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR>
												<TD>&nbsp;</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center
						border=0>
						<TBODY>
							<TR>
								<TD height=10>
									<DIV align=right></DIV>
								</TD>
							</TR>
							<TR>
								<TD height=25>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>

			<TR>
				<TD>
					<div style="HEIGHT: 30px; TEXT-ALIGN: center;">
						<span style="color: #999999"> <%=cfg.getCSiteName()%></span><br />
						<span style="color: #999999"> <%=cfg.getCopyright()%>&nbsp;2014
							版权所有：<a href="" target="_blank" style="color: #999999">darlingMonkey工作室.</a>&nbsp;
							All Rights Reserved .
						</span>
					</div>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>


