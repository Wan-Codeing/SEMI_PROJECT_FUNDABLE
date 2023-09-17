<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList,com.fun.product.model.vo.Image" %>

   <%
   ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
   %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>펀딩</title>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <link rel="stylesheet" href="views/css/wadiz_main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<style>
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

   .imagetextboxc{
      
      height: 322px;
   }
    .footer-table{
        font-size: 12px;
      }
    /* 헤더 css 
    .nav-logo{
          width: 140px;
          height: 30px;
        }
        .container-fluid{
          background-color: white;
        }
        .login{
          display:one;
        }
        .logout{
          display:none;
        }
        .notice-bell{
          margin-left: -30px;
          line-height: 2;
        }*/

/* slick 버튼 css */
.slick-prev, .slick-next{
    font-size: 20px;
    line-height: 1;
    opacity: .75;
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
    height:50px;
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
/* slick()끝 */

    *{
        margin: 0;
        border: 0;
        padding: 0;
        box-sizing: border-box;
       
        font-family: "Pretendard";
    }
    ul,li{
        list-style: none;
    }
.main{
    width: 80%;
    margin: auto;
    
}



.show-kind{
   width: 100%;
   display: flex;
   justify-content: left;
}

.kind-ul>li>div>button{
    background-color: lightgray;
    cursor: pointer;
}

.category-img>button>img{
    width: 32px;
    height: 32px;
}
.kind-ul{
    background-color: #fff;
    float: left;
    text-align: center;
}
.kind-ul>li{
    display: inline-block;
    text-align: center;
    width: 180px;
}

.product-content{
    width: 100%;
}

.hv:hover{
   transform: scale(1.1);

}
   .imagetextboxc{
      overflow: hidden;
      height: 322px;
   }

.product-open-alert-button>button{
    border: 1px solid mediumaquamarine;
    color: mediumaquamarine;
}
.page{
    width: 33%;
    height: 800px;
}
.product-content{
    width: 100%;
}
.product-content>table{
    display: flex;
    justify-content: center;
}
.product {
       display: inline-block;
            width: 33%;
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
}
.product img {
         width: 420px;
         height: 250px;
    object-fit: cover;
}
.VisualBanner_container{
    width :  calc(100vw - (100vw - 100%));
    height : 40vh;
      }   
.main_slider{
    width:100%;
    height:100%;
        }
.main_slider_img img{
    width: 100%;
    height: 374px;
        }
        #fund{
	color: #00b2b2 !important;
	font-weight:bolder !important;
}
</style>
<body>
    <!-- 헤더 -->
     <%@ include file="/views/common/헤더.jsp" %>

<script>
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>

  <!-- 슬라이드 -->
<div class="slider">
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
         var $jqq = jQuery.noConflict();
        $jqq(document).ready(function(){
          $jqq('.main_slider').slick({
            // Slick configuration options
                    slide: 'div',
                    infinite : true,
                    dots : true,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    speed : 500 ,
                    autoplay: true,
                    autoplaySpeed: 1000,
                    prevArrow : "<button type='button' class='slick-prev'>&lt;</button>",   
                    nextArrow : "<button type='button' class='slick-next'>Next</button>" 
            // Add more options as needed
          });
        });
      </script>
</div>
<!-- 메인 -->
<div class="main">
<div class="show-kind">


    <!-- 카테고리 -->
<ul class="kind-ul" style="margin-top : 10px;">

<li data-category="all"><div class="category-img"><button id="ball" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/all.png" style="pointer-events:none" alt=""></button><div>전체</div></div></li>
<li data-category="best-funding"><div class="category-img"><button id="bbest" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/BEST 펀딩.png" alt=""></button><div>BEST 펀딩</div></div></li>
<li data-category="tech"><div class="category-img"><button id="btech" onclick="showContent(this)" ><img src="<%=contextPath %>/views/img/category_tech.png" alt=""></button><div>테크/가전</div></div></li>
<li data-category="fashion"><div class="category-img"><button id="bfashion" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/category_fashion.png" alt=""></button><div>패션/잡화</div></div></li>
<li data-category="living"><div class="category-img"><button id="bliving" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/category_living.png" alt=""></button><div>홈/리빙</div></div></li>
<li data-category="beauty"><div class="category-img"><button id="bbeauty" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/category-beauty.png" alt=""></button><div>뷰티</div></div></li>
<li data-category="food"><div class="category-img"><button id="bfood" onclick="showContent(this)"><img src="<%=contextPath %>/views/img/category_food.png" alt=""></button><div>푸드</div></div></li>
<li data-category="sports"><div class="category-img"><button id="bsports" onclick="showContent(this)" ><img src="<%=contextPath %>/views/img/category_sport.png"></button><div>스포츠</div></div></li>

