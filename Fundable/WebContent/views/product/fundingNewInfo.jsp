<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
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
	<link href="<%=contextPath %>/views/css/펀딩상세페이지.css" rel="stylesheet" type="text/css">

     <!-- 결제API -->
    <!-- <script src="payAPI.js"></script> -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  </head>
<style>
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
    
    /* 헤더 css */
    .footer-table{
        font-size: 12px;
      }
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
        }
    button{
        border-radius: 5px;
    }
     *{
        margin: 0;
        border: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        font-family: "Pretendard";
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
}
.detail-left,.detail-right{

    text-align: center;
}
.detail-left{
    width: 40%;
    height: auto;
}
.detail-right{
    width: 35%;
    height: auto;
    text-align: left;
    margin-left: 5%;
}
.recommendation-container,.notice-banner-list-ul,.notice-banner-description,.story-container,.recommendation-container,
.recommendation-container-product,.funding-type,.baseinfo,.seller-profile-text,.benefit-container,.funding-div{
    margin-top: 25px;
}

.commoninfo-container{
    height: 2500px;
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
      top: 50%;
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
    .story-container{
        
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
    
</style>
<body>
   <!-- 헤더 -->
   <div style="margin-top: 10px;">
    <div class="header" style="margin-top: 5px;"><nav class="navbar navbar-expand-md navbar-dark ">
        <div class="container-fluid me-4" style="margin-left: 2%;">
          <a class="navbar-brand" href="#">
            <img class="nav-logo" src="<%=contextPath %>/views/img/FUNDABLE-LOGO.gif">
          </a>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-md-0" style="margin-left: 20px;"> 
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: black;">오픈예정</a>
                  </li>
              <li class="nav-item">
                <a class="nav-link" href="#" style="color: black;">펀딩</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" style="color: black;">고객센터</a>
              </li>
            </ul>
            <ul class="navbar-nav mb-md-0 me-4 logout">
                <li>
                
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: black;">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" style="color: black;">회원가입</a>
                </li>
              </ul>
              <ul class="navbar-nav mb-md0 me-4 login">
                <li>
                  <a href="" class="notice-bell">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-bell" viewBox="0 0 16 16">
                      <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                    </svg>
                  </a>
                </li>
                <li>
                  <span style="color:gray;"><span style=" line-height: 2.5;">누구누구</span>님 환영합니다.</span>
                </li>
                <li>
                  <a class="nav-link" href="#" style="color: black;">로그아웃</a>
                </li>
                <li>
                  <a class="nav-link" href="#" style="color: black;">마이페이지</a>
                </li>
              </ul>
            <form class="d-flex" role="search">
              <input class="form-control me-3" type="search" placeholder="검색" aria-label="검색">
              <button class="btn btn-outline-success" style="width:100px;" type="submit">검색</button>
            </form>
          </div>
        </div>
      </nav></div>
</div>
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
               
                <div class="newinfo">
                   <h2> 새소식 </h2> <b style="color: aqua;">4</b>
                    <div class="grayline"></div>
                    <div class="newinfo-content grayline">
                        <div> 기타 </div>
                        <div>사과 떡볶이 SARI입니다. 문의사항 tip</div>
                        <div>5분전</div>
                    </div>
                    <div class="newinfo-content grayline">
                        <div class="">이벤트 | 오픈예정</div>
                        <div class="">무책임팩 백화점 100만원 이벤트!!</div>
                        <div class="">2023.6.28</div>
                    </div>
                    <div class="newinfo-content grayline">
                        <div class="">이벤트 | 오픈예정</div>
                        <div class="">체험단 당첨자 발표</div>
                        <div class="">2023.06.28 댓글 2</div>
                    </div>
                    <div class="newinfo-content grayline">
                        <div class="">이벤트 | 오픈예정</div>
                        <div class="">사과떡볶이 신제품# 무책임팩 체험단 모집합니다 :</div>
                        <div class="">2023.06.28 댓글 2</div>
                    </div>
                    <div class="newinfo-content grayline">
                        <div class="">이벤트 | 오픈예정</div>
                        <div class="">체험단 당첨자 발표</div>
                        <div class="">2023.06.28 댓글 2</div>
                    </div>

                </div>
                
        </div>
            

        




         <div class="detail-right">
            
            <div class="commoninfo-container">

            <div class="baseinfo">
        <div class="category-header">
            
            <div>푸드
            <button># 캠핑</button>
            </div> 
            <div><img src="<%=contextPath %>/views/img/img-share.png" style="height: 25px; width: 25px;" alt=""></div>
        </div>

        <div class="funding-type" style="justify-content: left; display: flex;">
            <img src="<%=contextPath %>/views/img/gift.png" style="height: auto; width: 30px;" alt="">펀딩
        </div>
        
        <b>단독 연매출 50억 떡볶이 3달을 기다려서 먹는 떡볶이 </b> <br>
        <p>진짜 맵다 맛있게</p> <br>

        <div class="basefunding-info">
            <div class="basefunding-info-num" style="color: aqua;">
                <span>9999%달성</span> <button style="background-color: lightblue;">15일 남음</button>
            </div>
            <div class="basefunding-info-num" style="display: flex;">
                <p style="font-size: 20px;">10000000<span style="font-size: 12px;">원 달성!</span> </p>
                <span style="background-color: lightgray; margin-left: 15%; height: auto;">1000명 참여</span>
            </div>
        </div>
        <div class="benefit-container">
            <div class="benefit-text"><span style="color: #adb5bd;">해택</span></div>
        </div>
        <div class="benefit-content">
            <span style="color: green;">NAVER</span> 결제시 네이버 포인트 적립
        </div>
        <div class="funding-div" style="justify-content: space-between; display: flex;">
            <button class="follow bdr" style="border: 1px solid #cdd3d8; color: #495057;">♡ 3414</button>
            <div id="amount">10</div>
        <button class="funding" style="width: 80%; height: 50px; font-size: larger;" onclick="requestPay()">펀 딩 하 기</button>
        </div>
        <div class="seller-profile">

            <div class="seller-profile-text graybox" style="padding: 10px; display: flex;">
                <div style="display: flex; justify-content: space-between;">
                <div class="seller-profile-img graybox"><img src="<%=contextPath %>/views/img/category_food.png" style="height: 20px; width: 20px;" alt=""></div>
                <div class="seller-profile-name" style="padding: 10px;">초록우산어린이재단마켓그리니
                    <div class="seller-profile-followers" style="color: aqua;">100명</div>
                </div>
                <div><button style="margin: 10px; padding:10px; background-color:aqua; color:white; ">+ 팔로우</button></div>
                </div>
                <div style="display: flex; justify-content: right;" >

                <div style="margin: 10px;"><span>인기</span>
                <div class="bar">
                    <div class="barin" style="width: 40%;"></div> 
                </div></div>
                <div style="margin: 10px;"><span>소통</span>
                <div class="bar">
                   <div class="barin" style="width: 60%;"></div> 

                </div></div>
                <div style="margin: 10px;"><span>평판</span>
                <div class="bar">
                    <div class="barin" style="width: 80%;"></div> 
                </div></div>

                </div>
            </div>

        </div>
        </div>

        <div class="report-text bdr" style="background-color: #dde2e6; padding: 10px; margin-top: 10px;  
        display: flex; justify-content: space-between;">

            <b> 프로젝트에 문제가 있나요?</b><a href="신고" style="text-decoration: none; color: black;">신고하기</a>

        </div>
        <div class="sticky">
        <div class="option-select">

            <div class="options graybox">
            <div class="checkbox">
            <input type="checkbox" id="checkbox1" onchange="showSelectedContent('checkbox1')" name="checkbox" />
    		<label for="checkbox1"></label></div>
                <div class="option-price" style="display: flex;">
                    <h3>23,300원</h3> <span style="background-color: lightblue; color: aqua;">현재 62개 남음</span> 
                </div>
                <div class="option-title grayline">
                    [무책임팩] 3팩 5%할인
                </div>
                <div class="option-contents">
                    <div class="option-content1">사과떡볶이 3개</div>
                    <div class="option-content2">정상가 2500000</div>
                    <div class="option-content3">1팩당 1.5인분</div>
                    <div class="option-content4 grayline">7월말 배송</div>
                </div>
                <div class="option-dvprice grayline" style="justify-content: space-between; display: flex;">
                    <div>배송비</div>
                    <div>3500원</div>
                </div>
                <div class="option-dvdate grayline" style="justify-content: space-between; display: flex;">
                <div>발송 시작일</div><div>2023년 7월 말예정</div>
                
                </div>
                <div class="option-stock grayline" style="justify-content: space-between; display: flex;">
                    <div>제한 수량</div><div>300개</div>
                </div>
            </div>

            <div class="options graybox">
            <input type="checkbox" id="checkbox2" onchange="showSelectedContent('checkbox2')"  name="checkbox" />
    	<label for="checkbox2"></label>
                <div class="option-price" style="display: flex;">
                    <h3>23,300원</h3> <span style="background-color: lightblue; color: aqua;">현재 62개 남음</span> 
                </div>
                <div class="option-title grayline">
                    [무책임팩] 3팩 5%할인
                </div>
                <div class="option-contents">
                    <div class="option-content1">사과떡볶이 3개</div>
                    <div class="option-content2">정상가 2500000</div>
                    <div class="option-content3">1팩당 1.5인분</div>
                    <div class="option-content4 grayline">7월말 배송</div>
                </div>
                <div class="option-dvprice grayline" style="justify-content: space-between; display: flex;">
                    <div>배송비</div>
                    <div>3500원</div>
                </div>
                <div class="option-dvdate grayline" style="justify-content: space-between; display: flex;">
                <div>발송 시작일</div><div>2023년 7월 말예정</div>
                
                </div>
                <div class="option-stock grayline" style="justify-content: space-between; display: flex;">
                    <div>제한 수량</div><div>300개</div>
                </div>
            </div>

            <div class="options graybox">
            <input type="checkbox" id="checkbox3" onchange="showSelectedContent('checkbox3')"  name="checkbox"/>
    		<label for="checkbox3"></label>
                <div class="option-price" style="display: flex;">
                    <h3>23,300원</h3> <span style="background-color: lightblue; color: aqua;">현재 62개 남음</span> 
                </div>
                <div class="option-title grayline">
                    [무책임팩] 3팩 5%할인
                </div>
                <div class="option-contents">
                    <div class="option-content1">사과떡볶이 3개</div>
                    <div class="option-content2">정상가 2500000</div>
                    <div class="option-content3">1팩당 1.5인분</div>
                    <div class="option-content4 grayline">7월말 배송</div>
                </div>
                <div class="option-dvprice grayline" style="justify-content: space-between; display: flex;">
                    <div>배송비</div>
                    <div>3500원</div>
                </div>
                <div class="option-dvdate grayline" style="justify-content: space-between; display: flex;">
                <div>발송 시작일</div><div>2023년 7월 말예정</div>
                
                </div>
                <div class="option-stock grayline" style="justify-content: space-between; display: flex;">
                    <div>제한 수량</div><div>300개</div>
                </div>
            </div>

            <div class="options graybox">
             <input type="checkbox" id="checkbox3" onchange="showSelectedContent('checkbox4')"  name="checkbox" />
    			<label for="checkbox4"></label>
                <div class="option-price" style="display: flex;">
                    <h3>23,300원</h3> <span style="background-color: lightblue; color: aqua;">현재 62개 남음</span> 
                </div>
                <div class="option-title grayline">
                    [무책임팩] 3팩 5%할인
                </div>
                <div class="option-contents">
                    <div class="option-content1">사과떡볶이 3개</div>
                    <div class="option-content2">정상가 2500000</div>
                    <div class="option-content3">1팩당 1.5인분</div>
                    <div class="option-content4 grayline">7월말 배송</div>
                </div>
                <div class="option-dvprice grayline" style="justify-content: space-between; display: flex;">
                    <div>배송비</div>
                    <div>3500원</div>
                </div>
                <div class="option-dvdate grayline" style="justify-content: space-between; display: flex;">
                <div>발송 시작일</div><div>2023년 7월 말예정</div>
                
                </div>
                <div class="option-stock grayline" style="justify-content: space-between; display: flex;">
                    <div>제한 수량</div><div>300개</div>
                </div>
            </div>
        </div>

        
        <div class="funding-div" style="justify-content: space-between; display: flex;">
            <button class="follow bdr" style="border: 1px solid #cdd3d8; color: #495057;">♡ 3414</button>
            <div id="amount">10</div>
        <button class="funding" style="width: 80%; height: 50px; font-size: larger; onclick="requestPay()">펀 딩 하 기</button>
        </div>
     </div>
    </div>
        </div>
    </div>

    <!-- 푸터 -->
<footer class="py-3 my-4" style="">
    <div style="color:gray">
      <table class="footer-table" style="margin-left: 20px;">
        <tr>
          <td>FUNDABLE㈜&nbsp;&nbsp;</td>
          <td>대표이사 이준호&nbsp;&nbsp;</td>
          <td>사업자등록번호 010-87-01370&nbsp;&nbsp;</td>
          <td>통신판매업신고번호 2021-성남분당C-1153&nbsp;&nbsp;</td>
          <td>경기 성남시 분당구 판교로 242 Z동 702호&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">이메일 상담 info@FUNDABLE.kr&nbsp;&nbsp;</td>
          <td colspan="3">유선 상담 1588-6210&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td colspan="5">  © FUNDABLE Co., Ltd.&nbsp;&nbsp;</td>
        </tr>
        <tr></tr>
        <tr>
          <td colspan="5">일부 상품의 경우 와디즈는 통신판매중개자이며 통신판매 당사자가 아닙니다.</td>
        </tr>
        <tr>
          <td colspan="5"> 해당되는 상품의 경우 상품, 상품정보, 거래에 관한 의무와 책임은 셀러에게 있으므로,
            각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
          </td>
        </tr>
      </table> 
    </div>
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item" style="color:gray">이준호&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;이정완&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;차재현&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;최정준&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;신용수&nbsp;</li>
    </ul>
    <p class="text-center text-muted">© 2023 Company, FUNDABLE</p>
  </footer>

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
    
    let price = document.getElementById("amount").innerHTML;

    function requestPay() {
        IMP.request_pay({
            pg : "html5_inicis",
            pay_method : 'card',
            merchant_uid: "IMP"+hours+minutes+seconds+makeMerchantUid+makeMerchantUid*2+makeMerchantUid*3, 
            name : '당근 10kg',
            amount : price,
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
                console.log(rsp);
                window.alert("결제가 완료되었습니다.");
                // window.alert(rsp.custom_data);

            } else {
                console.log(rsp);
            }
        });
    }
</script>



    <script>
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