<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList,com.fun.product.model.vo.Image,com.fun.product.model.vo.Product
,com.fun.product.model.vo.Option,com.fun.member.model.vo.Seller,com.fun.product.model.vo.Category,java.time.LocalDate, com.fun.member.model.vo.Wishlist,java.text.DecimalFormat" %>  
  
    <%
    LocalDate localDate = LocalDate.now();
    String currentDate = localDate.toString();
    %>
    <%
    
    Image i = (Image)request.getAttribute("i");
    Product p = (Product)request.getAttribute("p");
      ArrayList<Option> po = (ArrayList<Option>)request.getAttribute("po");
    Category c = (Category)request.getAttribute("c");
    int productNo = (int)request.getAttribute("productNo");
    Wishlist wl = (Wishlist)request.getAttribute("wl");
    Image ii = (Image)request.getAttribute("ii");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 찜하기 기능 링크-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- 찜하기 기능 링크-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- 푸터  두줄 CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- CSS only  헤더 !-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <link href="views/css/펀딩상세페이지.css" rel="stylesheet" type="text/css">
   
   <!-- 결제API -->
    <!-- <script src="payAPI.js"></script> -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<style>
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
    /*  헤더 css 
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
        } */


    /* .footer-table{
        font-size: 12px;
      }
       */
      
     *{
        margin: 0;
        border: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        font-family: "Pretendard";
        border-radius: 8px;
       
    }
    .graybox{
        border: 1px solid #dde2e6;
    }
    .tabs{
    margin-bottom: 0;
    overflow-y: hidden;
    text-align: center;
    background-color: #fff;
    box-shadow: 0 1px rgba(0,0,0,.08);
    display: flex;
    justify-content: center;
    padding: 10px;
    margin-bottom: 30px;
    
    
    }
    .tabs-ul>li{
    display: inline-block;
    text-align: center;
    width: 180px;
}
.tabs-ul{
    background-color: #fff;
    float: left;
    text-align: center;
}
.main{
    display: flex;
    justify-content: center;
    height: max-content;
}
.detail-left,.detail-right{
    
    height: 1000px;
    text-align: center;
}
   .a2a_kit{
       display: none;
    }
.sharehover:hover{
	cursor:pointer;   
}


.detail-left{
    width: 40%;
    height: auto;
    
}
.detail-right{
    width: 35%;
    
    text-align: left;
    margin-left: 5%;
    height: auto;
}
.recommendation-container,.notice-banner-list-ul,.notice-banner-description,.story-container,.recommendation-container,
.recommendation-container-product,.funding-type,.baseinfo,.seller-profile-text,.benefit-container,.funding-div{
    margin-top: 25px;
}

.commoninfo-container{
    height: 6000px;
}
.thumbnail-slide-images {
      position: relative;
      width: 100%;
    }
    
    .slider {
      display: flex;
      overflow: hidden;
        
    }
    
    .slider>img {
      width: 100%;
      height: 100%;
      max-width: 800px;
      max-height: 400px;
      object-fit: cover;
     
    }
    
    .prev-button,
    .next-button {
      position: absolute;
      
      transform: translateY(-50%);
      padding: 10px;
      background-color: lightgray;
      border: none;
      cursor: pointer;
    }
    .button-container {
  position: relative;
}
    
    .prev-button {
      left: 0;
    }
    
    .next-button {
      right: 0;
    }
    .notice-banner{
        margin-top: 20px;
        background-color: rgb(240, 245, 250);
    }
    .notice-banner-list-ul{
        display: flex;
    }
    .notice-banner-list-ul>li>img{
        height: 100px; width: 100px;
        margin-left: 30px;
    }
    
    .category-header{
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #dde2e6;
        padding-bottom: 15px;
    }
    .basefunding-info{
        border-bottom: 1px solid #dde2e6;
        padding-bottom: 15px;
    }
    .funding{
        color: white;
        background-color: aqua;
        
    }
    .seller-profile-text{
    line-height: 20px;
    font-size: 14px;
    font-weight: 400;
    margin-top: 24px;
    display: flex;
    flex-direction: column;
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid #dde2e6;
    overflow: visible;
    }

    .sticky{
    height: 1000px;
    top: 48px;
    position: sticky;
    border-radius: 8px;
    padding-top: 24px;
    margin-top: 40px;
        
    }
    .option-select{
        scroll-margin: 3px;
        overflow-x: hidden;
        max-height: 800px;
        position: relative;
        
    }
    .option-select>div{
        margin-bottom: 15px;
        border-radius: 5px;
    }
    .grayline{
        border-bottom: 1px solid #cdd3d8;
        border-radius: 0;
    }
    .options>div{
        padding: 10px;
    }
    .options>div>div{
        padding: 10px;
    }

    .funding-div{

     justify-content: space-between;
     display: flex; 
     padding: 24px,0,0; 
     bottom: 0;
     position: relative;
     gap: 16px;
    }
    
    .funding,.bdr{
        border-radius: 8px;
    }
     /*===================================== 찜하기 / 알림신청 ========================================*/
        #mypage-content-wrap .col{
            position: relative;
            
        }

    /*=======================================찜하기 스타일===========================*/
        .btnh1{
        
       
        padding: 0;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        background-color:transparent;
        
    }
    
   
    
    
    
