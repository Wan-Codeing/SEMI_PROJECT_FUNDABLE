<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fun.product.model.vo.Image"%>
    <%
    Image profileImg = (Image)session.getAttribute("profileImg");
    		String [] iArr = (String [])session.getAttribute("iArr");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">


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

       #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
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
  
       /*====================================================== 마이페이지 리스트 끝 ==================================================*/
          #mypage-content h5{
            margin-top:7vh;
          }

          #mypage-content h6{
            font-weight: bold;
          }
          #info-set-profile-img img{
            width: 10vw;
            height: 18vh;
            border-radius: 0.5vw;
          }
  
      
  
          #profile-img-change, #profile-img-delete{
            text-decoration: underline;
            margin: 0.5vw 0 0 0;
            background-color:white;
            border:none;
          }
         
  
          #profile-img-change:hover, #profile-img-delete:hover{
            cursor: pointer;
          }
          
          /* #interest-table{
            width: 22vw;
          } */

          #interest-head1,#interest-head3{
            width: 9vw;
          }

          #interest-head2,#interest-head4{
            width: 2vw;
          }

          #load-interest{
            width: 22vw;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
          }
         
          #load-interest div{
            width: 6vw;
            border: 1px solid rgb(207, 206, 206);
            border-radius: 0.5vw;
            text-align: center;
            margin-bottom: 2vh;
            font-weight:bold;
          }

          #nf-history{
            margin-top: 5vh;
          }
      </style>

    
    
  </head>
  <body>
    

  <%@ include file="/views/common/헤더.jsp" %>
<script>
const msg = "<%= (String) session.getAttribute( "alertMsg") %>";

if(msg != "null"){
	alert(msg);
	// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
	// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
	<% session.removeAttribute("alertMsg");%>
}

</script>
  


