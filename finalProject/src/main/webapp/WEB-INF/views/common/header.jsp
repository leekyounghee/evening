<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700"
	rel="stylesheet">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- Animate.css -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="resources/css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="resources/css/style.css">

<link
	href="https://fonts.googleapis.com/css?family=Gothic+A1|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- font-awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/v4-shims.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.11.2/js/all.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.11.2/js/v4-shims.js"></script>

<!-- Mypage style (경희) -->
<link rel="stylesheet" href="resources/css/mypage.css">
<!-- header css -->
<link rel="stylesheet" href="resources/css/header.css">
<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>
<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/v4-shims.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.11.2/js/all.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.11.2/js/v4-shims.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>

</head>
<body>

	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들어주자 -->
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />


	<header class="ebHeader">
		<div class="ebHeader-bar no-drag">
			<div style="height: 100%; overflow: hidden;">
				<div id="hLogo">
					<img src="resources/images/eve-logo.png">
				</div>
				<div id="navTag">
					<ul id="hNav">
						<li><a href="auctionList.bo">경매</a></li>
						<li><a href="usedListAll.ud">중고거래</a></li>
						<li class="nav_sub"><a href="gList.ge?category=Community">게시판</a>
							<div style="position: fixed;">
								<ul id="test" style="height:75px !important;">
									<li><a href="gList.ge?category=Community">커뮤니티</a></li>
									<li><a href="gList.ge?category=Selling">삽니다</a></li>
									<li><a href="gList.ge?category=QNA">문의사항</a></li>
								</ul>
							</div>
						</li>
						<!-- 비회원시 -->
						<li><a href="">로그인</a></li>
						<li><a href="">회원가입</a></li>
						<!-- 로그인시 -->
						<li class="nav_sub"><a>마이페이지</a>
							<div style="position: fixed;">
								<ul id="test">
									<li><a href="myinfo.me">내정보보기</a></li>
									<li><a href="favorites.me">관심 목록</a></li>
									<li><a href="dealDetail.me">거래 내역</a></li>
									<li><a href="mypost.me">내가 쓴 글</a></li>
								</ul>
							</div></li>
						<li><img src="../push_bell/img/bell.png" alt=""></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<script>
		$('#hLogo img').click(function(){
			location.href="home.do";
		});
   </script>
	<div class="catalog no-drag">
		<div style="text-align: center; display: inline-block;">
			<ul class="catalog-ul">
				<li class="catalog-tap" onclick="location.href='secondgoodList.bo'"><a
					style="font-size: 21px;">중고</a></li>
				<c:url var="auction" value="auctionList.bo" />
				<li class="catalog-tap" onclick="location.href='auctionList.bo'"><a
					style="font-size: 21px;">경매</a></li>
				<li class="catalog-tap"><a style="font-size: 21px;">게시판</a>
					<ul class="catalogTag">
						<li onclick="location.href='gList.ge?category=Community'">
							<i class="fas fa-comments fa-2x"></i><br>커뮤니티</li>
						<li onclick="location.href='gList.ge?category=Selling'">
							<i class="fas fa-shopping-basket fa-2x"></i><br>삽니다</li>
						<li onclick="location.href='gList.ge?category=QNA'">
							<i class="fas fa-question-circle fa-2x"></i><br>문의글</li>
					</ul></li>
			</ul>
		</div>
	</div>








	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>


	<!-- jQuery -->
	<script src="resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="resources/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="resources/js/main.js"></script>
	<!-- header-->
	<script src="resources/js/header.js"></script>

	<script src="resources/js/mypage.js"></script>
</body>
</html>