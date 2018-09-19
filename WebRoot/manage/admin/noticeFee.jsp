<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>收费提示</title>
    <script type="text/javascript">
    	function confirm(){
    		window.location.href="../../index.jsp"; 
    	}
    </script>
  </head>
  
  <body bgcolor="#abcedf">
   <h3><font style="font-size:12px">收费提示</font></h3>
   <font color="red">温馨提示：</font><br/>
 您已经登陆成功，但是账户余额为 0,请按下方信息充值！<br/>
   收费联系人米总： 手机-18600551526<br/>
 Tel: 010-61640964<br/>
Fax: 010-61640964<br/>
E-mail: mk@maidi-online.com<br/> 
<input type="button" value="回首页" onclick="confirm();"><br><br>
  </body>
</html>
