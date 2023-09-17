<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fun.product.model.vo.Image"%>
    <% 
    	Member addressM = (Member) session.getAttribute("addressM");
    Image profileImg = (Image)session.getAttribute("profileImg");
    %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">

    <!--=============================== 주소 API ===============================-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!--=============================== 주소 API ===============================-->
    
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
          
           #ha{
			color:black;
		}
		#mypage-product-title>a{
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
            width: 25vw;
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
            margin: 9.7vh auto 15vh;
          }
  
          #mypage-content{
            width: 38vw;
            display: flex;
            flex-direction: column;
            align-items: center;
            
          }
  
          #fun-wrap{
            width: 100%;
            height: 7vh;
            display: flex;
  
          }
  
          
  
         
  
         #nf-history-header1{
          width: 60vw ;
          border-top-left-radius: 1vw;
         }
  
         #nf-history-header2{
          width: 11vw ;
          border-top-right-radius: 1vw;
        }
        
        #nf-history-header1,
        #nf-history-header2{
          background-color: rgb(230, 230, 230);

         }
        
  
          #nf-history td{
            border-top: 1px solid #d0cfcf;
          }
  
          #mypage-fun-state{
            font-weight: bold;
            font-size: 0.8em;
          }
  
          #nf-history table{
            text-align: center;
          }
  
          #nf-history tbody>tr{
          height: 16vh; 
          }

          #nf-td1{
            padding-left: 2vw;
          }

          #nf-td2{
            width: 15vw;
            color: blue;
            font-weight: bold;
            font-size: 0.9em;
          }

          #nf-td3{
            font-size: 0.9em;
          }
  
          .form-select{
            font-size: 10px;
            background-color: rgb(245, 244, 244);
          }
  
          tbody img{
            width: 7vw;
            height: 12vh;
            border-radius: 5px;
          }
  
          #product_info{
            /* background-color: red; */
            display: flex;
            text-align: left;
            height: 100%;
            margin: 0;
          }
          
          #mypage-product-brand{
            margin-bottom: 0;
            
            font-weight: bold;
          }
  
          #mypage-product-brand a{
            font-size: 0.8em;
          }
  
          #mypage-product-brand a:hover{
            text-decoration: underline;
          }
          
          #mypage-product-title a{
            font-weight: bold;
            font-size: 0.9em;
          }
          
          #mypage-product-title a:hover{
            text-decoration: underline;
            
          }
  
          #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
        }
  
         
  
          #mypage-product-textwrap{
            padding-left: 0.3vw;
            padding-top: 2vh;
          }
  
          #mypage-product-orderno{
            font-weight: bold;
          }
  
          #mypage-product-orderno:hover{
            cursor: pointer;
            color: rgb(26, 26, 228);
            text-decoration: underline;
          }
          
  
          #nf-history h6, #nf-history h5{
            font-weight: bold;
          }
         
          #nf-history label{
            color: rgb(180, 180, 180);
          }

          #nf-history #postcode{
            margin-bottom: 1.5vh;
          }
      </style>

    
     </head>
  <body>
  
  <script>
		const msg = "<%= (String) session.getAttribute( "alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
			// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
			<% session.removeAttribute("alertMsg");%>
		}
		
	</script>
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




<!-- 마이페이지 컨텐츠부분 감싸는 div-->
<div id="mypage-content-wrap">


<!-- 마이페이지 리스트 -->
<div id="mypage-list">
  
  <h2 style="font-weight: bold;">My Page</h2>
  <ul><h4>펀딩정보</h4>
    <li><a href="<%= contextPath %>/myPage.me" >펀딩 내역</a></li>
    <li><a href="<%= contextPath %>/wish.me">찜한 내역</a></li>
    <li><a href="<%= contextPath%>/delivery.me">배송 조회</a></li>
  </ul>
  <ul><h4>개인정보</h4>
    <li><a href="<%= contextPath %>/check.me">기본 정보 설정</a></li>
    <li><a href="" style="color: blue;">주소지 설정</a></li>
  </ul>
  <ul><h4>문의정보</h4>
    <li><a href="<%= contextPath%>/qa.me">문의 내역</a></li>
  </ul>

</div>
<!-- 마이페이지 리스트 끝 -->

