<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <!-- CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <!-- Latest compiled JavaScript -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="views//css/챗봇.css">
</head>
<body>
	 <div class="chatbot-container" id="chatbot" style="display:none;">
        <div class="chatbox">
            <div class="chatbot-message" style="font-size: 20px;">안녕하세요! 무엇을 도와드릴까요?</div>
        </div>
        <div class="button-container">
            <button class="btn btn-primary chatbtn" id="answer1" onclick="sendMessage('펀딩')">펀딩</button>
            <button class="btn btn-primary chatbtn" id="answer2" onclick="sendMessage('문의')">문의</button>
            <button class="btn btn-primary chatbtn" id="answer3" onclick="sendMessage('배송조회')">배송조회</button>
            <button class="btn btn-primary chatbtn" id="answer4" onclick="sendMessage('이용문의')">이용문의</button>
            <button class="btn btn-primary chatbtn" id="answer5" onclick="move();">세부 문의하기</button>
        </div>
    </div>
    <div class="start-chat">
        <button class="btn chatbtn" onclick="chatbot()" style=" border:1px solid rgba(102,186,255,0.4); background-color: rgba(102,186,255,0.4);">챗봇</button>
    </div>
    
    <script>
    var $jqs1 = jQuery.noConflict();
         function getChatbotResponse() {
            const responses = [
               "<b>펀딩</b>은 <b>서포터</b>와 <b>메이커</b>로 나눠집니다.<br> <b>서포터</b>는 펀딩상품을 구매하는 구매자와 같고,"
                +"<br><b>메이커</b>는 펀딩상품을 파는 판매자와 같습니다.",
                "문의 하실게 있다면<br> <b>고객센터</b>의 <b>문의하기</b>를 이용해주세요.",
                "<b>배송 조회</b>는 <b>마이페이지</b>에서 확인 가능합니다.",
                "이용하시다가 궁금한 사항이 있으시면,<br> 이번호로 연락주세요<br>=> <b>010-준호형번호</b>",
                "챗봇이 메시지를 이해하지 못합니다."
            ];
            return responses;
        };
      
       function sendMessage(message) {
            var chatbox = document.querySelector('.chatbox');
            var userMessage = document.createElement('div');
            userMessage.className = 'user-message';
            userMessage.textContent = message;
            chatbox.appendChild(userMessage);

            setTimeout(function() {
                var chatbotMessage = document.createElement('div');
                chatbotMessage.className = 'chatbot-message';

                if(message == "펀딩"){
                    chatbotMessage.innerHTML = getChatbotResponse()[0];
                }else if(message == "문의"){
                    chatbotMessage.innerHTML = getChatbotResponse()[1];
                }else if(message == "배송조회"){
                    chatbotMessage.innerHTML = getChatbotResponse()[2];
                }else if(message == "이용문의"){
                    chatbotMessage.innerHTML = getChatbotResponse()[3];
                }else{
                    chatbotMessage.innerHTML = getChatbotResponse()[4];
                }
                chatbox.appendChild(chatbotMessage);
            }, 500);
        }

        function move(){
            location.href='<%= contextPath %>/views/notice/Question.jsp';
        };
        function chatbot(){
            $jqs1("#chatbot").toggle(1500);
        };
    </script>
</body>
</html>