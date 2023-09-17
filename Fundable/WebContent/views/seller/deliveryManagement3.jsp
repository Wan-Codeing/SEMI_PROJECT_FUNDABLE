<%@ page import="java.util.ArrayList, com.fun.member.model.vo.Pay,com.fun.product.model.vo.Image" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	ArrayList<Pay> list1 = (ArrayList<Pay>)request.getAttribute("list1");
	ArrayList<Pay> list2 = (ArrayList<Pay>)request.getAttribute("list2");
	ArrayList<Pay> list3 = (ArrayList<Pay>)request.getAttribute("list3");
	ArrayList<Image> list = (ArrayList<Image>)request.getSession().getAttribute("list");
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
<title>배송 관리</title>
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

display: flex ;
        flex-wrap: nowrap ;
        padding-bottom: 1rem ;
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
.box1 {
    border: 1px solid lightgray;
    width: 75%;
    height: 22.5%;
    border-radius: 5px;
    margin-left: 190px;
    display : flex;
    align-content : center;
}

.del-table {
	line-height: 3;
}

.del-table td {
	text-align: center;
}

.del-table2 th, .del-table2 tr {
	text-align: center;
	border: 1px solid lightgray;
}

.fund-board {
	margin-left: 100px;
}

.del-table2 {
	line-height: 3;
	border: 1px solid gray;
}

.content-wrap {
	padding-top: 3%;
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
		<div id="mypage-content-wrap">


			<!-- 마이페이지 리스트 -->
			<div id="mypage-list">
				<br>
				<h2 style="font-weight: bold;">Seller Page</h2>
				<ul>
					<li><a href="<%= contextPath %>/IngProject"
						style="font-size: 24px; ">프로젝트 관리</a></li>
					<li><a href="/Fundable/views/seller/projectInf.jsp">프로젝트
							정보</a></li>
					<li><a href="<%=contextPath %>/rewardpro.pr">리워드 설계</a></li>
					<li><a href="/Fundable/views/seller/policy.jsp">정책</a></li>
				</ul>
				<ul>
					<li><a href="<%=contextPath%>/search.de1"
						style="font-size: 24px;color: black;">발송 관리</a></li>
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
			<div class="content-wrap">
				<br>
				<h2>
					<b>발송 관리</b>
				</h2>
				<div style="margin-left: 140px;  margin-top:30px;">
					<h4>서포터 관리</h4>
				</div>
				<br>
				<div class="box1" style="height:170px;">
					<table class="del-table"
						style="display: flex;  padding-top:20px; height:300px;">
						<tr>
							<td width="370" style="font-size: 20px; font-weight: bold;">배송
								상태</td>
							<td width="120"id="prepare">
								<a href="<%=contextPath%>/search.de1"style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727); cursor:pointer;">
								배송준비중</a></td>
							<td width="120" id="ing"
								style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727); cursor:pointer;">
								<a href="<%=contextPath%>/search.de2"style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727); cursor:pointer;">
								배송중</a></td>
							<td width="120" id="end"
								style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727); cursor:pointer;">
								<a href="<%=contextPath%>/search.de3"style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727); cursor:pointer;">
								배송완료</a></td>
						</tr>
						<tr>
							<td
								style="font-size: 17px; font-weight: bold; color: rgba(99, 99, 99, 0.727);">발송
								처리를 진행하세요</td>
							<td ><a href="<%=contextPath%>/search.de1"style="font-size: 20px; font-weight: bold;"><%=list1.size() %>건</a></td>
							<td ><a href="<%=contextPath%>/search.de2"style="font-size: 20px; font-weight: bold;"><%=list2.size() %>건</a></td>
							<td ><a href="<%=contextPath%>/search.de3"style="font-size: 20px; font-weight: bold;"><%=list3.size() %>건</a></td>
						</tr>
					</table>
				</div>
				<br> <br>
				<div class="fund-board" style="margin-left:-20px;">
					<h4>
						목록 <span style="font-size: 15px;">총</span><span
							style="font-size: 18px; color: rgba(99, 99, 99, 0.727);"><%=list3.size() %></span><span
							style="font-size: 15px;">명</span>
					</h4>
					<table align="center" class="del-table2" id="d-table">
						<tr
							style="border-top: 3px solid black; border-bottom: 2px solid black;">
							<th width="100">주문 번호</th>
							<th width="320">상풍명</th>
							<th width="120">서포터 정보</th>
							<th width="120">펀딩 금액</th>
							<th width="100">결제 상태</th>
							<th width="150">주문 일자</th>
							<th width="250">배송지 주소</th>
							<th width="100">배송 상태</th>
						</tr>
						<%
							if (list3.isEmpty()) {
						%>
						<!-- 리스트가 비어있을 경우 -->
						<tr>
							<td colspan="5">존재하는 목록이 없습니다</td>
						</tr>
						<%
							} else {
						%>

						<%
							for (Pay n : list3) {
						%>
						<tr id="print">
							<td id="print1"><%=n.getProductNo()%></td>
							<td id="print8"><%=n.getProductTitle()%></td>
							<td id="print2"><%=n.getUserName()%></td>
							<td id="print3"><%=n.getTotalPrice() %></td>
							<td id="print4"><%=n.getrStatus()%></td>
							<td id="print5"><%=n.getFundingDate()%></td>
							<td id="print6"><%=n.getUserAddress()%></td>
							<td id="print7"><%=n.getdStatus() %></td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
					</table>
					<div name="margin" style="width:100%;height:100px;"></div>
				</div>
			</div>
		</div>
		<script>
	
</script>
</body>

</html>