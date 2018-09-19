<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.argorse.product.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.argorse.admin.domain.Admin"%>
<%@page import="com.argorse.product.service.impl.ProductServiceImpl"%>
<%@page import="com.argorse.product.service.ProductService"%>

<%
	String path = request.getContextPath();
	String lastRequestURL = request.getRequestURI();
	String queryStr = request.getQueryString();
	String productid = request.getParameter("productid");
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Admin admin = (Admin)session.getAttribute("admin");
	Product p = null;
    if(productid != null){//new ProductServiceImpl().findAdminByName(admin.getAdmin_name()).getScore() > 0
	    if(admin == null){
			//System.out.println(basePath+"manage/admin/login.jsp");
			//response.sendRedirect(basePath+"manage/admin/login.jsp?lastRequestURL=" + URLEncoder.encode(lastRequestURL, 'UTF-8'));
			//response.sendRedirect(basePath+"manage/admin/login.jsp?lastRequestURL=" + lastRequestURL+"?"+queryStr);
			response.sendRedirect(basePath+"manage/admin/login.jsp?lastRequestURL=" + lastRequestURL);
			return;
		}
		Admin newAdmin = new ProductServiceImpl().findAdminByName(admin.getAdmin_name());
		if(newAdmin.getScore()<=0){
			response.sendRedirect(basePath+"manage/admin/noticeFee.jsp?lastRequestURL=" + lastRequestURL);
		}
		p = new ProductServiceImpl().findProductByIdAdmin(productid,admin);
	}else{%>
		<!-- <script type="text/javascript">
	        alert("用户余额不够，请充值！");
		</script> -->
	<% 
	//response.sendRedirect(basePath+"manage/admin/charge.jsp?lastRequestURL=" + lastRequestURL);
	//response.sendRedirect(basePath+"manage/admin/noticeFee.jsp?lastRequestURL=" + lastRequestURL);
	} 
	pageContext.setAttribute("p", p);
	
%>



<%@ include file="common/getMenu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>产品中心</title>
		<link href="<%=path%>/css/style.css" rel="stylesheet" media="screen"
			type="text/css" />
		<script type='text/javascript'
			src='<%=path%>/js/jquery.min.js?ver=1.3.2'></script>
		<script type='text/javascript'
			src='<%=path%>/js/jquery.prettyPhoto.js?ver=20091215'></script>
		<script type='text/javascript'
			src='<%=path%>/js/custom.js?ver=20091215'></script>

		<!--[if IE 6]>
<script type='text/javascript' src='/templets/g2/js/dd_belated_png.js'></script>
<script>DD_belatedPNG.fix('.ie6fix');</script>
<![endif]-->
	</head>
	<body id="subpage">
		<div class="wrap_all">
			<div id="top">
				<div id="head">
					<h1 class='logo'>
						<a href="<%=path%>/index.jsp">北京凯缘科技有限公司</a>
					</h1>
					<div class='name'>
						&nbsp;
						<a href="<%=path%>/index.jsp">北京凯缘科技有限公司</a>
					</div>
					<div class='lo'>
						<%
						   if(session.getAttribute("admin") == null) {
						  %>
					    	<a href="<%=path %>/manage/admin/login.jsp">登 陆</a>
					      <%
						   }
						   else  
						   {
						  %>
						    <a href="<%=path %>/manage/admin/logout.jsp">注 销</a>
						  <%
						   }
						  %>
					</div>
					<%@ include file="common/showMenus.jsp"%>
					<p class="breadcrumb">
						<strong class="breadcrumb_info">当前位置：</strong>
						<a href='<%=path%>/index.jsp'>首页</a> &raquo;
						<a href='<%=path%>/product.jsp'>产品中心</a> &raquo;
					</p>
				</div>

				<div id="main">
					<div id="content" class="bg_sidebar">
						<div id="inner_content">
							<div class="entry">
								<c:choose>
									<c:when test="${p!=null}">
										<h2>
											<a><%=p.getTitle()%></a>
										</h2>
										<div class="entry-content">
											<c:choose>
												<c:when test="${p.path!=null}">
													<p>
														<img width="500px" height="300px"
															src="<%=request.getContextPath()%>/userfiles/kaiyuan_images/<%=p.getPath()%>" />
														<br />
														<%=p.getContent()%>
													</p>
												</c:when>
												<c:otherwise>
													<%=p.getContent()%>
												</c:otherwise>
											</c:choose>
											<table align="right">
												<tr>
													<td>
														更新时间：
														<fmt:formatDate value="<%=p.getUpdateTime()%>"
															pattern="yyyy-MM-dd " />
													</td>
												</tr>
											</table>
										</div>
									</c:when>
									<c:otherwise>
									     IT资讯列表：
									      <ul>
											<c:forEach items="${productList}" var="p" varStatus="loop">
												<li>
													<a href="<%=path%>/product.jsp?productid=${p.id }">
														${p.title}&nbsp;&nbsp;<fmt:formatDate
															value="${p.updateTime}" pattern="yyyy-MM-dd " />
													</a>
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div id="sidebar">
							<div class="small_box widget_pages">
								<c:choose>
									<c:when test="${p!=null}">
										<span class="meta"> PRODUCTS </span>
										<h3>
											<a href='#'>公司产品</a>
										</h3>
										<ul>
											<c:forEach items="${productList}" var="n" varStatus="loop">

												<li <c:if test="${n.id==p.id}">class="current"</c:if>>

													<a href="<%=path%>/product.jsp?productid=${n.id }">${n.title
														} &nbsp;<fmt:formatDate value="${n.updateTime}"
															pattern="yyyy-MM-dd " /> </a>
												</li>
											</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</div>

							<%@ include file="common/contactus.jsp"%>

						</div>
					</div>
				</div>

				<%@ include file="common/footer.jsp"%>

			</div>
		</div>
	</body>
</html>

