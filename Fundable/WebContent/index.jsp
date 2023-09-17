<%@ page import="java.util.ArrayList, com.fun.product.model.vo.Image, java.util.HashMap, com.fun.product.model.vo.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Image> list1 = (ArrayList<Image>)request.getAttribute("list1");	
	ArrayList<Image> list2 = (ArrayList<Image>)request.getAttribute("list2");	
	ArrayList<Image> list3 = (ArrayList<Image>)request.getAttribute("list3");	
	ArrayList<Image> list4 = (ArrayList<Image>)request.getAttribute("list4");	
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("plist");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css"/>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
 	<link rel="stylesheet" href="views/css/wadiz_main.css">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 	<!-- aos -->
 	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
 <style>
/* slick 버튼 css */
 *{
    font-family: "Pretendard";
    text-decoration: none;
    box-sizing: border-box;
    list-style-type: none;
    padding: 0;
    margin: 0;
 }
.slick-prev, .slick-next{
    font-size: 20px;
    line-height: 1;
    opacity: .75;
    color: #3cabeb;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.slick-prev{
   left: 10px;
}
.slick-next{
    right: 10px;
}

.slick-dots {
    display: flex;
    justify-content: center;    
    margin: 0;
    padding: 1rem 0;    
    list-style-type: none;  
    top: 300px ;
    left:600px ;
}
.slick-dots button {
    cursor: pointer;
}
.slick-arrow{    
    background:  #9e9e9e61;
    
    width:40px;
    height:40px;
    border: 0;
    border-radius:30px;    
    text-align:center;
    margin:0 auto;
    vertical-align:middle;
    line-height:0px;  
    top:45%; 
    position: absolute;
    bottom: 20px;
    cursor: pointer;
    font-size: 0; 
    z-index: 1;  
} 
.Recommendation_text>a{
	text-decoration: none;
	color: black;
}
.Recommendation_text>a:hover{
	text-decoration: none;
}
.Ranking_Text>a{
	text-decoration: none;
	color: black;
}
.Ranking_Text>a:hover{
	text-decoration: none;
}
.Open_slide_img a{
	text-decoration: none;
	color: black;
}
.Open_slide_img a:hover{
	text-decoration: none !important;
}
.Funding_slide_img a{
	text-decoration: none;
	color: black;
}
.Funding_slide_img a:hover{
	text-decoration: none;
}
.Recommendation_card img{
	border-radius:10px;
}
.Open_Title img{
	border-radius:10px;
}
.Funding_Title img{
	border-radius:10px;
}
</style>
</head>
<body>

	<%@ include file="views/common/헤더.jsp" %>
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
	                        <img src = "https://cdn1.wadiz.kr/images/20230713/1689217053727.jpg/wadiz/optimize">
	                    </div>
	                     <div class="main_slider_img">
	                        <img src = "https://cdn1.wadiz.kr/images/20230718/1689661773490.png/wadiz/optimize">
	                    </div>
	                     <div class="main_slider_img">
	                        <img src = "https://cdn.wadiz.kr/ft/images/green001/2023/0719/20230719105849511_7656.png/wadiz/resize/2000/format/jpg/quality/85/">
	                    </div>
	                     <div class="main_slider_img">
	                        <img src = "https://cdn.wadiz.kr/ft/images/green001/2023/0717/20230717174837464_7555.jpg/wadiz/resize/2000/format/jpg/quality/85/">
	                    </div>
	                     <div class="main_slider_img">
	                        <img src = "https://cdn.wadiz.kr/ft/images/green001/2023/0713/20230713133817458_7506.jpg/wadiz/resize/2000/format/jpg/quality/85/
	                        ">
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
            <div class="Recommendation_container">
                <div class="main_wrap">
                    <div class="Recommendation_project">
                        <div class="Recommendation_subTitle ">
                            <a class="Recommendation_Title">취향 맞춤 프로젝트</a>
                            <p class="Recommendation_description>">지금 함께 만드는 성공</p>
                            <div class="Recommendation_cardListGroup">
                    	    <% 
                    	    		//랜덤난수생성(중복X)
                    	    		HashMap<Integer,Integer> rand = new HashMap<Integer,Integer>();
                    	    		ArrayList<Integer> list = new ArrayList();
                    	    		while(true){
                    	    			int randNum = (int)((Math.random()*47)+1);
								        rand.put(randNum, randNum);	            	    			
                    	    			if(rand.size()==6){
                    	    				break;
                    	    			}
                    	    		};
                    	    		for(int i = 0 ; i<49 ; i++){
                    	    			if(rand.containsKey(i)){
                    	    				list.add(i);
                    	    			}
                    	    		}
                    	    		int num1 = list.get(0);
                    	    		int num2 = list.get(1);
                    	    		int num3 = list.get(2);
                    	    		int num4 = list.get(3);
                    	    		int num5 = list.get(4);
                    	    		int num6 = list.get(5);
                    	    	
                        	    	Image pic1 =  list2.get(num1-1);
                        	    	Image pic2 =  list2.get(num2-1);
                        	    	Image pic3 =  list2.get(num3-1);
                        	    	Image pic4 =  list2.get(num4-1);
                        	    	Image pic5 =  list2.get(num5-1);
                        	    	Image pic6 =  list2.get(num6-1);
                        	    	
                    	    	%>
                    	    	<%double sum1 = (((double)pic1.getFundPrice() - (double)pic1.getPrice()*(double)pic1.getCount()) / (double)pic1.getFundPrice())  * 100;%>
                    	    	<%double sum2 = (((double)pic2.getFundPrice() - (double)pic2.getPrice()*(double)pic2.getCount()) / (double)pic2.getFundPrice())  * 100;%>
                    	    	<%double sum3 = (((double)pic3.getFundPrice() - (double)pic3.getPrice()*(double)pic3.getCount()) / (double)pic3.getFundPrice())  * 100;%>
                    	    	<%double sum4 = (((double)pic4.getFundPrice() - (double)pic4.getPrice()*(double)pic4.getCount()) / (double)pic4.getFundPrice())  * 100;%>
                    	    	<%double sum5 = (((double)pic5.getFundPrice() - (double)pic5.getPrice()*(double)pic5.getCount()) / (double)pic5.getFundPrice())  * 100;%>
                    	    	<%double sum6 = (((double)pic6.getFundPrice() - (double)pic6.getPrice()*(double)pic6.getCount()) / (double)pic6.getFundPrice())  * 100;%>
				                    <div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic1.getProductNo()%>"><img style="width:200px; height:150px;" src="<%=pic1.getFilePath() %><%=pic1.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic1.getProductNo()%>"><%=pic1.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum1 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
	                               	<div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic2.getProductNo()%>"><img style="width:200px; height:150px;" src ="<%=pic2.getFilePath() %><%=pic2.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic2.getProductNo()%>"><%=pic2.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum2 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
	                               	<div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic3.getProductNo()%>"><img style="width:200px; height:150px;" src ="<%=pic3.getFilePath() %><%=pic3.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic3.getProductNo()%>"><%=pic3.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum3 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
	                               	<div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic4.getProductNo()%>"><img style="width:200px; height:150px;" src ="<%=pic4.getFilePath() %><%=pic4.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic4.getProductNo()%>"><%=pic4.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum4 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
	                               	<div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic5.getProductNo()%>"><img style="width:200px; height:150px;" src ="<%=pic5.getFilePath() %><%=pic5.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic5.getProductNo()%>"><%=pic5.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum5 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
	                               	<div class="Recommendation_card" data-aos="fade-up" data-aos-anchor="top-top" data-aos-delay="250">
	                                   	<a href="<%=contextPath%>/fsi.bo?productNo=<%=pic6.getProductNo()%>"><img style="width:200px; height:150px;" src ="<%=pic6.getFilePath() %><%=pic6.getChangeName()%>"></a>
	                                    <div class="Recommendation_Progress">
	                                        <div class="Recommendation_text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pic6.getProductNo()%>"><%=pic6.getProductTitle() %></a>
	                                        </div>
	                                            <a class style="font-size:14px;"><b><%=sum6 %>%</b></a>
	                                        <div class="Recommendation_Num">
	                                        </div>
	                                    </div>    
	                               	</div>
                    
                            </div>
                        </div>
                    </div>
                    <div class="Ranking">
                            <h2 class="Rangking_Title">실시간 랭킹</h2>
                            <div class="Ranking_Article">
                            <%double psum1 = (((double)pList.get(0).getFundPrice() - (double)pList.get(0).getPrice()*(double)pList.get(0).getCount()) / (double)pList.get(0).getFundPrice())  * 100;%>
                    	    <%double psum2 = (((double)pList.get(1).getFundPrice() - (double)pList.get(1).getPrice()*(double)pList.get(1).getCount()) / (double)pList.get(1).getFundPrice())  * 100;%>
                    	    <%double psum3 = (((double)pList.get(2).getFundPrice() - (double)pList.get(2).getPrice()*(double)pList.get(2).getCount()) / (double)pList.get(2).getFundPrice())  * 100;%>
                    	    <%double psum4 = (((double)pList.get(3).getFundPrice() - (double)pList.get(3).getPrice()*(double)pList.get(3).getCount()) / (double)pList.get(3).getFundPrice())  * 100;%>
                    	    <%double psum5 = (((double)pList.get(4).getFundPrice() - (double)pList.get(4).getPrice()*(double)pList.get(4).getCount()) / (double)pList.get(4).getFundPrice())  * 100;%>
                    	    <%double psum6 = (((double)pList.get(5).getFundPrice() - (double)pList.get(5).getPrice()*(double)pList.get(5).getCount()) / (double)pList.get(5).getFundPrice())  * 100;%>
	                            	<div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
	                                    <a class="num">1위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(0).getProductNo()%>"><%=pList.get(0).getpTitle() %></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum1%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="450">
	                                    <a class="num">2위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(1).getProductNo()%>"><%=pList.get(1).getpTitle() %></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum2%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="650">
	                                    <a class="num">3위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(2).getProductNo()%>"><%=pList.get(2).getpTitle() %></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum3%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="850">
	                                    <a class="num">4위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(3).getProductNo()%>"><%=pList.get(3).getpTitle() %></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum4%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="1050">
	                                    <a class="num">5위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(4).getProductNo()%>"><%=pList.get(4).getpTitle()%></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum5%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="1250">
	                                    <a class="num">6위</a>
	                                    <div class="Ranking_Title">
	                                        <div class="Ranking_Text">
	                                            <a href="<%=contextPath%>/fsi.bo?productNo=<%=pList.get(5).getProductNo()%>"><%=pList.get(5).getpTitle() %></a>
	                                            <p class="Ranking_Num" style="font-size:14px;"><b><%=psum6%>%</b></p>
	                                        </div>
	                                    </div>
	                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 오픈예정 -->
            <div class="Open_container">
                <div class="main_wrap">
                    <div class="Open_header">
                        <h2>오픈예정중인 프로젝트</h2>
                        <p>오픈예정중인 프로젝트</p>
                    </div>
                    <div class="Open_content">
                        <div class="Open_slider">
                            <div class="Open_slide_img">
                            <%for( Image img : list3){%>
                                <div class="Open_Title" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
                                    <a href="<%=contextPath%>/fsi.bo?productNo=<%=img.getProductNo()%>"><img src="<%=img.getFilePath() %><%=img.getChangeName()%>"></a>
                                </div>
                               	<div style="margin-left:-250px; margin-top:250px;" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
                               		<a href="<%=contextPath%>/fsi.bo?productNo=<%=img.getProductNo()%>"><%=img.getProductTitle() %></a>
                               </div>
                   			<%} %>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
            var $bbc = jQuery.noConflict();
                    $bbc(document).ready(function(){
                        $bbc('.Open_slide_img').slick({
                        infinite: true,
                        speed: 300,
                        slidesToShow: 5,
                        slidesToScroll: 5,
                
                        });})
                  </script>

              <!-- 펀딩 -->
            <div class="Funding_container">
                    <div class="main_wrap">
                        <div class="Funding_header">
                            <h2>펀딩중인 프로젝트</h2>
                            <p>펀딩중인 프로젝트</p>
                        </div>
                        <div class="Funding_content">
                            <div class="Funding_slider">
                                <div class="Funding_slide_img">
                                	<%for(Image img : list4){ %>
		                                <div class="Funding_Title" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
		                                    <a href="<%=contextPath%>/fsi.bo?productNo=<%=img.getProductNo()%>"><img src="<%=img.getFilePath() %><%=img.getChangeName()%>"></a>
		                                </div>
		                               	<div style="margin-left:-250px; margin-top:250px;" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
		                               		<a href="<%=contextPath%>/fsi.bo?productNo=<%=img.getProductNo()%>"><%=img.getProductTitle() %></a>
		                               	</div>
                   					<%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                var $bcb = jQuery.noConflict();
                    $bcb(document).ready(function(){
                        $bcb('.Funding_slide_img').slick({
                        infinite: true,
                        speed: 300,
                        slidesToShow: 5,
                        slidesToScroll: 5,
                        });})
                  </script>
            <!-- 배너-->
            <div class="banner_container">
                <div class="banner_wrap">
                    <div class="banner_content">
                        <div class="banner_text">
                            <h4>FUNDABLE에서 지금 바로 프로젝트를 시작하세요</h4>
                            <p>이미 많은 메이커가 FUNDABLE을 경험했어요</p>
                            <button class="ban_btn" style="border-radius:10px;" onclick="moveProject()">
                                <p style="line-height:3;">프로젝트 만들기</p>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
            	function moveProject(){
            		 <% if(loginUser == null){ %>
            		 	location.href="<%=contextPath%>/views/member/login.jsp";
            		 <%} else{%>
            		 	location.href="<%=contextPath%>/IngProject";
            		 <%} %>
            	}
            </script>
	<%@ include file="챗봇.jsp" %>
 	<%@ include file="views/common/프터.jsp" %>
</body>
</html>