<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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
   
        /*============================================== 마이페이지 ==================================================*/
  
        body{
              margin: 0;
              box-sizing: border-box;
              width: clac(100vw - (100vw - 100%));
          }
          
         
  
    
  /*===============================================================================================*/
          #mypage-content-wrap{
            display: flex;
            justify-content: center;
            width:85vw;
            margin: 9.7vh auto 15vh;
            height: 60vh;
            align-items: center;
          }
  
          #mypage-content{
            width: 38vw;
            display: flex;
            flex-direction: column;
            align-items: center;
            
          }
  /*===============================================================================================*/
        
  
         
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





<!-- 마이페이지 컨텐츠부분 감싸는 div-->
<div id="mypage-content-wrap">




<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content" >

    <!-- 알림내역 컨텐츠부분-->
    <h3 style="font-weight: bold; margin-top: 10vh;">로그인</h3>
    <div id="nf-history" >
        <br>
    
      
    
      <form style="display: flex; justify-content: center;" action="<%= contextPath %>/login.me" method="post">
        



        <div style="width: 30vw;" >

        <h5 style="font-weight: bold;">아이디</h5>
            <div class="form-floating" >
                <input width="70%" height="" name="userId" type="input" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                <label for="floatingInput">아이디</label>
              </div>
              <br>




              <h5 style="font-weight: bold;">비밀번호</h5>
        <div class="form-floating" >
          <input width="70%" height="" type="password" name="userPwd" class="form-control" id="floatingInput" placeholder="name@example.com" required>
          <label for="floatingInput">비밀번호</label>
        </div>
        <br>
        
    
        
        <button class="w-100 btn btn-lg btn-secondary" type="submit">로그인</button>
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

 	$(function(){
 		<% session.removeAttribute("alertMsg");%>
 	});


</script>

</body>
</html>