</style>
<body>
     <%@ include file="/views/common/헤더.jsp" %>

    <div class="all">
        <div class="tabs" style="border-top: 1px solid #cdd3d8;
        border-radius: 0;">

            <ul class="tabs-ul">

                <li data-index="0"><div><button></button>스토리</div></li>
                <li data-index="1"><div><button></button>새소식<b style="color: aqua;">4</b></div></li>
                <li data-index="2"><div><button></button>커뮤니티<b style="color: aqua;">6</b></div></li>
                <li data-index="3"><div><button></button>서포터<b style="color: aqua;">699</b></div></li>
                <li data-index="4"><div><button></button>환불,정책</div></li>
                
                </ul>

        </div>


        <div class="main">
            <div class="detail-left">
               
                <div class="thumbnail-slide-images">
                    <div class="slider">
                   
                      
               
                   <img src="<%=contextPath%>/<%= i.getFilePath()%><%=i.getChangeName() %>">
                     
                           
                        <img src="<%=contextPath %>/views/img/떡볶이2.gif" alt="Image 2">
                        <img src="<%=contextPath %>/views/img/떡볶이3.gif" alt="Image 3">
                      </div>
                      <div class="button-container">
                      <button class="prev-button" style="posision:absolute; top:-180px;">&lt;</button>
                      <button class="next-button" style="posision:absolute; top:-180px;">&gt;</button>
                     </div>
                
            </div>

            <div class="notice-banner">
                <div class="notice-banner-list">
                    <ul class="notice-banner-list-ul">
                        <li><img src="<%=contextPath %>/views/img/gift.png" alt=""></li>
                        <li><img src="<%=contextPath %>/views/img/환불이미지.png" alt=""></li>
                        
                    </ul>
                </div>
                <div class="notice-banner-description" style="color: black;">
                와디즈 펀딩은 단순히 구매하는 쇼핑이아닌 <b>메이커의 새로운 제품 서비스 콘텐츠<br> 제작 과정을 지원</b>해요.</div>
            </div>

            <div class="story-container">
            <div class="story-header">
                <h2 style="text-align: left;">프로젝트 스토리</h2>
                <div class="story-header-content" style="background-color:  rgb(240, 245, 250); ">
                    도서산간에 해당하는 서포터님은 배송 가능 여부를 선택해라어쩌고~
                </div>
            </div>
            <div class="contain" style="display: flex;">
                <img style="width: 800px; height: auto;" src="<%=contextPath %>/<%=ii.getFilePath() %><%=ii.getChangeName()%>" alt="">
            </div>
            <br>
            <br>
             <div class="contain" style="display: flex; width:800px;">
                <img style="width: 800px; height: 500px;" src="<%=contextPath %>/views/img/홍보1.jfif" alt="">
            </div>
        </div>

      
        </div>
            

        




        <div class="detail-right">
            
            <div class="commoninfo-container">

            <div class="baseinfo">
        <div class="category-header">
            
            <div><%= c.getCategory()%>
            <button></button>
            </div> 
                        <div> <img class="sharehover" src="<%=contextPath %>/views/img/img-share.png" style="height: 25px; width: 25px;" alt="" onclick="share()">
            
            <div class="a2a_kit a2a_kit_size_32 a2a_default_style" data-a2a-url="https://www.wadiz.kr/web/campaign/detail/164798" data-a2a-title="FUNDABLE" style="position:absolute; top:160px; right:160px;"> 
          
          <a class="a2a_button_facebook"></a>
             <a class="a2a_button_twitter"></a>
             <a class="a2a_button_kakao"></a>
            <a class="a2a_button_line"></a>
           </div>
           
            </div>

