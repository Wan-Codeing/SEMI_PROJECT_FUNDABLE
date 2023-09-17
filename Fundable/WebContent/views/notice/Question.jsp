<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/문의하기.css">
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
          <a href="<%= contextPath %>/views/notice/Question.jsp" class="nav-link" style="color:blue; border-bottom: 1px solid black; border-radius: 0px;">
            <font style="vertical-align: inherit; font-size: 30px;"><font style="vertical-align: inherit;">
            문의하기
          </font></font></a>
        </li>
        <%} %>
        <br><br>
        <% if(loginUser != null && !(loginUser.getUserId().equals("admin"))){ %>
        <li>
          <a href="<%= contextPath %>/views/notice/Report.jsp" class="nav-link" style="border-bottom: 1px solid black; border-radius: 0px;">
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
    <div class="QA-title">문의등록</div>
    <div>&nbsp;</div>
  <div style="display:flex;">
    <div class="QA">
      <form action="<%=contextPath %>/question.bo" method="post">
      	<%if(loginUser != null){ %>
      		<input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>">
      	<%} %>
        <table class="list-area">
          <tr>
            <td><b>문의 제목</b><span style="color:red;">*</span></td>
          </tr>
          <tr>
            <td><input type="text" name="title" placeholder="문의 제목을 입력해주세요" style="width: 400px;"></td>
          </tr>
          <tr>
            <td><b>이메일 주소</b><span style="color:red;">*</span></td>
          </tr>
          <tr>
            <td><input type="text" name="email" placeholder="이메일주소를 입력해주세요" style="width: 400px;"></td>
          </tr>
          <tr>
            <td><b>문의자 유형</b><span style="color:red;">*</span></td>
          </tr>
          <tr>
            <td>
              <select style="width: 400px;" name="person">
                <option selected> - </option>
                <option  value="프로젝트를 개설한 메이커 입니다."> 프로젝트를 개설한 메이커 입니다. </option>
                <option  value="프로젝트에 참여한 서포터 입니다."> 프로젝트에 참여한 서포터 입니다. </option>
              </select>
          	</td>
          </tr>
          <tr>
            <td><b>문의사항을 알려주세요</b><span style="color:red;">*</span></td>
          </tr>
          <tr>
            <td>
              <textarea name="content" style="resize: none; width: 400px; height: 100%;"></textarea>
            </td>
          </tr>
          <tr>
            <td><b>휴대폰 번호</b><span style="color:red;">*</span></td>
          </tr>
          <tr>
            <td><input type="text" name="phone" placeholder="휴대폰 번호를 (-) 포함 해서 입력해주세요" style="width: 400px;"></td>
          </tr>
          <tr>
            <td>
              <br>
              <button type="submit" class="btn btn-primary">제출</button>
            </td>
          </tr>
        </table>
      </form>
    </div>
    <div>
      <div>
        <img class="msg-call" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20161018_270%2Fktsty_1476769018647n6Ejb_JPEG%2F%25B9%25AE%25C0%25C7%25BD%25C5%25C3%25BB.jpg&type=sc960_832">
      </div>
      <div>
        <img class="rion-msg" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDA3MTNfMTI1%2FMDAxNTk0NjEzNTYwNjIx.voYL9QyH7IWYEIue_CxRmbUck300naMQL5K62D-WlKsg.JU6B_lcpWn64_q2YFNVf5GYcTUu0i-weZqk9GVwFO5Ig.GIF%2F%25B5%25FB%25BA%25C0%25B3%25AF%25B8%25AE%25B4%25C2_%25B6%25F3%25C0%25CC%25BE%25F0.gif&type=a340">
      </div>
    </div>
  </div>
	
</body>
</html>