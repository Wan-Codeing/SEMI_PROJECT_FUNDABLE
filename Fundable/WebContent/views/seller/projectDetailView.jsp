<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.fun.product.model.vo.Product, java.text.DecimalFormat,
			com.fun.product.model.vo.Image,java.util.ArrayList"%>
	<% Product p = (Product)request.getAttribute("p"); 
	ArrayList<Image> list = (ArrayList<Image>)request.getSession().getAttribute("list");
	Image profile = (Image) request.getSession().getAttribute("profile");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>프로젝트 상세 현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/headers/">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">



<style>
@import
	url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css')
	;

* {
	box-sizing: border-box;
	margin: 0;
	font-family: "Pretendard";
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
	color: blue;
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
.project-now {
	text-align: left;
}

.project-now {
   width: 1000px;
   height: 200px;
}

.project-now td {
	color: #9b9a9a;
}

.rev1>td {
	font-size: 17px;
}

.rev2>td {
	font-size: 22px;
}

.rev3>td {
	font-size: 13px;
	color: aquamarine
}

.revbox1 {
	border: 1px solid lightgray;
	border-radius: 10px;
	height: 170px;
	display : flex;
	align-items : center;
	text-align : center;
	margin-right : 15px;
	
}

.revbox2 {
	border: 1px solid lightgray;
	border-radius: 10px;
	height: 170px;
	display : flex;
	align-items : center;
	text-align : center;
	margin-right : 15px;
}

.revbox3 {
	border: 1px solid lightgray;
	border-radius: 10px;
	height: 170px;
	display : flex;
	align-items : center;
	text-align : center;
}

.revbox1>table {
	line-height: 2;
	width: 250px;
	margin-left: 10px;;
	font-weight: bold;
}

.revbox2>table {
	width: 250px;
	line-height: 2;
	margin-left: 10px;
	font-weight: bold;
}

.revbox3>table {
	width: 250px;
	line-height: 2;
	margin-left: 10px;
	font-weight: bold;
}

.content_wrap {
	padding-top: 3%;
	padding-left:10%;
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
						style="font-size: 24px; color: black;">프로젝트 관리</a></li>
					<li><a href="/Fundable/views/seller/projectInf.jsp">프로젝트
							정보</a></li>
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
			<div class="content_wrap">
				<br>
				<h3>프로젝트 현황</h3>
				<br>
				<div>
					<h5>기본정보</h5>
					<table aling="right" class="project-now">
						<tr>
							<td width="1">프로젝트명 :<%=p.getpTitle() %></td>
						</tr>
						<tr>
							<td>프로젝트 번호 : <%=p.getProductNo() %></td>
						</tr>
						<tr>
							<td>카테고리 : <% String category = "";
							switch(p.getCategoryNo()) {
								case 1 : category = "테크 · 가전"; break;
								case 2 : category = "패션 · 잡화"; break;
								case 3 : category = "홈 · 리빙"; break;
								case 4 : category = "뷰티"; break;
								case 5 : category = "푸드"; break;
								case 6 : category = "스포츠"; break;
							};
							%>
							
							<%=category%></td>
						</tr>
						<tr>
							<td>펀딩 목표 금액 :<% DecimalFormat decFormat = new DecimalFormat("###,###");
							String str  = decFormat.format(p.getFundPrice());
							%> <%=str %>만원</td>
						</tr>
						<%int Dday = (int)(p.getEndDate().getTime() - p.getSysdate().getTime())/(24*60*60*1000); %>
						<tr>
							<td width="190"><input type="date" name="date" readonly value="<%=p.getEndDate()%>">에
								마감 <span style="color: #a7a7a7;">(<%=Math.abs(Dday)%> 일 남음)</span></td>
						</tr>
					</table>
				</div>
				<br>
				<h5>
					<b>펀딩 결제 예약 현황</b>
				</h5>
				<br>
				 <%double sum =(((double)((500-p.getCount())*p.getPrice())) / p.getFundPrice())  * 100;%>
				<div  style= "display: flex;">
					<div class="revbox1">
						<table >
							<tr class="rev1">
								<td>펀딩 결제 예약 금액</td>
							</tr>
							<tr class="rev2">
								<td><% 
                     				String str1  = decFormat.format((500-p.getCount())*p.getPrice());
                    				 %> <%=str1 %><span style="font-size: 15px;">원</span></td>
							</tr>
						</table>
					</div>
					<div class="revbox2">
						<table class="reserved-table">
							<tr class="rev1">
								<td>펀딩 달성률</td>
							</tr>
							<tr class="rev2">
								<td><%=sum %><span style="font-size: 15px;">%</span></td>
							</tr>
						</table>
					</div>
					<div class="revbox3">
						<table class="reserved-table">
							<tr class="rev1">
								<td>펀딩 건수</td>
							</tr>
							<%int result = (int)500 - (int)p.getCount(); %>
							<tr class="rev2">
								<td><%=result %><span style="font-size: 15px;">건</span></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
</body>
</html>