</div>



   
<script async src="https://static.addtoany.com/menu/page.js">
var a2a_config = a2a_config || {};
a2a_config.locale = "ko";
a2a_config.num_services = 4;
</script>

<script>


function share() {
    const a2a = document.getElementsByClassName("a2a_kit a2a_kit_size_32 a2a_default_style");
    for (let i = 0; i < a2a.length; i++) {
       if(a2a[i].style.display == "flex"){
          
      a2a[i].style.display = "none";
       }else{
          a2a[i].style.display = "flex";
       }
    }
  }

</script>
        </div>

        <div class="funding-type" style="justify-content: left; display: flex;">
             <img src="<%=contextPath %>/views/img/gift.png" style="height: auto; width: 30px;" alt=""> 
             <% if(p.getfStatus().equals("Y")){ %>
             펀딩 
             <%}else{ %>
             오픈 예정 
             <%} %>
        </div>
        
        <b><%=p.getpTitle() %></b> <br>
        <p><%=p.getDescription() %></p> <br>

        <div class="basefunding-info">
            <div class="basefunding-info-num" style="color: aqua;">
                <span><%=(500-p.getCount())/5 %>%달성</span> <button style="background-color: lightblue; margin-left:5px; border-radius:8px">
                <%=p.getCategoryNo()%>일 남음</button> <!-- end date와 sysdate의 계산식 -->
            </div>
            <div class="basefunding-info-num" style="display: flex;">
                <p style="font-size: 20px;"><% DecimalFormat decFormat2 = new DecimalFormat("###,###");
                String str2  = decFormat2.format( p.getTotal());%><%=str2%><span style="font-size: 12px;">원 달성!</span> </p>
                <span style="background-color: lightgray; margin-left: 15%; padding:3px; height: 25px;"><%=500-p.getCount() %>명 참여</span>
            </div>
        </div>
        <div class="benefit-container">
            <div class="benefit-text"><span style="color: #adb5bd;">해택</span></div>
        </div>
        <div class="benefit-content">
            <span style="color: green;">NAVER</span> 결제시 네이버 포인트 적립
        </div>
        <div class="funding-div" style="justify-content: space-between; display: flex;">
            <button class="follow bdr" style="border: 1px solid #cdd3d8; color: #495057; width:100px">♡ <br>3414</button>
        <div id="amount" style="display:none;">100</div>
      <% if(loginUser != null ){%>
         
         <% if(p.getfStatus().equals("Y")){%>

        <button class="funding" style="width: 80%; height: 50px; font-size: larger;" onclick="requestPay()">펀 딩 하 기</button>
       <% }else{ %>
       
                    <button class="funding" style="width: 80%; height: 50px; font-size: larger;" onclick ="thisisopen()">펀 딩 하 기</button>
                    
             <%  } %>
                
              <%  }else if(loginUser == null){%>
                      <button class="funding" style="width: 80%; height: 50px; font-size: larger;" onclick ="gotologin()">펀 딩 하 기</button>
                <%}  %>

        </div>
        <div class="seller-profile">

            <div class="seller-profile-text graybox" style="padding: 10px; display: flex;">
                <div style="display: flex; justify-content: space-between;">
                <div class="seller-profile-img" style="margin-left:15px"><img src="<%=contextPath %>/views/img/profile.png" style="height: 60px; width: 60px; border-radius:50px; " alt="">
                <div class="seller-profile-name" style="padding: 10px;"><%= p.getSellerNickName() %>
                    <div class="seller-profile-followers" style="color: aqua;">100명</div></div>
                </div>
                <div>
                
                <div style="margin: 10px; padding:10px; background-color:aqua; border-radius:8px; color:white;">
                
                

                 <% if(loginUser != null ){%> 
                <form action="pwl.wl">
                <input type="hidden" name="productNo" value="<%= productNo%>">
                <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">              
             
                
                <button class="btnh1" type="submit"><svg   xmlns="http://www.w3.org/2000/svg" width="21" height="21" 
                     viewBox="0 0 16 16">
                    <path id="heartlogo"  d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                  </svg>
                찜 하 기</button>
                
                </form>
              <%   }else{%>
                 <button  class="btnh1" type="button" onclick ="gotologin()"><svg   xmlns="http://www.w3.org/2000/svg" width="21" height="21" 
                     viewBox="0 0 16 16">
                    <path id="hl2"  d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                  </svg>
                찜 하 기</button>
                <% }%>
                </div>
                </div>
                </div>
            </div>

        </div>

        <div class="report-text bdr" style="background-color: #dde2e6; padding: 10px; margin-top: 10px;  
        display: flex; justify-content: space-between;">

            <b> 프로젝트에 문제가 있나요?</b><a href="<%=contextPath %>/views/notice/Report.jsp" style="text-decoration: none; color: black;">신고하기</a>

        </div>
        <div class="sticky">
        <%for(Option o : po) { %>
        <div class="option-select">

            <div class="options graybox">
            <div class="checkbox">
            <input style="width:20px; height:20px; margin-top:10px;" type="checkbox" id="checkbox1" value="<%=o.getOptionPrice() %>" onchange="showSelectedContent('checkbox1')" name="checkbox" />
          <label for="checkbox1"></label>   </div>
                <div class="option-price" style="display: flex;">
                    <h3><% DecimalFormat decFormat = new DecimalFormat("###,###");
                String str  = decFormat.format( o.getOptionPrice());%> <%= str%>원</h3> <span style="background-color: lightblue; color: aqua; margin : 8px;" >현재 <%=p.getCount() %>개 남음</span> 
                   
                </div>
                <div class="option-title grayline" style="font-size:25px;">
                    <%=o.getOptionName() %>
                </div>
                <div class="option-contents">
                    <div class="option-content1 grayline"><%= o.getOptionDescription() %></div>
                </div>
                <div class="option-dvprice" style="justify-content: space-between; display: flex;">
                    <div>배달팁</div>
                    <div>3500원</div>
                </div>
                <div class="option-dvdate grayline" style="justify-content: space-between; display: flex;">
                <div>발송 시작일</div><div id="dateDiv"><%= currentDate %> </div>
                
                </div>
                <div class="option-stock grayline" style="justify-content: space-between; display: flex;">
                    <div>제한 수량</div><div><%=p.getCount() %>개</div>
                </div>
            </div>
            <% } %>

            

        

     </div>
    </div>
        </div>
    </div>
    </div>
    </div>
        <%@ include file="/views/common/챗봇.jsp" %>
        <%@ include file="/views/common/프터.jsp" %>
   
  
  
  <script>
     
     function gotologin(){
        
        location.href = '<%=contextPath%>/login.me';
        
     }
  
  </script>
  
   
   <!-- api에 넘길 가격 값 -->
  <script>
  
