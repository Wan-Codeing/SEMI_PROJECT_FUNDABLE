<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   String contextPath = request.getContextPath();
   Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <style>
        *{
          font-family: "Pretendard";
        }
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
        .nav-logo{
          width: 200px;
          height: 40px;
        }
        .container-fluid{
          background-color: white;
        }
        .notice-bell{
          margin-left: -30px;
          line-height: 2;
        }
        .ui-autocomplete {
        max-height: 4000px;
        overflow-y: auto;
        /* prevent horizontal scrollbar */
        overflow-x: hidden;
        height: auto;

      }
      .ui-menu-item div.ui-state-hover,
      .ui-menu-item div.ui-state-active {
        color: #ffffff;
        text-decoration: none;
        background-color: #f6B664;
        border-radius: 0px;
        background-image: none;
        border:none;
      }
      a{
         text-decoration: none;
      }
      .nav-link:hover{
      		color:gray !important;
      }
      .nav-link:
     </style>
</head>
<body>
   <nav class="navbar navbar-expand-md navbar-dark fixed-top" id="mins3" style="background-color:white; padding:0;">
        <div class="container-fluid me-4" style="margin-left: 2%; margin-top:12px;">
          <a class="navbar-brand" href="<%= contextPath %>/main.do">
            <img class="nav-logo" src="<%= contextPath %>/views/img/FUNDABLE-LOGO.gif">
            <span style="font-size: 20px;">UTOPIA</span>
          </a>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-md-0" style="margin-left: 20px;"> 
                <li class="nav-item">
                    
                    <a class="nav-link" href="<%=contextPath %>/ipi.bo?yn=n" style="color: black; " id="open">
                    
                    오픈예정</a>
                  </li>
              <li class="nav-item">
                <a class="nav-link" href="<%=contextPath %>/ipi.bo?yn=y" style="color: black;" id="fund">펀딩</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%= contextPath %>/list.no" style="color: black;">고객센터</a>
              </li>
            </ul>
              
              <% if(loginUser == null) {%>
              <ul class="navbar-nav mb-md-0 me-4 logout" >
                  <li class="nav-item">
                       <a class="nav-link" href="<%=contextPath %>/views/member/login.jsp" style="color: black;">로그인</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" href="<%= contextPath %>/views/member/EnrollMember.jsp" style="color: black;">회원가입</a>
                   </li>
                </ul>
           <%} else if(loginUser.getUserId().equals("admin")){ %>
               <ul class="navbar-nav mb-md0 me-4 login" >
                   <li>
                     <span style="color:gray;"><span style=" line-height: 2.5;"><%=loginUser.getUserName() %></span>님 환영합니다.</span>
                   </li>
                   <li>
                     <a class="nav-link" href="<%=contextPath %>/logout.me" style="color: black;">로그아웃</a>
                   </li>
                   <li>
                     <a class="nav-link" href="<%=contextPath %>/views/member/admin/adminMain.jsp" style="color: black;">관리자페이지</a>
                   </li>
                 </ul>
            <%} else {%>       
                 <ul class="navbar-nav mb-md0 me-4 login" id="mins2">
                   <li id="mins">
                     <span style="color:gray;"><span style=" line-height: 2.5;"><%=loginUser.getUserName() %></span>님 환영합니다.</span>
                   </li>
                   <li>
                     <a class="nav-link" href="<%=contextPath %>/logout.me" style="color: black;">로그아웃</a>
                   </li>
                   <li>
                     <a class="nav-link" href="<%=contextPath %>/myPage.me" style="color: black;">마이페이지</a>
                   </li>
                 </ul>
              <%} %>
            <form class="d-flex"  action="<%=contextPath %>/search.main" method="get">
              <input class="form-control me-3 " id="header-search" type="search" name="mainsearch" placeholder="검색" aria-label="검색">
              <button class="btn btn-outline-success" style="width:100px;" type="submit" >검색</button>
            </form>
          </div>
        </div>
      </nav>
      <script>
      var locList = [
         '이준호 잘생김',
         '신용수 노래 개잘함',
         '최정준 금수저',
         '귀살대',
         '이준호 코딩신',
         '이준호 카리스마',
         '이준호 재능충',
         '이준호 마스터',
         '이준호 논란',
         '이준호 코로나',
         '이준호 이준호?',
         '이준호 신용수',
         '이준호♥신용수 열애설?',
         '이준호 펀딩'
       ];
         var $jqs = jQuery.noConflict();
         $jqs(document).ready(function () {
         // input필드에 자동완성 기능을 걸어준다
         $jqs('#header-search').autocomplete({
           source: locList,
           focus: function (event, ui) {
             return false;
           },
           select: function (event, ui) {},
           minLength: 1,
           delay: 100,
           autoFocus: true,
         });
       });
      
      </script>
     
</body>
</html>