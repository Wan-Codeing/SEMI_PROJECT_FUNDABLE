<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.board.model.vo.Qa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    Qa qa = (Qa) request.getAttribute("qa");
   	Member mem = (Member) request.getAttribute("mem");
%>

<html>
<head>
    <title>관리자-문의답변</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/questionReplyView-style.css"
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

    <script>
        $(document).ready(function() {
            $('#replyButton').click(function() {
                $('#secondModal').modal('show');
            });
        });
    </script>

</head>
<body>

<!-- 모달창 -->
<div
        class="modal fade"
        id="secondModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="secondModalTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="secondModalTitle">문의 답변</h5>
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 두 번째 모달창 내용 -->
                <div class="delete-message">
                    <p style="font-size: large">
                        답변을 보내시겠습니까?<br />
                        (한번 보낸 답변은 취소 및 수정이 불가능합니다)
                    </p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='<%=contextPath%>/reply.qu?qno=<%=qa.getQaNo()%>'">
                    답변등록
                </button>
            </div>
        </div>
    </div>
</div>

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
                    style="background-color: lightgray; color: black"
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
    <div class="section_1">
        <div class="section_1_wrap">
            <div class="section_1_title">
                <span>문의답변</span>
            </div>
            <div class="section_1_content">
                <div class="section1-1">
                    <table align="center" id="reply-area" border="1px" >
                        <tr>
                            <th width="100">문의자</th>
                            <td><%=mem.getUserId()%></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><%=qa.getQaTitle()%></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <p><%=qa.getQaContent()%></p>
                            </td>
                        </tr>
                        <tr>
                            <th>답변</th>
                            <td>
                    <textarea cols="100" rows="10" style="resize: none" name="reply">
                    </textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />

                <div class="section1-2" align="center">
                    <button class="btn btn-secondary" onclick="history.back();">
                        뒤로가기
                    </button>

                    <button class="btn btn-primary" id="replyButton">답변등록</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
