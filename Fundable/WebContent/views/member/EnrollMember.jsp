<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="icon" href="./images/images2/favicon.png">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="../css/login.css">
<style>
	.logo{
    	width: 70%;
    	height: 200px;
    	
	}
	.btn2{
    	width: 100%;
    	height: 50px;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/헤더.jsp" %>
    <div class="member">
        <!--  로고 -->
        <div style="margin-top : 120px;">
        <img class="logo" src="../img/FUNDABLE-LOGO.gif">
        </div>
		
		<form id="enroll-form" action="<%=contextPath%>/insert.me" method="post">
	        <!-- 필드 -->
	        <div class="field">
	            <b>아이디<span style="font-size: 2px; color: red;"> *</span></b>
	            <input name="userid" type="text" placeholder="아이디를 입력해주세요" required> 
	            <button type="button" class="btn btn-primary" onclick="idCheck();">중복확인</button>
	        </div>
	        <div class="field">
	            <b>비밀번호 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input class="userpw" name="userPwd" id="userPwd" type="password" placeholder="8~16자 이내의 영문,숫자로 지어주세요" required>
	        </div>
	        <div class="field">
	            <b>비밀번호 재확인 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input class="userpw-confirm" id="userPwd2" type="password" placeholder="8~16자 이내의 영문,숫자로 지어주세요"  onblur="myPwd();" required>
	            <label id="checkPwd"></label> <br><br>
	        </div>
	        <div class="field">
	            <b>이름 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요" required>
	        </div>
	        <div class="field">
	            <b>별명 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input type="text" name="userNick" placeholder="별명을 입력해주세요" required>
	        </div>
	
	        <!--  필드(생년월일) -->
	        <div class="field birth">
	            <b>주민등록번호 <span style="font-size: 2px; color: red;"> *</span></b>
	            <div>
	                <input type="text" name="userSsg1" placeholder="앞(6자)" required> 
	                <span style="margin-top: 20px;;">
	                    <b>ㅡ</b>
	                </span> 
	                <input type="password" name="userSsg2" placeholder="뒤(7자)" required>               
	            </div>
	        </div>
	
	        <!-- 이메일_전화번호_주소지 -->
	        <div class="field">
	            <b>이메일 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input type="email" name="email" id="email-input" placeholder="이메일 주소" required>
	            <button id="verification-request-btn" class="btn btn-primary">인증 요청</button>
	            <br><br>
	            <input type="text" id="verification-code-input" placeholder="인증 코드" >
	            <button id="verification-submit-btn" class="btn btn-primary">인증 코드 확인</button>
	        </div>
	
	        <div class="field">
	            <b>거주지 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input type="text" id="sample4_postcode" name="address1" class="d_form mini" placeholder="우편번호" style="width: 200px;">
	            <button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-primary" style="width: 180px; margin-left: 10px;;">우편번호찾기</button><br>
	            <input type="text" id="sample4_roadAddress" name="address2" class="d_form std" placeholder="도로명주소" style="width: 260px;">
	            <input type="text" id="sample4_jibunAddress" name="address3" class="d_form std" placeholder="지번주소" style="width: 260px;">
	            <span id="guide" style="color:#999;display:none"></span>
	            <input type="text" id="sample4_detailAddress" name="address4" class="d_form" placeholder="상세주소" style="width: 260px;">
	            <input type="text" id="sample4_extraAddress" name="address5" class="d_form" placeholder="참고항목" style="width: 260px;">
	        </div>
	        
	        <div class="field tel-number">
	            <b>휴대전화 <span style="font-size: 2px; color: red;"> *</span></b>
	            <input type="text" name="phone" placeholder="(-)을 포함해서 전화번호 입력" required>
	        </div>
	         
	         <!-- 필드(관심사) -->
        	<div class="field gender">
            <b>관심사<span style="font-size: 2px; color: skyblue"> (선택)</span></b>
	            <div>
		            <table align="center">
		               <tr>
		                   <td><label><input type="checkbox" name="interest" id="game" value="테크/가전">테크/가전</label></td>
		                   <td><label><input type="checkbox" name="interest" id="movie" value="패션/잡화">패션/잡화</label></td>
		                   <td><label><input type="checkbox" name="interest" id="practice" value="홈/리빙">홈/리빙</label></td>
		                   <td><label><input type="checkbox" name="interest" id="trip" value="뷰티">뷰티</label></td>
		                   <td><label><input type="checkbox" name="interest" id="cooking" value="푸드">푸드</label></td>
		                   <td><label><input type="checkbox" name="interest" id="etc" value="스포츠">스포츠</label></td>
		               </tr>
		           	</table>
	            </div>
        	</div>
	        <hr>
	        <!-- 가입하기 버튼 -->
	        <button type="submit" class="btn btn-primary btn2" onclick="return validate();">가입하기</button> <br><br>
	        <button type="button" class="btn btn-secondary btn2" onclick="toMain()">취소하기</button>
        </form>
    </div>
        <script>
        var $sss = jQuery.noConflict();
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
                        
                        if(roadAddr !== ''){
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

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
                }).open();
            }
            $sss(document).ready(function() {
                var verificationCode = '';  // 이메일 인증 코드 저장 변수
        
              // 이메일 인증 요청을 보내는 함수
              function sendVerificationCode(email) {
                // 서버로 이메일 주소 전송
                $sss.ajax({
                  type: 'get',
                  url: "/Fundable/mail.do", 
                  data: { email: $sss("#email-input").val() },
                  success: function(result) {
                    console.log(result);  // 서버 응답 출력
                    verificationCode = result;
                  },
                  error: function(xhr, status, error) {
                    console.log(error);  // 에러 메시지 출력
                  }
                });
              }
        
              // 이메일 인증 코드 확인 함수
              function verifyCode(code) {
                if (code === verificationCode) {
                  // 인증 코드가 일치하는 경우cc
                  alert('이메일 인증이 완료되었습니다.');
                  // 여기서 추가 작업을 수행할 수 있습니다.
                } else {
                  // 인증 코드가 일치하지 않는 경우
                  alert('유효한 인증 코드를 입력해주세요.');
                }
              }
        
              // 이메일 인증 요청 버튼 클릭 시
              $sss('#verification-request-btn').click(function() {
                var email = $('#email-input').val();  // 입력된 이메일 주소 가져오기
                // 이메일 인증 코드 요청 보내기
                sendVerificationCode(email);
              });
        
              // 인증 코드 확인 버튼 클릭 시
              $sss('#verification-submit-btn').click(function() {
                var code = $sss('#verification-code-input').val();  // 입력된 인증 코드 가져오기
                // 입력된 인증 코드 확인
                verifyCode(code);
              });
            });
            
            function idCheck(){
    			const userId = $sss("input[name=userid]");
    			$sss.ajax({
    				url : "<%=contextPath%>/idCheck.me",
    				data : {checkId : userId.val()},
    				success : function(result){
    					console.log(result);
    					if(result == 1){
    						alert("이미 존재하거나, 회원탈퇴한 아이디입니다.");
    						userId.focus();
    					}else {
    						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
    							userId.attr("readonly",true);
    						}else{
    							userId.focus();
    						}
    					}
    				}
    			});
    			
    		};
   		  	function myPwd(){
   	            const userPwd = $sss("#userPwd").val();
   	            const userPwd2 = $sss("#userPwd2").val();
   	         	const checkPwd = document.querySelector("#checkPwd");
   	            if(userPwd != userPwd2){
   	                checkPwd.innerHTML = "비밀번호가 일치하지 않습니다.";
   	                checkPwd.style.color = "red";
   	                return false;
   	            } else{
   	                checkPwd.innerHTML = "비밀번호가 일치합니다.";
   	                checkPwd.style.color = "green";
   	                return true;
   	            }
   	        }
   		  	
   		 	function toMain(){
   		 		location.href="<%=contextPath%>";
   		 	}
   		 	
   		 	function validate(){

             const checkPwd = document.querySelector("#checkPwd");

             if(checkPwd.style.color == "green"){
                 return true;
             }else{
                 alert("비밀번호가 일치하지 않습니다.");
                 document.getElementById("userPwd").focus();
                 document.getElementById("userPwd").value = "";
                 document.getElementById("userPwd2").value = "";
            	 return false;
             }
          
         }
        </script>
        
      
	<%@ include file="../common/챗봇.jsp" %>
	<%@ include file="../common/프터.jsp" %>
</body>
</html>