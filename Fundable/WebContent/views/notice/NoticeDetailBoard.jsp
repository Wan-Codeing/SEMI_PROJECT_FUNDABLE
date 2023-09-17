<%@ page import="com.fun.board.model.vo.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice) session.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/공지사항 상세페이지.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
 .side-bar a{
  color:black;
}
.side-bar a:hover{
  color: gray;
}
.section_1_content {
    width: 70%;
    height: 83%;
    background-color: lightgray;
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left:100px;
}
 </style>
</head>
<body>
	<%@ include file="../common/헤더.jsp" %>
	 <div class="d-flex flex-column flex-shrink-0 p-3  side-bar" >
      <ul class="nav nav-pills flex-column mb-auto" style="margin-top:110%;">
        <li class="nav-item">
          <a href="<%= contextPath %>/list.no" class="nav-link" style="color:blue ; border-bottom: 1px solid black; border-radius: 0px;">
            <font style="vertical-align: inherit; font-size: 30px;"><font style="vertical-align: inherit;">
            공지사항
          </font></font></a>
        </li>
        <br><br>
        <% if(loginUser != null && !(loginUser.getUserId().equals("admin"))){ %>
        <li>
          <a href="<%= contextPath %>/views/notice/Question.jsp" class="nav-link" style="border-bottom: 1px solid black; border-radius: 0px;">
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
    <div class="QA-title">공지사항</div>
    <div class="outer">
      <div>
        <h2 style="margin-left: 45%; margin-top: 6%;">NOTICE</h2>
      </div>
      <div class="section_1_content" style="width:1300px; margin:auto; height:550px; margin-left:350px;">
	      <table align="center" border="1" id="table-board">
	        <tr>
	          <th width="70" rowspan="2">제목</th>
	          <td width="350" rowspan="2" ><%= n.getArticleTitle() %></td>
	          <th width="50">글번호</th>
	          <td width="120"><%= n.getArticleNo() %></td>
	        </tr>
	        <tr>
	          <th>작성일</th>
	          <td colspan="3"><%= n.getCreateDate() %></td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td colspan="3">
	            <pre style="height:400px; width: 100%; resize: none;" wrap="off" readonly ><%= n.getArticleContent() %></pre>
	          </td>
	        </tr>
	      </table>
	  </div>
      <br>
      <%@ include file="../common/챗봇.jsp" %>
      <div align="center">
        <button class="btn btn-dark btn-sm" onclick="list();">목록</button>
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        	<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteForm">삭제</button>
		<% } %>
      </div>
    </div>
	
	<!-- The Modal -->
   <div class="modal" id="deleteForm">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">게시물 삭제</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body" align="center">

         <b>삭제 후 복구가 불가능합니다. <br>정말로 삭제하시겠습니까?</b><br><br>
   
          <br>
		  <button type="submit" class="btn btn-dark btn-sm" data-dismiss="modal">취소하기</button>
          <button type="submit" class="btn btn-danger btn-sm" data-dismiss="modal" onclick="deleteBoard()">삭제하기</button>
         </div>
   
       </div>
     </div>
   </div>

	
	<script>	
	 function list(){
         location.href="<%= contextPath %>/list.no";
     };
     function deleteBoard(){
    	 location.href="<%= contextPath %>/deleteBoard.no?boardNo=<%=n.getArticleNo()%>";
     };
	</script>
</body>
</html>