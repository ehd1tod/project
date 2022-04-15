<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>shopping</title>
	<link href="/resources/header.css" rel="stylesheet" >
	<link rel="stylesheet" href="/resources/home.css"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
</head>
<header>
	<div id="inner">
		<h1><a href="#">KREAM</a></h1>
			<ul class="menu">
				<li><a href="#">게시글</a></li>
				<li><a href="/productList/list">SHOP</a></li>
			</ul>
			<hr/>
			<ul class="login">
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">로그인</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
	</div>
</header>
<body>
	<div id="page">
		<div id="content">
			<jsp:include page="${pageName}"/>
		</div>
		<div id="footer">
   <div class="footer-logo">
      <h1>KREAM</h1>
   </div>
   <hr/>
        <h3>회사소개</h3><br>
         <h4>00주식회사 대표 000  사업자등록번호: 000-00-00000<br>
         사업장소재지 인천광역시 미추홀구 학익동000-00,4층</h4><br><br><br><br><br>
         <h3>2022 인천일보아카데미@copyright all right reserved</h3>
      
      <div class="Service center">
         <h1>고객센터</h1>
         <h2>1588-0000</h2>
         <p>평일 09:00 ~ 18:00<br>
            점심시간 13:00 ~ 14:00
         </p>
      </div>
</div>
	</div>
</body>
<script>
	$("#chat").on("click", function(e){
		e.preventDefault();
		window.open("/chat", "chat", "width=500, height=700, top=200, left=900");
	});
</script>
</html>
