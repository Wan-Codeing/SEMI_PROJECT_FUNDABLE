<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="true"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.fun.product.model.vo.Image , com.fun.member.model.vo.Member , com.fun.product.model.vo.Product"%>
    <% 
    
		Image profileImg = (Image)session.getAttribute("profileImg");
		
    	ArrayList<Image> wishImg = (ArrayList<Image>)session.getAttribute("wishImg");
    	ArrayList<Product> wishP = (ArrayList<Product>)session.getAttribute("wishP");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">

    
    
    <!-- 찜하기 기능 링크-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- 찜하기 기능 링크-->


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
  @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
      *{
        box-sizing: border-box;
        margin: 0;
        font-family: "Pretendard";
      }
 
      /*============================================== 마이페이지 ==================================================*/

      body{
            margin: 0;
            box-sizing: border-box;
            width: clac(100vw - (100vw - 100%));
        }
        
  

      

        #mypagebanner{
            
            width: 85vw;
           height: 18vh;
           /* background-color: rgb(245, 245, 245); */
           
           display: flex;
           margin: auto;
       }

       #mypagebanner img{
           border-radius: 0.6vh;
       }

       #profile{
           width: 15vw;
           height: 100%;
           
       }

       #profile-image{
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          height: 18vh;
       }

       #profile-image img{
         width: 6vw;
         height: 12vh;
       }

       #myname{
           display: flex;
           justify-content: center;
           align-items: center;
           font-weight: bold;
           font-size: 1em;
       }

       #mypagebanner-product{
           width: 65vw;
           height: 100%;
           
       }

       #mypagebanner-product *{
           list-style: none;
           font-size: 1.2em;
           font-weight:bold;
           margin-bottom: 1.5vh;
       }

       #mypagebanner-product img{
           width: 6vw;
           height: 9vh;
       }

       #mypagebanner-product-list{
           display: flex;
           justify-content: space-around;
       }

       #mypagebanner-btn{
           width: 17vw;
           height: 100%;
           display: flex;
           flex-direction: column;
           align-items: end;
       }

       #seller-page-change{
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

       #mypage-logout{
           width: 6vw;
           height: 5vh;
           border-radius: 1vh;
           background-color: rgb(223, 224, 224);
           border: 1px solid rgb(86,86,86);
           font-size: 14px;
           font-weight: bold;
           color: rgb(104, 97, 97);
       }

       #mypagebanner-wrap{
         width: 100%;
         background-color: rgb(245, 245, 245);
         border: 1px solid rgb(215, 215, 215);
         margin-top: 10.7vh;
       }

        /*============================================================   마이페이지 배너 밑에 ==========================================*/
        #push-detail{
          margin: 4vh 7vw 1vh 0;
        }

        #mypage-list{
          width: 14vw;
          display: flex;
          flex-direction: column;
         /* background-color: red; */
         
        }

        #mypage-list ul,h4{
          list-style: none;
          padding-left: 0;
          margin-top: 1.5vw;
          font-weight: bold;
        }

        #mypage-list a{
          color: #9b9a9a;
        }
        
        #mypage-list a:hover{
          color: blue;
        }

        #mypage-list li,a{
          margin-top: 1.2vw;
          font-size: 15px;
          text-decoration: none;
          margin-left: 0.1vw;
          color: black;
        }

        #mypage-content-wrap{
          display: flex;
          width:85vw;
          margin: 0 auto 15vh;
        }

        #mypage-content{
          width: 71vw;
          
        }

        #fun-wrap{
          width: 100%;
          height: 7vh;
          display: flex;

        }

        #wl-history, #funding-history-btn,#wish-list-btn{
          background-color: rgb(245, 244, 244);
        }

       
        #wl-history{
          border-radius: 1vw;
          border-top-left-radius: 0%;
          width: 71vw;
          height: 116.3vh;
          border: 1px solid #d0cfcf;
        }

        #wish-list-btn{
          width: 6vw;
          height: 6.5vh;
          border: 1px solid #d0cfcf;
          border-top-left-radius: 1vw;
          border-top-right-radius: 1vw;
          text-align: center;
          padding-top: 0.5vw;
          margin-bottom: -0.1vw;
          margin-left: 0.6vw;
          border-bottom: none;
          font-weight: bold;
        }
        
        #funding-history-btn{
          width: 6vw;
          height: 5vh;
          border: 1px solid #d0cfcf;
          border-top-left-radius: 1vw;
          border-top-right-radius: 1vw;
          margin-left: -0.1vw;
        margin-bottom: -0.1vw;
         
          text-align: center;
          padding-top: 1vh;
          border-bottom: none;
          font-weight: bold;
        }
        
        #ha{
          margin-top: 0;
          display: flex;
          align-items: end;
        }
        #ha:hover{
          color: black;
        }


        #wl-history table{
          text-align: center;
        }

        #wl-history .card img{
            height: 20vh;
        }

        #bs-wrap{
            width: 90%;
            margin: 5vh auto;
        }

        #wl-history a{
            margin: 0;
        }

        #mypage-content-wrap .card:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
        }
        #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
        }
        
        /*===================================== 찜하기 / 알림신청 ========================================*/
        #mypage-content-wrap .col{
            position: relative;
            
        }

    /*=======================================찜하기 스타일===========================*/
        #mypage-content-wrap .btn1{
        position: absolute;
        top: 10%;
        left: 90%;
        transform: translate(-50%, -50%);
        padding: 0;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        
    }
    /*=======================================알림신청 스타일===========================*/

        #mypage-content-wrap .btn2{
        position: absolute;
        top: 10%;
        left: 10%;
        transform: translate(-50%, -50%);
        padding: 0;
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        
        }
       /*===================================== 찜하기 / 알림신청 끝 ========================================*/





       /*======================================== 클릭시 퍼지는 효과 =======================================*/
       @keyframes materialRipple {
    0% {
        transform: translate(-50%, -50%) scale(1)
    }

    100% {
        transform: translate(-50%, -50%) scale(var(--material-scale));
        opacity: 0
    }
}