//체크된 체크박스의 값을 가져오는 함수
   function getPrice() {
    var checkbox = document.querySelector('input[type="checkbox"]:checked');
    if (checkbox) {
      return parseFloat(checkbox.value);
    }
    return 0;
  }

  // id가 "amount"인 div에 체크된 체크박스의 값을 넣는 함수
  function updateAmountDiv() {
    var amountDiv = document.getElementById("amount");
    var checkedValue = getCheckedCheckboxValue();
    amountDiv.innerHTML = checkedValue;
    amountDiv.style.display ="none";
     
  }

  // 체크박스가 변경될 때마다 id가 "amount"인 div를 업데이트
  var checkbox = document.querySelector('input[type="checkbox"]');
  checkbox.addEventListener('change', updateAmountDiv);
  
  
 
  </script>
  
  <script>
  
   
     /* 찜하기 하트 */
  $(function(){
     
    $(".btnh1").click(function(){
       
       
        let col = $(this).children().attr("color");
        
        if(col == "rgba(255,0,0, .85)"){
            $(this).children().attr("color","rgba(136, 137, 143, 0.4)");
        }else {
            $(this).children().attr("color","rgba(255,0,0, .85)");
        }
    });
  });
   
   $(function(){
       $(".btnh1").click(function(){
           $(this).toggleClass("active");
           $(".btnh1").toggleClass("active");
       });
   }); 
   
   
   
   
    
    // ============================= 찜하기 색상변화 스크립트 ===============================
   </script>
  
 
  
  <!-- 하트 색 확인 -->
  <script>
  
  $(document).ready(function(){

     
        
     let wishStatus = '<%= wl.getwStatus()%>';
     if(wishStatus == 'Y'){
        $("#heartlogo").css("fill","red")
     }else{
        $("#heartlogo").css("fill","gray")
     }
     
     
     
     
  });
        
        
        
     
  
  
  </script>
  
   
   <!-- api 추가 -->
