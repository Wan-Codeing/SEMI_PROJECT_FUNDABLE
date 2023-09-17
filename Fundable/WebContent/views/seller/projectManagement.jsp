<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.fun.product.model.vo.Image"%>
<%

ArrayList<Image> list = (ArrayList<Image>) request.getSession().getAttribute("list");
Image profile = (Image) request.getSession().getAttribute("profile");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/headers/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>프로젝트 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/headers/">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
@import
	url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css')
	;

* {
	box-sizing: border-box;
	margin: 0;
	font-family: "Pretendard";
}
/*======================================  헤더 ==========================================================*/
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

/*======================================  푸터 ==========================================================*/
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
/*============================================== 마이페이지 ==================================================*/
body {
	margin: 0;
	box-sizing: border-box;
	width: clac(100vw - ( 100vw - 100%));
}

#mypagebanner {
	width: 85vw;
	height: 18vh;
	/* background-color: rgb(245, 245, 245); */
	display: flex;
	margin: auto;
}

#mypagebanner img {
	border-radius: 0.6vh;
}

#profile {
	width: 15vw;
	height: 100%;
}

#profile-image {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 18vh;
}

#profile-image img {
	width: 6vw;
	height: 12vh;
}

#myname {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 1em;
}

#mypagebanner-product {
	width: 65vw;
	height: 100%;
}

#mypagebanner-product * {
	list-style: none;
	font-size: 1.2em;
	font-weight: bold;
	margin-bottom: 1.5vh;
}

#mypagebanner-product img {
	width: 6vw;
	height: 9vh;
}

#mypagebanner-product-list {
	display: flex;
	justify-content: space-around;
}

#mypagebanner-btn {
	width: 17vw;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: end;
}

#seller-page-change {
	width: 9vw;
	height: 4.5vh;
	border-radius: 1vh;
	font-size: 0.9em;
	font-weight: bold;
	background-color: gray;
	color: white;
	border: 1px solid rgb(86, 86, 86);
	margin: 4vh 0 2vh 0;
}

#mypage-logout {
	width: 6vw;
	height: 5vh;
	border-radius: 1vh;
	background-color: rgb(223, 224, 224);
	border: 1px solid rgb(86, 86, 86);
	font-size: 14px;
	font-weight: bold;
	color: rgb(104, 97, 97);
}

#mypagebanner-wrap {
 		  width: 100%;
          background-color: rgb(245, 245, 245);
          border: 1px solid rgb(215, 215, 215);
          margin-top: 10.7vh;
}

/*============================================================   마이페이지 배너 밑에 ==========================================*/
#push-detail {
	margin: 4vh 7vw 1vh 0;
}

#mypage-list {
	padding-top: 4%;
	width: 14vw;
	display: flex;
	flex-direction: column;
	/* background-color: red; */
}

#mypage-list ul, h4 {
	list-style: none;
	padding-left: 0;
	margin-top: 1.5vw;
	font-weight: bold;
}

#mypage-list a {
	color: #9b9a9a;
}

#mypage-list a:hover {
	color: black;
}

#mypage-list li, a {
	margin-top: 1.2vw;
	font-size: 15px;
	text-decoration: none;
	margin-left: 0.1vw;
	color: black;
}

#mypage-content-wrap {
	display: flex;
	margin-top: 5vh;
	width: 85vw;
	margin: auto;
}

#mypage-content {
	width: 71vw;
}

#modal-body-wrap {
	display: flex;
}

#modal-img {
	width: 15vw;
	height: 20vh;
	border-radius: 10px;
}

.modal-body td {
	width: 16vw;
}
/*---------------------------------------------------------------------------------------------*/
/* *{
      border:1px solid red;
    } */
.project1 {
	width: 800px;
	display: block;
	height: 90px;
	border: 1px solid lightgray;
	border-left-color: rgb(140, 140, 140);
	border-left-width: 6px;
	border-radius: 3px;
	padding: 16px 32px;
	line-height: 3;
	color: #000;
	font-size: 19px;
	display: flex;
	margin-left : 100px;
	margin-top : 25px;
}

.wz.button {
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 50px;
	background-color: #fff;
	cursor: pointer;
	padding: 0 1.41176em;
	height: 48px;
	vertical-align: middle;
	line-height: 2.5;
	color: rgba(0, 0, 0, .54);
	font-size: 17px;
	font-weight: 400;
	box-sizing: border-box !important;
	display: inline-block;
	text-decoration: none;
	margin-left: 450px;
	margin-top: -1%;
}

.wz.button:hover {
	color: black;
	background-color: lightgray;
	opacity: 0.8;
}