<!-- 배너 부분 -->
<div id="mypagebanner-wrap">
    <div id="mypagebanner">
  
      <div id="profile">
  
         <% if(profileImg.getChangeName() != null){ %>
        <div id="profile-image"><img id="pimg" src="<%= contextPath %>/<%= profileImg.getFilePath() + profileImg.getChangeName()%>" >
		<%} else{%>
        <div id="profile-image"><img id="pimg" src="https://www.thechooeok.com/common/img/default_profile.png" >
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
    <li><a href="" style="color: blue;">기본 정보 설정</a></li>
    <li><a href="<%= contextPath %>/address.me" >주소지 설정</a></li>
  </ul>
  <ul><h4>문의정보</h4>
    <li><a href="<%= contextPath%>/qa.me">문의 내역</a></li>
  </ul>

</div>
<!-- 마이페이지 리스트 끝 -->

<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content" >

  <h4 style="font-weight: bold;">기본 정보 설정</h4>
  <br>
<br>
    <h5 style="font-weight: bold; margin-top: 0;">프로필 사진</h5>

  <!--================================================ 프로필 변경폼  시작 부분 =======================================================-->
    
    <div align="center">
    
    <button id="hiddenB" style="display:none;" onclick="deleteImg();"></button>
    
  <form action="<%= contextPath %>/infoUpdate.me" method="post" enctype="multipart/form-data">
    
		<% if(profileImg.getChangeName() != null){ %>
        <div id="info-set-profile-img">
        <img id="info-img" class="info-img-c" src="<%= contextPath %>/<%= profileImg.getFilePath() + profileImg.getChangeName()%>" >
        <input type="hidden" name="hiddenSql" value="updateImg">
		<%} else{%>
        <div id="info-set-profile-img">
        <img id="info-img" src="https://www.thechooeok.com/common/img/default_profile.png" >
        <input type="hidden" name="hiddenSql" value="insertImg">
        <%} %>
    
  	</div>
    <div style="display: flex; justify-content: center;"><button id="profile-img-change" type="button">변경</button>  &nbsp; &nbsp; &nbsp;<span id="profile-img-delete">삭제</span></div>
  	 <input type="file" id="imgChange" name="changeImg" onchange="loadImg(this)" style="display:none;">
  </div>
  
 
  
  
  
  
  <div align="center">
  <h5 style="font-weight: bold;">관심사 등록</h5></div>
  <br>
  
    
    <div align="center" >

    <div id="interest-table">
      
      <table>

        <tr>
          <td id="interest-head1"><label for="interest-tech">테크/가전</label></td>
          <td id="interest-head2">
            <input type="checkbox" name="user-interest" id="interest-tech" value="테크/가전" >
          </td>
          <td id="interest-head3"><label for="interest-fashion">패션/잡화</label></td>
          <td id="interest-head4">
            <input type="checkbox" name="user-interest" id="interest-fashion" value="패션/잡화">
          </td>
        </tr>

        <tr>
          <td id="interest-head1"><label for="interest-home">홈/리빙</label></td>
          <td id="interest-head2">
            <input type="checkbox" name="user-interest" id="interest-home" value="홈/리빙">
          </td>
          <td id="interest-head3"><label for="interest-beauty">뷰티</label></td>
          <td id="interest-head4">
            <input type="checkbox" name="user-interest" id="interest-beauty" value="뷰티">
          </td>
        </tr>

        <tr>
          <td id="interest-head1"><label for="interest-food">푸드</label></td>
          <td id="interest-head2">
            <input type="checkbox" name="user-interest" id="interest-food" value="푸드">
          </td>
          <td id="interest-head3"><label for="interest-sport">스포츠</label></td>
          <td id="interest-head4">
            <input type="checkbox" name="user-interest" id="interest-sport" value="스포츠">
          </td>
        </tr>



      </table>

    </div>
  </div>

	<div align="center">

  <h5 style="font-weight: bold;">등록된 관심사</h5></div>
  <br>
  <div align="center">
  <div id="load-interest" >
    
    <% if(iArr.length > 0 && !(iArr[0].equals(""))){ %>
    <% for(int i = 0; i < iArr.length; i++){ %>
    <div>#<%= iArr[i] %></div>
    <% }}else{%>
    	등록된 관심사가 없습니다.
    <%} %>
  </div></div>

  <!-- 기본정보설정 컨텐츠부분-->
  <div id="nf-history">
    
    
    
    
    
    <div style="width: 30vw;" >
      <h6>닉네임 변경</h6>
        <div class="form-floating" >
          <input width="70%" height="" type="text" class="form-control" name="user-nickname" id="floatingInput" placeholder="name@example.com">
          <label for="floatingInput">닉네임</label>
        </div>
        <br>
        <h6>이메일 변경</h6>
        <div class="form-floating">
          <input type="email" class="form-control" id="floatingEmail" name="user-emil" placeholder="Password">
          <label for="floatingEmail">이메일</label>
        </div>
        <br>
        <h6>비밀번호 변경</h6>
        <div class="form-floating" >
          <input width="70%" height="" type="password" class="form-control" name="changePwd" id="floatingPassword" placeholder="name@example.com">
          <label for="floatingPassword">비밀번호</label>
        </div>
        <br>
        <h6>비밀번호 확인</h6>
        <div class="form-floating">
          <input type="password" class="form-control" id="floatingCheckPassword" name="changePwdCheck" placeholder="Password">
          <label for="floatingCheckPassword">비밀번호 확인</label>
        </div>
        
        <button class="w-100 btn btn-lg btn-secondary" type="submit" style="margin-top: 5vh;" onclick="return validate();">수정</button>
        <button class="w-100 btn btn-danger btn-lg"  style="margin-top: 2vh;" type="button" onclick = "location.href='<%=contextPath %>/dMember.me'">회원탈퇴</button>
        
        
      </div>

      </form>
      <!--================================================ 프로필 변경폼  끝 부분 =======================================================-->
  </div>
   <!-- 기본정보설정 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->




<%@ include file="/views/common/프터.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
var $qs = jQuery.noConflict();
  $qs(function(){
	//	  $("#file-area").hide();
	  
	  
    $qs("#profile-img-change").click(function(){
      $qs("#imgChange").click();
    });



    $qs("#profile-img-delete").click(function(){
        $qs("#hiddenB").click();
      });

    
    
    $qs("#floatingInput").val("<%= loginUser.getUserNick() %>");
    $qs("#floatingEmail").val("<%= loginUser.getEmail() %>");
    
    const interest = "<%= loginUser.getUserInterest() %>";
	
	$qs("input[type=checkbox][name=user-interest]").each(function(){
		// 순차적으로 접근한 input요소의 value값이 interest에 포함되어 있을 경우
		// 해당 input 요소에 checked속성 부여
		
		// interest문자열로부터 현재 체크박스의 value가 포함되어있지 않다면
		// -1을 반환
		if(interest.search($qs(this).val())!= -1)
		 $qs(this).attr("checked",true);
		
	})
    
    
    
  });

  	
  	function validate(){
  		
  		const userPwd1 = document.getElementById("floatingPassword");
        const userPwd2 = document.getElementById("floatingCheckPassword");
  		
      if(userPwd1.value != userPwd2.value){
       
          alert("비밀번호가 일치하지 않습니다.");
          return false;
      }

  	}
 
  	
  	
  	function loadImg(inputFile){
			// inputFile : 현재 변화가 생긴 input type="file" 요소 객체
			// num		 : 몇번째 input요소인지 확인 후 해당 영역에 미리보기하기 위한 매개변수
			
			/*
				파일 선택시 길이는 1, 파일선택 취소시 길이는 0
				length속성을 활용해서 인풋태그에 파일 존재 유무를 확인할 수 있다.
			*/
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 수 있는 자바스크립트 내장객체 FileReader 객체 생성.
			const reader = new FileReader();
				
				// 파일을 읽어들이는 메소드 => 매개변수로 어느파일을 읽어들일건지 선택해줘야함.
				reader.readAsDataURL(inputFile.files[0]); // 0번 인덱스에 담긴 파일정보를 제시
				// 해당 파일을 읽어들이는 순간 그 파일만의 고유한 url이 부여됨
				// 해당 url을 src속성으로 부여.
					//const screen = document.getElementById("info-img");
				
				// 파일 읽기가 완료되었을 경우 실행할 함수를 정의
				reader.onload = function(e){ // event객체의 target.result에 각 파일의 url이 담김.
					// 각 영역에 맞춰서 이미지 미리보기
					$qs("#info-img").attr("src", e.target.result);
					
				}
					
				}
				
			
		/* 	else{
				// 선택된 파일이 없는 경우
				// 미리보기 사라지게 하기
				switch(num){
				case 1 : $("#titleImg").attr("src", null); break;
				case 2 : $("#contentImg0").attr("src", null); break;
				case 3 : $("#contentImg1").attr("src", null); break;
				case 4 : $("#contentImg2").attr("src", null); break;
			} */
	//	}
			
		}

  	
  	function deleteImg(){
		 $qs.ajax({
				
			url : "<%= contextPath%>/deleteImg.me",
			data : {
				userNo : "<%= loginUser.getUserNo() %>"
			},
			type : "post",
			success : function(result){
				if(result > 0){ // 
					$qs("#info-img").attr("src","https://www.thechooeok.com/common/img/default_profile.png");
			  		$qs("#pimg").attr("src","https://www.thechooeok.com/common/img/default_profile.png");
				
				}
			}
			
		});
		
	}
		
</script>


</body>
</html>