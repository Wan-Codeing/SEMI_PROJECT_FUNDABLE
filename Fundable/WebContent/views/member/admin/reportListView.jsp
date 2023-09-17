<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.common.model.vo.PageInfo" %>
<%@ page import="com.fun.board.model.vo.Qa" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fun.board.model.vo.Report" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String contextPath = request.getContextPath();

  Member loginUser = (Member) session.getAttribute("loginUser");

  ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");


  PageInfo pi = (PageInfo) request.getAttribute("pi");

  int currentPage = pi.getCurrentPage();
  int startPage = pi.getStartPage();
  int endPage = pi.getEndPage();
  int maxPage = pi.getMaxPage();
%>
<html>
<head>
    <title>관리자-신고관리</title>

  <link
          rel="stylesheet"
          href="<%=contextPath%>/views/css/reportListView-style.css"
  />

  <!-- Latest compiled and minified CSS -->
  <link
          rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
  />
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<script>
		
		const msg = "<%= (String)session.getAttribute("alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
<header>
  <div class="header_wrap">
    <div></div>
    <div class="header_logout">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              width="60%"
              height="60%"
              fill="gray"
              class="bi bi-box-arrow-left"
              viewBox="0 0 16 16"
              onclick="location.href='<%=contextPath%>/main.do'"
      >
        <path
                fill-rule="evenodd"
                d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"
        />
        <path
                fill-rule="evenodd"
                d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"
        />
      </svg>
    </div>
  </div>
</header>
<div class="section">
  <div class="navi">
    <div class="navi_profile">
      <div class="admin_profile">
        <svg
                xmlns="http://www.w3.org/2000/svg"
                width="70%"
                height="70%"
                fill="gray"
                class="bi bi-person-fill"
                viewBox="0 0 16 16"
                onclick="location.href='<%=contextPath%>/views/member/admin/adminMain.jsp'"
        >
          <path
                  d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"
          />
        </svg>
      </div>
    </div>
    <div class="navi_bar">
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.me'"
      >
        회원정보관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.fu'"
      >
        펀딩신청관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.pr'"
      >
        상품관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.pa'"
      >
        결제관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.no'"
      >
        게시판관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.qu'"
      >
        문의관리
      </button>
      <button
              class="navi_btn"
              type="button"
              onclick="location.href='<%=contextPath%>/list.re'"
              style="background-color: lightgray; color: black"
      >
        신고관리
      </button>
    </div>
  </div>
  <div class="section_1">
    <div class="section_1_wrap">
      <div class="section_1_title">
        <span>신고관리</span>
      </div>
      <div class="section_1_content">
        <div class="report_list">
          <table align="center" class="list-area" style="height:20%;">
            <thead>
            <tr width="100%">
              <th width="10%">신고번호</th>
              <th width="30%">아이디</th>
              <th width="40%">신고제목</th>
              <th width="20%">신고일</th>
            </tr>
            </thead>
            <tbody id="report">
            <% if(list.isEmpty()) { %>
            <!-- 리스트가 비어있을 경우 -->
            <tr style="height:50px;">
              <td colspan="6">문의 내역이 없습니다</td>
            </tr>
            <% } else { %>
            <% for(int i = 0; i < list.size(); i++) { %>
            <tr style="height:50px;" class="report">
              <td><%=list.get(i).getReportNo()%></td>
              <td><%=list.get(i).getUserId()%></td>
              <td><%=list.get(i).getReportTitle()%></td>
              <td><%=list.get(i).getCreateDate()%></td>
            </tr>
            <% } %>
            <% } %>
            </tbody>
          </table>
          <br /><br />

          <div align="center" class="paging-area">
            <% if(currentPage != 1) { %>
            <button onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=currentPage - 1%>'">&lt;</button>
            <% } %>

            <% for(int p = startPage; p <= endPage; p++) { %>
            <% if(p != currentPage) { %>
            <button onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=p%>'"><%=p%></button>
            <% } else { %>
            <!-- 현재 내가 보고있는 페이지일 경우 클릭이 안되게끔 -->
            <button style="background-color: gray; color: black;" disabled><%=p%></button>
            <% } %>
            <% } %>

            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%=contextPath%>/list.re?currentPage=<%=currentPage + 1%>'">&gt;</button>
            <% } %>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  $(function () {
    $(".report").click(function () {
      location.href="<%=contextPath%>/detail.re?rno=" + $(this).children().eq(0).text();
    })
  });
</script>


</body>
</html>