</ul>
</div> 

<!-- 상품진열 -->

<div class="main-content">
<div class="category-content">
<p class="main-contentname" style="font-size: 30px; font: bold;" >전체</p>
<span style="font-size:20px; margin-left:30px;">펀딩 중인 프로젝트</span>
</div>

<div class="product-content">
   
    <table>
           <tr class="33">
           
    <%for(Image i : list){ %>
      <%if(i.getStatus().equals("Y")) {%>
  		<%if(loginUser != null){ %>
        <form action="<%=contextPath %>/fsi.bo?" id="formac" >
          <input type="hidden" name="productNo" value="<%= i.getProductNo()%>">
         
          
            <td class="product ff<%= i.getUserNo() %>">
               <div class="imagetextboxc">
                  <button type="submit">
                     <img class="hv" style="border-radius:8px;" src="<%= contextPath%>/<%=i.getFilePath()%><%=i.getChangeName()%>" alt="" >
                  </button>
                  <div style="margin-top: 10px ; width:400px; text-align:center; margin:10px auto"><%= i.getProductTitle()%></div>
                 
               </div>
            </td>
       </form>
       <%}else{ %>
            <td class="product ff<%= i.getUserNo() %>">
               <div class="imagetextboxc">
                  <button type="button" onclick="goLogin()">
                     <img  class="hv" style="border-radius:8px;" src="<%= contextPath%>/<%=i.getFilePath()%><%=i.getChangeName()%>" alt="" >
                  </button>
                  <div style="margin-top: 10px ; width:400px; text-align:center; margin:10px auto"><%= i.getProductTitle()%></div>
                 
               </div>
            </td>
       <%} %>
        <%} }%>
           </tr>
    </table>
   

</div>
</div>
</div>

        <%@ include file="/views/common/챗봇.jsp" %>
        <%@ include file="/views/common/프터.jsp" %>
<!-- 카테고리 이름 -->
<script>
function goLogin(){
	alert("로그인을 해주세요");
	location.href="<%=contextPath%>/login.me";
}
$(function(){
    
    $("#btech").click(function(){
       
       
       
       $(".ff1").show();
       $(".ff2").hide();
       $(".ff3").hide();
       $(".ff4").hide();
       $(".ff5").hide();
       $(".ff6").hide();
       
    });
    
 $("#bfashion").click(function(){
       
       
       
       $(".ff1").hide();
       $(".ff2").show();
       $(".ff3").hide();
       $(".ff4").hide();
       $(".ff5").hide();
       $(".ff6").hide();
       
    });
    
$("#bliving").click(function(){
 
 
 
 $(".ff1").hide();
 $(".ff2").hide();
 $(".ff3").show();
 $(".ff4").hide();
 $(".ff5").hide();
 $(".ff6").hide();
 
});

$("#bbeauty").click(function(){
 
 
 
 $(".ff1").hide();
 $(".ff2").hide();
 $(".ff3").hide();
 $(".ff4").show();
 $(".ff5").hide();
 $(".ff6").hide();
 
});

$("#bfood").click(function(){
 
 
 
 $(".ff1").hide();
 $(".ff2").hide();
 $(".ff3").hide();
 $(".ff4").hide();
 $(".ff5").show();
 $(".ff6").hide();
 
});

$("#bsports").click(function(){
 
 
 
 $(".ff1").hide();
 $(".ff2").hide();
 $(".ff3").hide();
 $(".ff4").hide();
 $(".ff5").hide();
 $(".ff6").show();
 
});
    
    
 
 
 $("#bbest").click(function(){
    
    
    
    $(".ff1").show();
    $(".ff2").hide();
    $(".ff3").hide();
    $(".ff4").hide();
    $(".ff5").hide();
    $(".ff6").hide();
    
 });
       
       
    
    
    $("#ball").click(function(){
       
       
       
       $(".ff1").show();
       $(".ff2").show();
       $(".ff3").show();
       $(".ff4").show();
       $(".ff5").show();
       $(".ff6").show();
       
    });
          
          
       });
 
 
 
 
       function showContent(button) {
             
          var buttonText = button.nextElementSibling.textContent.trim();
          


            var mainContentName = document.querySelector('.main-contentname');
            mainContentName.textContent = buttonText;
          }

</script>



</body>


</html>