<script>
    function showSelectedContent(checkboxId) {
      var checkbox = document.getElementById(checkboxId);
      var amountDiv = document.getElementById("amount");
      
      // 선택한 내용을 표시할 div 업데이트
       if (checkbox.checked) {
        amountDiv.style.display = "none";
        amountDiv.innerHTML = amountDiv.innerHTML = checkbox.value;
      } else {
         amountDiv.style.display = "none";
         amountDiv.innerHTML = "";
      } 
    }
    
    $(document).ready(function() {
        
        
        
        $('input[type="checkbox"][name="checkbox"]').click(function(){
        
         if($(this).prop('checked')){
        
            $('input[type="checkbox"][name="checkbox"]').prop('checked',false);
        
            $(this).prop('checked',true);
        
           }
         
          });
         
        });
  </script>
  
  <!-- 결제 API -->
  
  <script>
    var IMP = window.IMP; 
    IMP.init("imp06580330"); 
  
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds() * 3;
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function requestPay() {   
        IMP.request_pay({
            pg : "html5_inicis",
            pay_method : 'card',
            merchant_uid: "IMP"+hours+minutes+seconds+makeMerchantUid+makeMerchantUid*2+makeMerchantUid*3, 
            name : '<%=p.getpTitle()%>',
            amount : document.getElementById("amount").innerHTML,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456',
            custom_data: today,
            display: {
                card_quota: [3]  // 할부개월 3개월까지 활성화
            }
        }, function (rsp) { // callback
            if (rsp.success) {
                
              $.ajax({
                 url : '<%=contextPath %>/sa.po',
                 data : {
                    userNo : <%=loginUser.getUserNo()%>,
                    productNo : <%= productNo %>,
                    pTitle : '<%= p.getpTitle() %>',
                    oNo : <%= po.get(0).getOptionNo() %>,
                    tPrice : <%= p.getPrice() %>,
                    nick : '<%= p.getSellerNickName() %>'
                 },
                 type : 'post',
                 success : function(){
                     alert("결제가 완료되었습니다.");  
                 }
              });  

            } else {
                alert("결제에 실패하였습니다.");
            }
        });
    }
</script>
  
     
  
  <script>
     
  </script>

    <script>
    	function thisisopen(){
    		alert("오픈예정중인 상품입니다.");
    		
    	}
        const slider = document.querySelector('.slider');
        const prevButton = document.querySelector('.prev-button');
        const nextButton = document.querySelector('.next-button');
    
        let currentSlide = 0;
        const slides = slider.querySelectorAll('img');
        const totalSlides = slides.length;
    
        function showSlide(slideIndex) {
          slides.forEach((slide, index) => {
            if (index === slideIndex) {
              slide.style.display = 'block';
            } else {
              slide.style.display = 'none';
            }
          });
        }
    
        function nextSlide() {
          currentSlide++;
          if (currentSlide >= totalSlides) {
            currentSlide = 0;
          }
          showSlide(currentSlide);
        }
    
        function prevSlide() {
          currentSlide--;
          if (currentSlide < 0) {
            currentSlide = totalSlides - 1;
          }
          showSlide(currentSlide);
        }
    
        nextButton.addEventListener('click', nextSlide);
        prevButton.addEventListener('click', prevSlide);
    
        
        showSlide(currentSlide);
      </script>
</body>
</html>