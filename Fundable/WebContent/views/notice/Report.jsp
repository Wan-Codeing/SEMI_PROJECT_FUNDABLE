<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/신고하기.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <style>
 .side-bar a:hover{
  color: gray;
}
.QA-title{
  width: 10%;
  height: 60px;
  margin-left:20%;
  font-size:40px;
  margin-top: 5%;
  color:lightgray;
}
.apeach{
  width: 20%;
  height: 30%;
  position: absolute;
  margin-top:10%;
  margin-left: -600px;
}
.callcenter{
  width: 20%;
  height: 30%;
  position: absolute;
  margin-top:30%;
  margin-left: -600px;
}
.textcenter{
  width: 20%;
  height: 30%;
  position: absolute;
  margin-top:50%;
  margin-left: -650px;
  font-size: 30px;
  text-align:center;
}
 </style> 
</head>
<body>
	<%@ include file="../common/헤더.jsp" %>
	 <div class="d-flex flex-column flex-shrink-0 p-3  side-bar" >
      <ul class="nav nav-pills flex-column mb-auto" style="margin-top:110%;">
        <li class="nav-item">
          <a href="<%= contextPath %>/list.no" class="nav-link" style=" border-bottom: 1px solid black; border-radius: 0px;">
            <font style="vertical-align: inherit; font-size: 30px;"><font style="vertical-align: inherit;">
            공지사항
          </font></font></a>
        </li>
        <br><br>
        <% if(loginUser != null && !(loginUser.getUserId().equals("admin"))){ %>
        <li>
          <a href="<%= contextPath %>/views/notice/Question.jsp" class="nav-link" style=" border-bottom: 1px solid black; border-radius: 0px;">
            <font style="vertical-align: inherit; font-size: 30px;"><font style="vertical-align: inherit;">
            문의하기
          </font></font></a>
        </li>
        <%} %>
        <br><br>
        <% if(loginUser != null && !(loginUser.getUserId().equals("admin"))){ %>
        <li>
          <a href="<%= contextPath %>/views/notice/Report.jsp" class="nav-link" style="color:blue; border-bottom: 1px solid black; border-radius: 0px;">
            <font style="vertical-align: inherit; font-size: 30px;"><font style="vertical-align: inherit;">
            신고하기
          </font></font></a>
        </li>
        <%} %>
      </ul>
      <hr>
      <div class="dropdown">
        <% if(loginUser != null){ %>
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="<%=contextPath %>/views/img/uproadfiles/item2.jfif" alt="" width="32" height="32" class="rounded-circle me-2">
          <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit; color: black"><%=loginUser.getUserName() %></font></font></strong>
        </a>
        <% }else{ %>
          <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
          <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit; color: black">익명의 서포터님</font></font></strong>
        </a>
        <% } %>
      </div>
    </div>
      <img class="img-notice" src="../img/businessman-pressing-smiley-face-emoticon-260nw-1107796946.jpg">
    <div>&nbsp;</div> 
    <div class="QA-title">신고하기</div>
    <div>&nbsp;</div>
    <div style="display:flex; margin-top:-120px;">
    <div class="QA">
      <form id="report-form" action="<%=contextPath %>/report.bo" method="post" enctype="multipart/form-data">
        <table class="list-area" style="margin-top:80px;">
          <tr>
            <td style="width: 150px;"><b>신고구분</b></td>
            <td><input type="radio" name="report-category" id="stop" value="stop">
              <label for="stop" style="width: 130px;">게시 중단 요청</label></td>
            <td><input type="radio" name="report-category" id="bad" value="bad" style="margin-left: -230px;">
              <label for="bad" style="width: 140px;">유해 게시물 신고</label></td>
            <td><input type="radio" name="report-category" id="seller" value="seller" style="margin-left: -100px;">
              <label for="seller" style="width: 90px;">셀러 신고</label></td>
          </tr>
          <tr>
            <td><b>제목</b><span style="font-size: 15px; color:rgb(52, 162, 202);">(필수)</span></td>
            <td><input type="text" name="title" style="width: 400px;" placeholder="신고제목을 적어주세요" required></td>
          </tr>
          <tr>
          	<td><b>신고대상</b><span style="font-size: 15px; color:rgb(52, 162, 202);">(필수)</span></td>
            <td><input type="text" name="target" style="width: 400px;" placeholder="신고대상 아이디를 정확히 입력해주세요" required></td>
          </tr>
          <tr style="height: 200px;">
            <td><b>신고내용</b><span style="font-size: 15px; color:rgb(52, 162, 202);">(필수)</span></td>
            <td><textarea name="content" style="resize: none; width: 400px; height: 80%;" placeholder="신고내용을 적어주세요" required></textarea></td>
          </tr>
          <tr style="height: 150px;">
            <td><b>구비서류</b><span style="font-size: 15px; color:rgb(52, 162, 202);">(필수)</span></td>
            <td>
              <br>
              <input type="file" name="file1" required><br>
              <span style="font-size:15px; color:rgb(52, 162, 202);">신고자 신분증 파일을 제출해주세요</span><br><br>
              <input type="file" name="file2" required><br>
              <span style="font-size:15px; color:rgb(52, 162, 202);">신고 증빙 자료를 제출해주세요</span>
            </td>
          </tr>
          <tr>
            <td><b>개인정보 수집 및 이용에 대한 안내</b><span style="font-size: 15px; color:rgb(52, 162, 202);">(필수)</span></td>
            <td><input type="checkbox" name="agree" id="agree" required>
              <label for="agree">&nbsp;개인정보 수집 및 이용에 동의합니다</label>
            </td>
            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteForm">전문 보기</button></td>
          </tr>
          <tr style="text-align: center;">
            <td colspan="2">
              <button type="button" class="btn btn-secondary">취소</button>
              <button type="submit" class="btn btn-primary">제출</button>
            </td>
          </tr>
           <%if(loginUser != null){ %>
      		<tr style="border-bottom:0px;">
      			<td><input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>"></td>
      			<td><input type="hidden" name="userId" value="<%=loginUser.getUserId() %>"></td>
      			<td><input type="hidden" name="userEmail" value="<%=loginUser.getEmail() %>"></td>
      		</tr>
      	  <%} %>
        </table>
      </form>
    </div>
    <div>
      <div>
        <img class="apeach" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMzFfMzUg%2FMDAxNjgwMjUxMzY2Mzg2.Evc4eSo1EItLqlzMXprEDhLMOJQMNbahKPSI4O-qDYsg.qw_wQhuMQrTS9UqkdQb8jaDW3AtUOhYCMJT43b-LUOQg.PNG.dladbsdk85%2Fimage.png&type=sc960_832">
      </div>
      <div>
        <img class="callcenter" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMDdfMjQy%2FMDAxNjE1MTAyMDg2NzU1.kHU4kvoOSacXydqfakDiVifPn0MkTM52WYFU29OYMMMg.p8toYVryCCVJH32ERCb68D4Ci8KC1Yi5cLbBRWSTwsUg.JPEG.taein96%2F%25BB%25F3%25B4%25E3%25BF%25F8.jpg&type=sc960_832">
      </div>
      <div>
        <p class="textcenter">
          <b>상담 가능 시간<br>
          평일 오전 9시 ~ 오후 6시<br> 
          (주말, 공휴일 제외)</b>>
        </p>
      </div>
    </div>
  </div>

  	<!-- The Modal -->
  	<div class="modal" id="deleteForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header" style="border-bottom:2px solid black;">
	        <h4 class="modal-title">개인정보 수집 및 이용에 대한 안내</h4>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="left">
	        <table border="1">
	          <tr>
	            <th>
	              <b>펀딩 사이트 유토피아에서 
	                제공하는 플랫폼에서는 개인정보 수집, 이용 처리에 있어 아래의 사항을 
	                정보주체에게 안내합니다.</b>
	            </th>
	          </tr>
	          <tr>
	            <td>
	              1. 개인정보 수집 및 이용목적<br>
	            </td>
	          </tr>
	          <tr>
	            <td>
	              - 제품소개, 파트너쉽/컨설팅/영업 요청상담 등 고객문의 처리
	            </td>
	          </tr>
	          <tr>
	            <td>
	              - 산업안전보건법 상 고객의 폭언 등으로 인한 건강장해 예방 조치 및 제재 처리
	            </td>
	          </tr>
	          <tr>
	            <td>
	              2. 수집하는 개인정보의 항목
	            </td>
	          </tr>
	          <tr>
	            <td>
	              - [필수] 메일주소, 휴대폰번호
	            </td>
	          </tr>
	          <tr>
	            <td>
	              3. 개인정보의 보유 및 이용기간
	            </td>
	          </tr>
	          <tr>
	            <td>
	              <b>- 관련법령에 따라 3년간 보관 후 삭제</b>
	            </td>
	          </tr>
	          <tr>
	            <td>
	              그 밖의 사항은 NAVER Cloud Platform 개인정보처리방침을 준수합니다.
	            </td>
	          </tr>
	        </table>
			<form action="" method="post">
	          <table align="center">
	            <tr>
	              <th>
	                <br>
	                 <button type="button" class="btn btn-primary"  onclick="agree()" data-dismiss="modal">동의</button>
	                 <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
	              </th>
	            </tr>
	          </table>
			</form>
		  </div>
	    </div>
	  </div>
	</div>
	<script>
		function agree(){
			var checkbox = document.getElementById("agree");
		    checkbox.checked = true;
		};
	</script>
</body>
</html>