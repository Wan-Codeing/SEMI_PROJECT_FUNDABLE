<%@ page import="java.util.ArrayList, com.fun.board.model.vo.Notice, com.fun.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="icon" href="./images/images2/favicon.png">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="views/css/공지사항.css">
 <style>
 .side-bar a{
  color:black;
}
.side-bar a:hover{
  color: gray;
}
#no-board:hover{
	background-color:white;
    cursor:default;
}
 </style>
</head>
<body>
	<%@ include file="../common/헤더.jsp" %>
	<script>
		
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
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
      <img class="img-notice" src="views/img/businessman-pressing-smiley-face-emoticon-260nw-1107796946.jpg">
    <div>&nbsp;</div> 
    <div class="QA-title">공지사항</div>
    <div>
        <form class="d-flex" role="search" action="<%=contextPath %>/searchlist.no" method="post">
            <input class="form-control me-3 notice_search" name="boardsearch" type="search" placeholder="검색" aria-label="검색" style="width:500px;">
            <button class="btn btn-primary" style="width:100px; height: 40px; margin-top:35px;" type="submit">검색</button>
        </form>
        <br>
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
			<div align="right" style="width:1590px; postion:absolute; margin-top: 20px; ">
				<a href="<%=contextPath %>/views/member/admin/noticeEnrollForm.jsp" class="btn btn-secondary">글작성</a>
			</div>
		<% } %>
        <table align="center" class="list-area table" border="1" style="width:1200px; margin-top:20px;">
          <thead>
            <tr style="background-color: darkgray;">
              <th width="50">글번호</th>
              <th width="500">제목</th>
              <th width="90">조회수</th>
              <th width="100">작성일</th>
            </tr>
          </thead>
          <tbody>
  		  <% if(list == null) { %>
				<!-- 리스트가 비어있을 경우 --> 
				<tr id="no-board">
					<td colspan="4">존재하는 공지사항이 없습니다</td>
				</tr>
		  <% } else { %>
				<% for( Notice n  :   list   ) { %>
					<tr style="line-height:5;">
						<td id="articleNo"><%= n.getArticleNo() %></td>
						<td><%= n.getArticleTitle() %></td>
						<td><%= n.getClickView() %></td>
						<td><%= n.getCreateDate() %></td>
					</tr>
				<% } %>
			<% } %> 
			</tbody>
        </table>
		<%@ include file="../common/챗봇.jsp" %>
		<!--  페이징바 -->
        <br>
        <div aria-label="Page navigation example" class="paging-area">
            <ul class="pagination justify-content-center">
            <% if(currentPage != 1) { %>
              <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.no?currentPage=<%=currentPage -1%>">Previous</a></li>
            <%} %>
          	<% for(int p = startPage; p <= endPage; p++) {%>
            	<% if(p != currentPage) { %>
              		<li class="page-item"><a class="page-link" href="<%=contextPath %>/list.no?currentPage=<%=p %>"><%=p %></a></li>
              	<% } else{ %>
              		<li class="page-item"><a class="page-link" style="color:skyblue; font-weight:bold; border: 2px solid skyblue;"><%=p %></a></li>
              	<%} %>
            <% } %>
            <% if(currentPage != maxPage){ %>
              <li class="page-item"><a class="page-link" href="<%=contextPath %>/list.no?currentPage=<%=currentPage +1%>">Next</a></li>
            <%} %>
            </ul>
        </div>
	</div>  
	
	<script>
	$(function(){
		$(".list-area>tbody>tr").click( function(){
			const ano = $(this).children().eq(0).text();
			console.log(ano);
			location.href ="<%= contextPath%>/detail.bo?ano="+ano;
		})
	})
	</script>
</body>
</html>