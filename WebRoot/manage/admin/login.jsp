<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastRequestURL = request.getParameter("lastRequestURL");
String productid = request.getParameter("productid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户登录</title>
    <style type="text/css">
		<!--
		a {
			color: #008EE3
		}
		
		a:link {
			text-decoration: none;
			color: #008EE3
		}
		
		A:visited {
			text-decoration: none;
			color: #666666
		}
		
		A:active {
			text-decoration: underline
		}
		
		A:hover {
			text-decoration: underline;
			color: #0066CC
		}
		
		A.b:link {
			text-decoration: none;
			font-size: 15px;
			font-family: "Helvetica,微软雅黑,宋体";
			color: #FFFFFF;
		}
		
		A.b:visited {
			text-decoration: none;
			font-size: 15px;
			font-family: "Helvetica,微软雅黑,宋体";
			color: #FFFFFF;
		}
		
		A.b:active {
			text-decoration: underline;
			color: #FF0000;
		}
		
		A.b:hover {
			text-decoration: underline;
			color: #ffffff
		}
		
		.table1 {
			border: 1px solid #CCCCCC;
		}
		
		.font {
			font-size: 13px;
			text-decoration: none;
			color: #999999;
			line-height: 24px;
		}
		
		.input {
			font-size: 12px;
			color: #999999;
			text-decoration: none;
			border: 0px none #999999;
		}
		
		td {
			font-size: 13px;
			color: #007AB5;
		}
		
		form {
			margin: 1px;
			padding: 1px;
		}
		
		input {
			border: 0px;
			height: 26px;
			color: #007AB5;
			.
			unnamed1
			{
			border
			:
			thin
			none
			#FFFFFF;
		}
		
		.unnamed1 {
			border: thin none #FFFFFF;
		}
		
		select {
			border: 1px solid #cccccc;
			height: 18px;
			color: #666666;
			.
			unnamed1
			{
			border
			:
			thin
			none
			#FFFFFF;
		}
		
		body {
			background-repeat: no-repeat;
			background-color: #9CDCF9;
			background-position: 0px 0px;
		}
		
		.tablelinenotop {
			border-top: 0px solid #CCCCCC;
			border-right: 1px solid #CCCCCC;
			border-bottom: 0px solid #CCCCCC;
			border-left: 1px solid #CCCCCC;
		}
		
		.tablelinenotopdown {
			border-top: 1px solid #eeeeee;
			border-right: 1px solid #eeeeee;
			border-bottom: 1px solid #eeeeee;
			border-left: 1px solid #eeeeee;
		}
		
		.style6 {
			FONT-SIZE: 9pt;
			color: #7b8ac3;
		}
		-->
	</style>
    <%-- <link href="<%=path%>/css/style.css" rel="stylesheet" media="screen"
			type="text/css" />
		<script type='text/javascript'
			src='<%=path%>/js/jquery.min.js?ver=1.3.2'></script>
		<script type='text/javascript'
			src='<%=path%>/js/jquery.prettyPhoto.js?ver=20091215'></script>
		<script type='text/javascript'
			src='<%=path%>/js/custom.js?ver=20091215'></script> --%>
    <script type="text/javascript">
    	function login(){
    		if(document.getElementById('UserName').value == ''){
    			alert('用户名不能为空！');
    			return false;
    		}
    		if(document.getElementById('Password').value == ''){
    			alert('密码不能为空！');
    			return false;
    		}
    		document.getElementById('adminForm').submit();
    	}
    	
    	function register(){
    		window.location.href="register.jsp"; 
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf" id = "inner_content">
  <center>
  <!-- <h2><font style="font-size:12px">用户登录</font></h2> -->
    <form action="<%=path %>/admin.do?cmd=login&lastRequestURL=<%=lastRequestURL %>" method="POST" id="adminForm" style="font-size:12px">
  		<%
		   if(lastRequestURL != null) {
		%>
	  	<font color="red" size="3">温馨提示：</font><br/>
		<font color="red" size="3">该内容为收费内容2元/次，请输入用户名和密码登录后付款后查看,没有账号请注册！</font><br/>
		<br/>
		<%
		   }
		%>
	<font color="green" size='3'>${errorInfo}</font><br/>
    <table  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 80px">
    	
		<tr>
			<td height="30" colspan="2" align="left">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td width="60" height="30" align="left">
				登陆名称
			</td>
			<td>
				<input name="name" type="TEXT"
					style="background: url(images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
					id="UserName" size="16">
			</td>
		</tr>
		<tr>
			<td height="30" align="left">
				登陆密码
			</td>
			<td>
				<input name="password" TYPE="PASSWORD"
					style="border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
					id="Password" size="16">
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2" align="left">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="登录" onclick="login();">&nbsp;&nbsp;
				<input type="button" value="注册" onclick="register();">
			</td>
		</tr>
		<tr> <td height="70" colspan="2"></td></tr>	
	</table>
   <!--  用户名:<input type="text" name="name"><br>
    密   码:<input type="password" name="password"><br>
    <input type="button" value="登录" onclick="login();">&nbsp;&nbsp;
    <input type="button" value="注册" onclick="register();">  -->
    </form>
    </center>
  </body>
</html>
