<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户注册页面</title>
   
    <script type="text/javascript">
    	function register(){
    		if(document.getElementById('name').value == ''){
    			alert('用户名不能为空！');
    			return false;
    		}
    		if(document.getElementById('password').value == ''){
    			alert('密码不能为空！');
    			return false;
    		}
    		if(document.getElementById('repeatPwd').value == ''){
    			alert('确认密码不能为空！');
    			return false;
    		}
    		if(document.getElementById('password').value != document.getElementById('repeatPwd').value){
    			alert('密码和确认密码必须输入一致！');
    			return false;
    		}
    		document.getElementById('registerForm').submit();
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf">
  <h2><font style="font-size:12px">用户注册</font></h2>
   <font color="red">${msg}</font>
    <form action="<%=path %>/admin.do?cmd=addAdmin" method="POST" id="registerForm" style="font-size:12px">
    用 户 名:<input type="text" id="name" name="name"><br>
    密     码:<input type="password" id="password" name="password"><br>
    确认密码:<input type="password" id="repeatPwd"><br>
    <input type="button" value="提 交" onclick="register();">
    </form>
  </body>
</html>