<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content" >

  <h4 style="font-weight: bold;">주소지 설정</h4>
  <br>
  <!-- 알림내역 컨텐츠부분-->
  <div id="nf-history">
    
    
    <h5>수령인 정보</h5>
    <br>

      <form style="display: flex; justify-content: center;" action="<%= contextPath %>/address.me" method="post">
        
        <div style="width: 30vw;" >
    
          <h6>수령인</h6>
        <div class="form-floating" >
          <input width="70%" height="" type="text" class="form-control" name="addressName" id="floatingInput" placeholder="name">
          <label for="floatingInput">수령인</label>
        </div>
        <br>

        <h6>전화번호</h6>
        <div class="form-floating">
          <input type="text" class="form-control" id="floatingPhone" name="addressPhone" placeholder="phone">
          <label for="floatingPhone">전화번호</label>
        </div>
        <br>
        <br>
        
        
        
     
      
      
      <div class="field">
        
        
        
        <h5 style="font-weight: bold;">주소</h5>
        <br>
        
        

        <div id="postcode" style="display: flex; justify-content: space-between;  ">
        <h6 style="display: flex; flex-direction: column-reverse; margin: 0;" >우편번호</h6>
        <button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-secondary btn-sm" >우편번호찾기</button>
      </div>


        <div class="form-floating">
        <input type="text" id="sample4_postcode" name="address"  class="form-control" placeholder="우편번호" >
        <label for="sample4_postcode">우편번호</label>
        </div>
        <br>

        <h6>도로명주소</h6>
        <div class="form-floating">
        <input type="text" id="sample4_roadAddress" name="address"  class="form-control" placeholder="도로명주소" >
        <label for="sample4_roadAddress">도로명</label>
        </div>
        <br>

        <h6>지번주소</h6>
        <div class="form-floating">
        <input type="text" id="sample4_jibunAddress" name="address" class="form-control"  placeholder="지번주소" >
        <label for="sample4_jibunAddress">지번</label>
        </div>
        <br>

        <h6>상세주소</h6>
        <div class="form-floating">
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" id="sample4_detailAddress" class="form-control" name="address" placeholder="상세주소" >
        <label for="sample4_detailAddress">상세</label>
      </div>

        <br>


      </div>
      
      
      
      <button class="w-100 btn btn-lg btn-secondary" type="submit">수정</button>
      
      

    </div>







      </form>

  </div>
   <!-- 알림내역 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->








  













<%@ include file="/views/common/프터.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
var $ss = jQuery.noConflict();
  $ss(function(){

  $ss("#floatingInput").val("<%= addressM.getUserName() %>");
  $ss("#floatingPhone").val("<%= addressM.getPhone() %>");
        
  let address = "<%= addressM.getAddress() %>";
 
  let arr = address.split(",");
  
  $ss("#sample4_postcode").val(arr[0]);
  $ss("#sample4_roadAddress").val(arr[1]);
  $ss("#sample4_jibunAddress").val(arr[2]);
  $ss("#sample4_detailAddress").val(arr[3]);
  

  
  
  
  });

</script>


<script>






  function sample4_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {

              var roadAddr = data.roadAddress;
              var extraRoadAddr = '';

              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraRoadAddr += data.bname;
              }

              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }

              if(extraRoadAddr !== ''){
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
              }

              document.getElementById('sample4_postcode').value = data.zonecode;
              document.getElementById("sample4_roadAddress").value = roadAddr;
              document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
              
              // if(roadAddr !== ''){
              //     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
              // } else {
              //     document.getElementById("sample4_extraAddress").value = '';
              // }

              var guideTextBox = document.getElementById("guide");
              
              if(data.autoRoadAddress) {
                  var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                  guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                  guideTextBox.style.display = 'block';

              } else if(data.autoJibunAddress) {
                  var expJibunAddr = data.autoJibunAddress;
                  guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                  guideTextBox.style.display = 'block';
              } else {
                  guideTextBox.innerHTML = '';
                  guideTextBox.style.display = 'none';
              }
          }
      }).open({
        left: (window.screen.width / 3) ,
    top: (window.screen.height / 7) ,
    popupTitle: "우편번호찾기"
      });
  }
</script>

</body>
</html>