.prject-btn a {
	margin-top: 20%;
}

.project_container {
	margin-top: 3%;
}

#mins{
	margin-top:25px;
}     
#mins2{
	margin-top:0px;
}
.d-flex{
	margin-top:20px;
}
#mins3{
	height:50px;
}
</style>


<!-- Custom styles for this template -->
<link href="headers.css" rel="stylesheet">
</head>
<body>

	<%@ include file="/views/common/헤더.jsp" %>
	<h1 class="visually-hidden">s</h1>


	<!-- 배너 부분 -->
	<div id="mypagebanner-wrap">
		<div id="mypagebanner">

			<div id="profile">

				<div id="profile-image">
					<% if(profile.getChangeName() != null){ %>
		    		   	<img src="<%= contextPath %>/<%= profile.getFilePath() + profile.getChangeName()%>" >
		   		   <%} else{%>
		     			<img src="https://www.thechooeok.com/common/img/default_profile.png" >
		     	   <%} %>
					<div id="myname">
						<span><%=loginUser.getUserNick() %>님</span>
					</div>
				</div>
			</div>

			<div id="mypagebanner-product">

				<div style="padding-left: 6.5%; margin-top: 1.5%;">현재 진행중인
					프로젝트</div>
				<ul id="mypagebanner-product-list">
					<!-- 상품 링크 -->
					<%if (list.size() > 0) {%>
						<%for (int i = 0; i < list.size(); i++) {%>
						<% 
							if(i==5){
								break;	
							}
							%>
							<li><a href="<%=contextPath%>/seller.fu?pno=<%=list.get(i).getProductNo()%>">
							<img
									src="<%=contextPath%>/<%=list.get(i).getFilePath() + list.get(i).getChangeName()%>"
									alt=""></a></li>
						<%}%>
					<%} else {%>
					<%}%>
				</ul>
			</div>

			<div id="mypagebanner-btn">
				<!-- 마이페이지 전환 링크 -->
				<input type="submit" name="" id="seller-page-change"
					class="btn btn-outline-secondary"
					onclick="location.href='<%=contextPath %>/myPage.me'" value="마이페이지 전환">
			</div>

		</div>
	</div>
	<!-- 배너 부분  끝 -->

	<!-- 마이페이지 컨텐츠부분 감싸는 div-->
	<div id="mypage-content-wrap">


		<!-- 마이페이지 리스트 -->
		<div id="mypage-list">
			<br>
			<h2 style="font-weight: bold;">Seller Page</h2>
			<ul>
				<li><a href="<%= contextPath %>/IngProject"
					style="font-size: 24px; color: black;">프로젝트 관리</a></li>
				<li><a href="/Fundable/views/seller/projectInf.jsp">프로젝트 정보</a></li>
				<li><a href="<%=contextPath %>/rewardpro.pr">리워드 설계</a></li>
				<li><a href="/Fundable/views/seller/policy.jsp">정책</a></li>
			</ul>
			<ul>
				<li><a href="<%=contextPath%>/search.de1"
					style="font-size: 24px;">발송 관리</a></li>
			</ul>
			<ul>
				<%if(loginUser != null){ %>
					<li>	
						<a href="<%=contextPath %>/search.ac?userNo=<%=loginUser.getUserNo() %>" style="font-size: 24px;">정산 관리</a>
					</li>
		      	<%}%>
			</ul>
		</div>
		<!-- 마이페이지 리스트 끝 -->
		<div>
			<div class="project_container">
				<br> <br>
				<h2>
					<b>프로젝트 관리</b>
				</h2>
				<br> <br>
				<div class="project1 ">
					<div class="project1_name" style="width: 150px;">프로젝트 정보</div>
					<div class="project1_btn">
						<a href="/Fundable/views/seller/projectInf.jsp" class="wz button"
							style="width: 120px;">작성하기</a>
					</div>
				</div>
				<br>
				<div class="project1 ">
					<div class="project1_name" style="width: 150px;">리워드 설계</div>
					<div class="project1_btn">
						<a href="<%=contextPath %>/rewardpro.pr" class="wz button"
							style="width: 120px;">작성하기</a>
					</div>
				</div>
				<br>
				<div class="project1 ">
					<div class="project1_name" style="width: 150px;">정책</div>
					<div class="project1_btn">
						<a href="/Fundable/views/seller/policy.jsp" class="wz button"
							style="width: 120px">작성하기</a>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
	<script>
		const msg = "<%=(String) session.getAttribute("alertMsg")%>";

		if (msg != "null") {
			alert(msg);
			// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
			// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
			<%session.removeAttribute("alertMsg");%>
		}
	</script>
</body>
</html>