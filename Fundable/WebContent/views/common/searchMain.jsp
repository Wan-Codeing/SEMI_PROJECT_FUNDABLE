<%@ page
	import="java.util.ArrayList, com.fun.product.model.vo.Image, java.util.HashMap, com.fun.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<link rel="stylesheet" href="views/css/wadiz_main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- aos -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
/* slick 버튼 css */
* {
	font-family: "Pretendard";
	text-decoration: none;
	box-sizing: border-box;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.slick-prev, .slick-next {
	font-size: 20px;
	line-height: 1;
	opacity: .75;
	color: #3cabeb;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.slick-prev {
	left: 10px;
}

.slick-next {
	right: 10px;
}

.slick-dots {
	display: flex;
	justify-content: center;
	margin: 0;
	padding: 1rem 0;
	list-style-type: none;
	top: 300px;
	left: 600px;
}

.slick-dots button {
	cursor: pointer;
}

.slick-arrow {
	background: #9e9e9e61;
	width: 40px;
	height: 40px;
	border: 0;
	border-radius: 30px;
	text-align: center;
	margin: 0 auto;
	vertical-align: middle;
	line-height: 0px;
	top: 45%;
	position: absolute;
	bottom: 20px;
	cursor: pointer;
	font-size: 0;
	z-index: 1;
}

.Recommendation_text>a {
	text-decoration: none;
	color: black;
}

.Recommendation_text>a:hover {
	text-decoration: none;
}

.Ranking_Text>a {
	text-decoration: none;
	color: black;
}

.Ranking_Text>a:hover {
	text-decoration: none;
}

.Open_slide_img a {
	text-decoration: none;
	color: black;
}

.Open_slide_img a:hover {
	text-decoration: none !important;
}

.Funding_slide_img a {
	text-decoration: none;
	color: black;
}

.Funding_slide_img a:hover {
	text-decoration: none;
}

.Recommendation_cardListGroup {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	height: 100%;
	padding: 50px 300px 0;
}

.Recommendation_card {
	width: calc(100%/ 3);
}
</style>
</head>
<body style="height: 100%;">

	<%@ include file="헤더.jsp"%>
	<script>
	 	AOS.init();
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	<div id="body">
		<div class="MainWrapper_content">
			<div class="VisualBanner_container">
				<div class="main_slider">
					<div class="main_slider_img">
						<img
							src="https://cdn1.wadiz.kr/images/20230713/1689217053727.jpg/wadiz/optimize">
					</div>
					<div class="main_slider_img">
						<img
							src="https://cdn1.wadiz.kr/images/20230718/1689661773490.png/wadiz/optimize">
					</div>
					<div class="main_slider_img">
						<img
							src="https://cdn.wadiz.kr/ft/images/green001/2023/0719/20230719105849511_7656.png/wadiz/resize/2000/format/jpg/quality/85/">
					</div>
					<div class="main_slider_img">
						<img
							src="https://cdn.wadiz.kr/ft/images/green001/2023/0717/20230717174837464_7555.jpg/wadiz/resize/2000/format/jpg/quality/85/">
					</div>
					<div class="main_slider_img">
						<img
							src="https://cdn.wadiz.kr/ft/images/green001/2023/0713/20230713133817458_7506.jpg/wadiz/resize/2000/format/jpg/quality/85/
	                        ">
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
            var $abc = jQuery.noConflict();
                $abc(document).ready(function(){
                  $abc('.main_slider').slick({
                    // Slick configuration options
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2000,
                    // Add more options as needed
                  });
                });
              </script>
		<div class="product-content" style="position: relative;">
			<div class="Recommendation_cardListGroup" >
				<%
					for (Image i : list) {
				%>
				<div class="Recommendation_card" data-aos="fade-down"
					data-aos-anchor="top-top" data-aos-delay="250"
					style="height: 400px;">
					<a href="<%=contextPath%>/fsi.bo?productNo=<%=i.getProductNo()%>"><img
						src="<%=contextPath%>/<%=i.getFilePath()%><%=i.getChangeName()%>"
						alt="" style="width: 400px; height: 250px; border-radius: 10px;"></a>
					<div class="Recommendation_Progress">
						<div class="Recommendation_text">
							<a href="<%=contextPath%>/fsi.bo?productNo=<%=i.getProductNo()%>"><%=i.getProductTitle()%></a>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<script>
	 	AOS.init();
		const msg = "<%=(String) session.getAttribute("alertMsg")%>
			";

			if (msg != "null") {
				alert(msg);
		<% session.removeAttribute("alertMsg"); %>
		}
	</script>
		<%@ include file="챗봇2.jsp"%>
		<%@ include file="프터.jsp" %>
</body>
</html>