.material-ripple {
    position: relative;
    overflow: hidden;
  
    /* Additional */
    display: inline-block;
    /* padding: 10px 20px; */
    color: #000000;
    text-decoration: none;
    -webkit-tap-highlight-color: transparent
}

.material-ripple .animate {
    width: 2px;
    height: 2px;
    position: absolute;
    border-radius: 50%;
    animation: materialRipple 0.5s linear
}

/* Additional */
@font-face{font-family:DungGeunMo;src:url(https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff) format('woff');font-weight:400;font-style:normal}

/*======================================== 클릭시 퍼지는 효과 =======================================*/
	#ha{
			color:black;
		}
		a{
			text-decoration:none !important;
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

    
    
  </head>
  <body>
    

<%@ include file="/views/common/헤더.jsp" %>



<!-- 배너 부분 -->
<div id="mypagebanner-wrap">
    <div id="mypagebanner">
  
      <div id="profile">
  
          <% if(profileImg.getChangeName() != null){ %>
        <div id="profile-image"><img src="<%= contextPath %>/<%= profileImg.getFilePath() + profileImg.getChangeName()%>" >
		<%} else{%>
        <div id="profile-image"><img src="https://www.thechooeok.com/common/img/default_profile.png" >
        <%} %>
            <div id="myname"><span><%= loginUser.getUserName()%>님</span></div>
            </div>
          </div>
  
          <div id="mypagebanner-product">
  
              <div style="padding-left: 6.5%; margin-top: 1.5%;">최근 본 상품</div>
              <ul id="mypagebanner-product-list">
                
                    <li>
                    <a href="<%=contextPath%>/fsi.bo?productNo=27"><img src="views/img/뷰티27.jpg" alt="" ></a>
                 </li>

                 <li>
                    <a href="<%=contextPath%>/fsi.bo?productNo=4"><img src="views/img/테크4.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href="<%=contextPath%>/fsi.bo?productNo=42"><img src="views/img/스포츠42.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href=" <%=contextPath%>/fsi.bo?productNo=17"><img src="views/img/홈17.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href="<%=contextPath%>/fsi.bo?productNo=10"><img src=views/img/패션10.jpg alt="" ></a>
                 </li>
  
               </ul>
  
          </div>     
  
          <div id="mypagebanner-btn">
  
               <form action="<%= contextPath %>/IngProject" method="get"><input type="submit" name="" id="seller-page-change" class="btn btn-outline-secondary"  value="셀러페이지 전환"></form>
  
          </div>
  
  </div>
  </div>
<!-- 배너 부분  끝 -->

<!-- 알림내역 -->
<div align="right" id="push-detail">
  
  <button type="button" class="btn btn-outline-secondary " style="visibility:hidden;">
    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
      <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
    </svg>&nbsp;
    알림 내역</button>

</div>
<!-- 알림내역 끝-->


<!-- 마이페이지 컨텐츠부분 감싸는 div-->
<div id="mypage-content-wrap">


<!-- 마이페이지 리스트 -->
<div id="mypage-list">
  
  <h2 style="font-weight: bold;">My Page</h2>
  <ul><h4>펀딩정보</h4>
    <li><a href="<%= contextPath %>/myPage.me" >펀딩 내역</a></li>
    <li><a href="#" style="color: blue;">찜한 내역</a></li>
    <li><a href="<%= contextPath%>/delivery.me">배송 조회</a></li>
  </ul>
  <ul><h4>개인정보</h4>
    <li><a href="<%= contextPath %>/check.me">기본 정보 설정</a></li>
    <li><a href="<%= contextPath %>/address.me">주소지 설정</a></li>
  </ul>
  <ul><h4>문의정보</h4>
    <li><a href="<%= contextPath%>/qa.me">문의 내역</a></li>
  </ul>

</div>
<!-- 마이페이지 리스트 끝 -->

<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content">

  <!-- 찜한내역 상단 랩-->
  <div id="fun-wrap">
      <a href="<%= contextPath %>/myPage.me" id="ha"><div id="funding-history-btn">펀딩 내역</div></a>
      <a href="" id="ha"><div id="wish-list-btn" >찜한 내역 <br> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
        <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
      </svg></div></a>
    
  </div>
  <!-- 찜한내역 상단 랩끝-->

  <!-- 찜한내역 컨텐츠부분-->
  <div id="wl-history">

    <div id="bs-wrap">

    <div class="row row-cols-1 row-cols-md-3 g-5">
			<%if(wishP.size() != 0){ %>
	  	<% for(int i = 0; i < wishP.size(); i++){ %> 
        <div class="col" >
          <div class="card material-ripple" data-color="cfcfcf9e"> <!-- 클릭시 퍼지는 효과먹이려면 클래스명에  class="card material-ripple" data-color="cfcfcf9e" 추가-->
            <img src="<%= contextPath %>/<%= wishImg.get(i).getFilePath() + wishImg.get(i).getChangeName() %>" class="card-img-top" alt="..." onclick="location.href='<%=contextPath %>/fsi.bo?productNo=<%= wishP.get(i).getProductNo()%>'">
            
            
            
            <!-- 찜하기 버튼 -->
            <button onclick="wish(<%= wishP.get(i).getProductNo() %>);"  class="btn1"  style="background-color: rgba(0, 0, 0, .0); z-index: 50;">
                <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor"   color="rgba(255,0,0, .85)" class="bi bi-heart-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                  </svg>
            </button>
            <!-- 찜하기 버튼 -->
			
			
           

		
            <div class="card-body">
              <h5 class="card-title"><%= wishP.get(i).getSellerNickName() %></h5>
              <p class="card-text"><%= wishP.get(i).getpTitle().substring(0,20) %>...</p>
            </div>
          </div>
        </div>

		<%}}else{ %>
		<div style="width:100%; margin-top:15vh;" align="center">찜한 상품이 없습니다.</div>
					
       <%} %>
          


      </div>

      
    </div>


      
    

  </div>
   <!-- 찜한내역 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->





<%@ include file="/views/common/프터.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
var $jh = jQuery.noConflict();
// ============================= 찜하기 색상변화 스크립트 ===============================
  $jh(function(){
    // $("#wl-history .btn1").click(function(){
    //     let col = $(this).children().attr("color");
        
    //     if(col == "rgba(255,0,0, .85)"){
    //         $(this).children().attr("color","rgba(0, 0, 0, .5)");
    //     }else if(col == "rgba(0, 0, 0, .5)"){
    //         $(this).children().attr("color","rgba(255,0,0, .85)");
    //     }
    // });

    $jh(function(){
    $jh("#wl-history .btn1").click(function(){
        let col = $jh(this).children().attr("color");
        
        if(col == "rgba(255,0,0, .85)"){
            $jh(this).children().attr("color","rgba(136, 137, 143, 0.4)");
        }else {
            $jh(this).children().attr("color","rgba(255,0,0, .85)");
        }
    });
  });
    
    // ============================= 찜하기 색상변화 스크립트 ===============================
    

    // ============================== 알림신청 색상변화 스크립트 =============================
    $jh("#wl-history .btn2").click(function(){
        
        let col = $jh(this).children().attr("color");
        if(col == "rgba(136, 137, 143, 0.4)"){
            $jh(this).children().attr("color","rgba(110, 125, 209)");
        }else{
            $jh(this).children().attr("color","rgba(136, 137, 143, 0.4)");
        }

        
    });
});
 // ============================== 알림신청 색상변화 스크립트 =============================


/*======================================== 클릭시 퍼지는 효과 =======================================*/
Array.from(document.querySelectorAll(".material-ripple")).forEach(a => {
    a.addEventListener("click", function (e) {
        const ripple = document.createElement("div"),
            rect = a.getBoundingClientRect();
        ripple.className = "animate",
        ripple.style.left = `${e.x - rect.left}px`,
        ripple.style.top = `${e.y - rect.top}px`,
        ripple.style.background = `#${a.dataset.color !== undefined ? a.dataset.color : "bdc3c7"}`,
        ripple.style.setProperty("--material-scale", a.offsetWidth),
        a.append(ripple),
        setTimeout(function () {
            ripple.parentNode.removeChild(ripple)
        }, 500)
    })
})
/*======================================== 클릭시 퍼지는 효과 =======================================*/
 
 
 
 
 function wish(e){
		
		$jh.ajax({
				
			url : "<%= contextPath%>/wish.me",
			data : { userNo : <%= loginUser.getUserNo() %>,
					 productNo : e
			},
			type : "post",
			success : function(result){
					
				console.log(result);
				
				}
				
			
			
			
		});
 }
	
</script>

</body>
</html>