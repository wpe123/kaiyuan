<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/includes.jsp"%>
<%@ page import="com.argorse.product.domain.*"%>
<%@page import="com.argorse.admin.domain.Admin"%>
<%@page import="com.argorse.product.service.impl.ProductServiceImpl"%> 
<%@page import="com.argorse.product.service.ProductService"%>

<%
	/* String path = request.getContextPath();

	NewsServiceImpl service = new NewsServiceImpl();
	List newslist = service.selectNews();
	System.out.println("newList.length="+newslist.size());
	pageContext.setAttribute("newslist", newslist); */
	
	String path = request.getContextPath();
	String lastRequestURL = request.getRequestURI();
	String queryStr = request.getQueryString();
	String productid = request.getParameter("productid");
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Admin admin = (Admin)session.getAttribute("admin");
	if(session.getAttribute("productList") == null){
		ProductService pservice = new ProductServiceImpl();
		int size = pservice.findAllProduct().size();
		System.out.println("size="+size);
		List productList = pservice.findAllProduct();
		session.setAttribute("productList", productList);
	}
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
	System.out.println("aaa");
	} 
	pageContext.setAttribute("p", p);
%>

<!DOCTYPE html>
<html lang="cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>麦迪在线</title>
<style>
.abc{clear:both;width:800px;height:66px;text-align:center;margin:auto;background-repeat:repeat;line-height:66px}
.abcd{background: #000; margin: 0 auto; width: 90%; min-width: 800px; max-width: 960px;}
</style>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<!-- <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
 -->
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="newcss/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="newcss/fonts/font-awesome/css/font-awesome.css">
<link href="<%=path%>/css/style.css" rel="stylesheet" media="screen"
			type="text/css" />

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="newcss/css/style.css">
<link rel="stylesheet" type="text/css" href="newcss/css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css" href="newcss/css/nivo-lightbox/default.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation
    ==========================================-->
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <img src="newcss/img/logo5.jpg" style="width: 80px;height: 80px; border-radius:250px;overflow: hidden;float:left; margin-right:10px;">&nbsp;&nbsp;<a class="navbar-brand page-scroll" href="#page-top">麦迪在线<br><br><font size="3">让健康永远陪伴</font></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#header" class="page-scroll">首 页</a></li>
        <li><a href="#about" class="page-scroll">关于我们</a></li>
        <li><a href="#services" class="page-scroll">产品服务</a></li>
        <li><a href="#testimonials" class="page-scroll">合作伙伴</a></li>
        <li><a href="#contact" class="page-scroll">联系我们</a></li>
        <!-- <li><a href="#team" class="page-scroll">Team</a></li>
        <li><a href="#contact" class="page-scroll">Contact</a></li> -->
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
</nav>
<!-- Header -->
<header id="header">
  <div class="intro">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2 intro-text">
            <h1>We Are Interact<span></span></h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sed commodo nibh ante facilisis bibendum.</p>
            <a href="#features" class="btn btn-custom btn-lg page-scroll">Learn More</a> </div>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- About Section -->
<div id="about">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-6"> <img src="newcss/img/about.jpg" class="img-responsive" alt=""> </div>
      <div class="col-xs-12 col-md-6">
        <div class="about-text">
          <h2>关于我们</h2>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;麦迪在线拥有一支专业且年轻化的团队，平均年龄只有33岁；我们拥有共同目标，7名合伙人，在不同的领域，有各自的专长，是一个难得的高效协作的整体。
			  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们拥有丰富的慢病医疗知识、慢病管理、社区医院领域、互联网技术等多元专业技术背景。
          </p>
          <h3>Why Choose Us?</h3>
          <div class="list-style">
            <div class="col-lg-6 col-sm-6 col-xs-12">
              <ul>
                <li>年轻</li>
                <li>专业</li>
                <li>专注</li>
                <li>务实</li>
              </ul>
            </div>
            <div class="col-lg-6 col-sm-6 col-xs-12">
              <ul>
                <li>诚信</li>
                <li>敬业</li>
                <li>合作共赢</li>
                <li>求实创新</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Services Section -->
<div id="services" class="text-center">
  <div class="container">
    <div class="section-title">
      <h2>产品服务</h2>
      <p></p>
    </div>
    <div class="row">
    	<div class="col-md-4"> <img src="newcss/img/product1.jpg" alt="..." class="team-img" width="130" height="130">
          <div class="caption">
            <h4>患者端Android应用</h4>
            <p>请用手机扫描二维码进行下载</p>
          </div>
        </div>
        <div class="col-md-4"> <img src="newcss/img/product2.jpg" alt="..." class="team-img" width="130" height="130">
          <div class="caption">
            <h4>医护端Android应用</h4>
            <p>请用手机扫描二维码进行下载</p>
          </div>
        </div>
      <!-- <div class="col-md-4"> <i class="fa fa-wordpress"></i>
        <div class="service-desc">
          <h3>Lorem ipsum dolor</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at.</p>
        </div>
      </div>
      <div class="col-md-4"> <i class="fa fa-cart-arrow-down"></i>
        <div class="service-desc">
          <h3>Consectetur adipiscing</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
      </div>
      <div class="col-md-4"> <i class="fa fa-cloud-download"></i>
        <div class="service-desc">
          <h3>Lorem ipsum dolor</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at.</p>
        </div>
      </div> -->
    </div>
    <!-- <div class="row">
      <div class="col-md-4"> <i class="fa fa-language"></i>
        <div class="service-desc">
          <h3>Consectetur adipiscing</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at.</p>
        </div>
      </div>
      <div class="col-md-4"> <i class="fa fa-plane"></i>
        <div class="service-desc">
          <h3>Lorem ipsum dolor</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at.</p>
        </div>
      </div>
      <div class="col-md-4"> <i class="fa fa-pie-chart"></i>
        <div class="service-desc">
          <h3>Consectetur adipiscing</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at.</p>
        </div>
      </div>
    </div> -->
  </div>
</div>
<!-- Gallery Section 
<div id="portfolio" class="text-center">
  <div class="container">
    <div class="section-title">
      <h2>Gallery</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit duis sed dapibus leonec.</p>
    </div>
    <div class="row">
      <div class="portfolio-items">
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/01-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Lorem Ipsum</h4>
              </div>
              <img src="newcss/img/product1.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/02-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Adipiscing Elit</h4>
              </div>
              <img src="newcss/img/portfolio/02-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/03-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Lorem Ipsum</h4>
              </div>
              <img src="newcss/img/portfolio/03-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/04-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Lorem Ipsum</h4>
              </div>
              <img src="newcss/img/portfolio/04-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/05-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Adipiscing Elit</h4>
              </div>
              <img src="newcss/img/portfolio/05-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/06-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Dolor Sit</h4>
              </div>
              <img src="newcss/img/portfolio/06-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/07-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Dolor Sit</h4>
              </div>
              <img src="newcss/img/portfolio/07-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/08-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Lorem Ipsum</h4>
              </div>
              <img src="newcss/img/portfolio/08-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <div class="portfolio-item">
            <div class="hover-bg"> <a href="newcss/img/portfolio/09-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
              <div class="hover-text">
                <h4>Adipiscing Elit</h4>
              </div>
              <img src="newcss/img/portfolio/09-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>-->
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
<!-- Testimonials Section -->
<div id="testimonials">
  <div class="container">
    <div class="section-title text-center">
      <h2>What our clients say</h2>
    </div>
    <div class="row">
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/01.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at."</p>
            <div class="testimonial-meta"> - John Doe </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/02.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis."</p>
            <div class="testimonial-meta"> - Johnathan Doe </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/03.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at."</p>
            <div class="testimonial-meta"> - John Doe </div>
          </div>
        </div>
      </div>
      <div class="row"> </div>
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/04.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at."</p>
            <div class="testimonial-meta"> - Johnathan Doe </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/05.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis bibendum dolor feugiat at."</p>
            <div class="testimonial-meta"> - John Doe </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="testimonial">
          <div class="testimonial-image"> <img src="newcss/img/testimonials/06.jpg" alt=""> </div>
          <div class="testimonial-content">
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam sedasd commodo nibh ante facilisis."</p>
            <div class="testimonial-meta"> - Johnathan Doe </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Team Section 
<div id="team" class="text-center">
  <div class="container">
    <div class="col-md-8 col-md-offset-2 section-title">
      <h2>Meet the Team</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit duis sed dapibus leonec.</p>
    </div>
    <div id="row">
      <div class="col-md-3 col-sm-6 team">
        <div class="thumbnail"> <img src="newcss/img/team/01.jpg" alt="..." class="team-img">
          <div class="caption">
            <h4>John Doe</h4>
            <p>Director</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6 team">
        <div class="thumbnail"> <img src="newcss/img/team/02.jpg" alt="..." class="team-img">
          <div class="caption">
            <h4>Mike Doe</h4>
            <p>Senior Designer</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6 team">
        <div class="thumbnail"> <img src="newcss/img/team/03.jpg" alt="..." class="team-img">
          <div class="caption">
            <h4>Jane Doe</h4>
            <p>Senior Designer</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6 team">
        <div class="thumbnail"> <img src="newcss/img/team/04.jpg" alt="..." class="team-img">
          <div class="caption">
            <h4>Karen Doe</h4>
            <p>Project Manager</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>-->
<!-- Contact Section -->
<div id="contact">
  <div class="container">
    <div class="col-md-8">
      <div class="row">
        <div class="section-title">
          <h2>联系我们</h2>
          <p>请留下您的联系方式，我们将尽快联系到您.</p>
        </div>
        <form name="sentMessage" id="contactForm" novalidate>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <input type="text" id="name" class="form-control" placeholder="Name" required="required">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <input type="email" id="email" class="form-control" placeholder="Email" required="required">
                <p class="help-block text-danger"></p>
              </div>
            </div>
          </div>
          <div class="form-group">
            <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message" required></textarea>
            <p class="help-block text-danger"></p>
          </div>
          <div id="success"></div>
          <button type="submit" class="btn btn-custom btn-lg">提交信息</button>
        </form>
      </div>
    </div>
    <div class="col-md-3 col-md-offset-1 contact-info">
      <div class="contact-item">
        <h3>联系信息</h3>
        <p><span><i class="fa fa-map-marker"></i> Address</span>北京市海淀区<br>北太平庄路18号3层3-0899</p>
      </div>
      <div class="contact-item">
        <p><span><i class="fa fa-phone"></i> Phone</span> 010-61640964</p>
      </div>
      <div class="contact-item">
        <p><span><i class="fa fa-envelope-o"></i> Email</span> mk@maidi-online.com</p>
      </div>
    </div>
    <div class="col-md-12">
      <!-- <div class="row">
        <div class="social">
          <ul>
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="#"><i class="fa fa-youtube"></i></a></li>
          </ul>
        </div>
      </div> -->
    </div>
  </div>
</div>
<!-- Footer Section -->
<div id="abc">
  <div class="abc">
    <p>Copyright@2018-2019 北京凯缘科技有限公司权所有 京ICP备18044644号-1</p>
  </div>
</div>
<script type="text/javascript" src="newcss/js/jquery.1.11.1.js"></script> 
<script type="text/javascript" src="newcss/js/bootstrap.js"></script> 
<script type="text/javascript" src="newcss/js/SmoothScroll.js"></script> 
<script type="text/javascript" src="newcss/js/nivo-lightbox.js"></script> 
<script type="text/javascript" src="newcss/js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="newcss/js/contact_me.js"></script> 
<script type="text/javascript" src="newcss/js/main.js"></script>
</body>
</html>