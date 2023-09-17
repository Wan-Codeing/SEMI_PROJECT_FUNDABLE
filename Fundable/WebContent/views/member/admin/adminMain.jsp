<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.fun.member.model.vo.Member" %>
<%
String contextPath = request.getContextPath();

Member loginUser = (Member) session.getAttribute("loginUser");


%>
<html>
<head>
    <title>관리자페이지</title>

    <link
            rel="stylesheet"
            href="<%=contextPath %>/views/css/adminMain-style.css"
  	>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>

<header>
    <div class="header_wrap">
        <div
        ></div>
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
<div class="content">
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
                    <!-- 나가기 버튼 누르면 main화면으로 나가기 (경로설정) -->
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
            >
                신고관리
            </button>
        </div>
    </div>
    <div class="dashboard">
        <div class="dashboard_wrap">
            <div class="dashboard_content">
                <div class="dashboard_title" onclick="location.href='<%=contextPath%>/list.me'">
                    <h3>전체 회원 수</h3>
                    <h3 id="memberCount">..</h3>
                </div>
                <div class="dashboard_title" onclick="location.href='<%=contextPath%>/list.fu'">
                    <h3>펀딩 승인 요청</h3>
                    <h3 id="fundingCount">..</h3>
                </div>
                <div class="dashboard_title" style="border : none;" onclick="location.href='<%=contextPath%>/list.qu'">
                    <h3>문의 건수</h3>
                    <h3 id="questionCount">..</h3>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $.ajax({
            url: "/Fundable/list.me",
            type: 'get',
            data : { control : "memberCount" },
            success: function(response) {
                var memberCount = response;
                $("#memberCount").text(memberCount);

            },
            error : function (req, status, error) {
                console.log(req, status, error);
            }
        });

        $.ajax({
            url: "/Fundable/list.fu",
            data:{ control : "fundingCount"},
            success: function(response) {
                var fundingCount = response;

                $("#fundingCount").text(fundingCount);

            },
            error : function (req, status, error) {
                console.log(req, status, error);
            }
        });

        $.ajax({
            url: "/Fundable/list.qu",
            data:{ control : "questionCount"} ,
            success: function(response) {
                // 응답 처리
                var questionCount = parseInt(response); // 서버에서 받은 응답을 정수로 변환
                // 필요한 로직을 여기에 작성

                $("#questionCount").text(questionCount);

            },
            error : function (req, status, error) {
                console.log(req, status, error);
            }
        });
    });
</script>

</body>
</html>
