<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.*"%>
<html>
<head>
<title>Docamp</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/logo.png" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<style>
div {
	text-align: center;
}
</style>


</head>
<body>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	EventDAO ed = new EventDAO();
	ResultSet rs = ed.getResult("select * from event where e_id="+idx);
	rs.next();
	int id = Integer.parseInt(rs.getString("e_id"));
%>
	<!-- Page Preloder -->
	<!-- 	<div id="preloder">
		<div class="loader"></div>
	</div>
	 -->
	<!-- Header section -->
	<jsp:include page="jsp/header.jsp" flush="false" />
	<!-- Header section end -->

	<!-- Page info -->
	<%
		if(id==2){ %>
	<div class="page-top-info">
		<div class="container">
			<h4>Sharing Event</h4>
			<h5>쉐어링 이벤트</h5>
			<!-- <div class="site-pagination">
				<a href="">Home</a> / <a href="">Event</a> /
			</div> -->
		</div>
	</div>
	<div><a href="sharing.jsp">
		<img src=<%=rs.getString("e_info") %> usemap="#head-login-btn"
			align="center" width="74%" alt="">

		</a>
	</div>
	<%}else{ %>
	<div class="page-top-info">
		<div class="container">
			<h4>Docamp Deals!</h4>
			<h5>무료 배송 이벤트</h5>
			<!-- <div class="site-pagination">
				<a href="">Home</a> / <a href="">Event</a> /
			</div> -->
		</div>
	</div>
	<div>
		<img src=<%=rs.getString("e_info") %> usemap="#head-login-btn"
			align="center" width="80%" alt="">
		<map name="head-login-btn">
			<area shape="rect" coords="350,2800,1100,3090" href="sharing.jsp">
		</map>
	</div>
	<%} %>
</body>
<script>

$(function(){

	$('img[usemap]').rwdImageMaps();

	$("#img").width("100%");

});

</script>



</html>