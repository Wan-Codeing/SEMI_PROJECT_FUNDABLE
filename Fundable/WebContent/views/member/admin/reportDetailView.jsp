<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.board.model.vo.Report" %>
<%@ page import="com.fun.product.model.vo.Image" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    Report re = (Report) request.getAttribute("re");
    Member mem = (Member) request.getAttribute("mem");
    Member target =(Member) request.getAttribute("target");
    ArrayList<Image> list =(ArrayList<Image>)request.getAttribute("list");

%>
<html>
<head>
    <title>관리자-신고상세확인</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/reportDetailView-style.css"
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
            $('#acceptButton').click(function() {
                $('#secondModal').modal('show');
            });
        });
    </script>
</head>
<body>

<!-- MEMBER Modal -->
<div
        class="modal fade"
        id="exampleModalCenter"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">
                    회원상세정보
                </h5>
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
                <div class="member-info">
                    <span>회원번호 : <%=mem.getUserNo()%></span>
                    <br /><br />
                    <span>아이디 : <%=mem.getUserId()%></span>
                    <br /><br />
                    <span>이름 : <%=mem.getUserName()%></span>
                    <br /><br />
                    <span>닉네임 : <%=mem.getUserNick()%></span>
                    <br /><br />
                    <span>활동상태 :
                        <% if(mem.getUserStatus().equals("Y")) { %>
                            정상
                        <% } else { %>
                            차단
                        <% } %>
                    </span>
                    <br /><br />
                    <span>셀러여부 : <%=mem.getSellerYN()%></span>
                    <br /><br />
                    <span>이메일 : <%=mem.getEmail()%></span>
                    <br /><br />
                    <span>휴대전화 : <%=mem.getPhone()%></span>
                    <br /><br />
                    <span>배송지 : <%=mem.getAddress()%></span>
                    <br /><br />
                    <span>관심목록 : <%=mem.getUserInterest()%></span>
                </div>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal"
                >
                    닫기
                </button>
            </div>
        </div>
    </div>
</div>

<!-- TARGET Modal -->
<div
        class="modal fade"
        id="exampleModalCenter2"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalCenterTitle2"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle2">
                    회원상세정보
                </h5>
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
            	<% if(target != null){ %>
                <div class="member-info">
                    <span>회원번호 : <%=target.getUserNo()%></span>
                    <br /><br />
                    <span>아이디 : <%=target.getUserId()%></span>
                    <br /><br />
                    <span>이름 : <%=target.getUserName()%></span>
                    <br /><br />
                    <span>닉네임 : <%=target.getUserNick()%></span>
                    <br /><br />
                    <span>활동상태 :
                        <% if(target.getUserStatus().equals("Y")) { %>
                            정상
                        <% } else { %>
                            차단
                        <% } %>
                    </span>
                    <br /><br />
                    <span>셀러여부 : <%=target.getSellerYN()%></span>
                    <br /><br />
                    <span>이메일 : <%=target.getEmail()%></span>
                    <br /><br />
                    <span>휴대전화 : <%=target.getPhone()%></span>
                    <br /><br />
                    <span>배송지 : <%=target.getAddress()%></span>
                    <br /><br />
                    <span>관심목록 : <%=target.getUserInterest()%></span>
                </div>
                <%} else{ %>
                <div class="member-info">
                    <span>일치하는 신고자 아이디가 없습니다.</span>
                </div>
                <%} %>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal"
                >
                    닫기
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 두 번째 모달창 -->
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
                <h5 class="modal-title" id="secondModalTitle">신고 접수</h5>
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
                    접수하시겠습니까?<br />
                    (접수시 신고자에게 자동으로 알림이 갑니다)
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='<%=contextPath%>/access.re?rno=<%=re.getReportNo()%>'">
                    접수
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
                <span>신고상세확인</span>
            </div>
            <div class="section_1_content">
                <div class="section1-1">
                    <table id="detail-area" align="center" border="1">
                        <tr>
                            <th width="70">신고자</th>
                            <td
                                    width="200"
                                    data-toggle="modal"
                                    data-target="#exampleModalCenter"
                            >
                                <%=re.getUserId()%>
                            </td>
                            <th width="70">대상자</th>
                            <td
                                    width="200"
                                    data-toggle="modal"
                                    data-target="#exampleModalCenter2"
                            >
                                <%=re.getReportTarget()%>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td colspan="3"><%=re.getCreateDate()%></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><%=re.getReportTitle()%></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <p style="height: 10em"><%=re.getReportContent()%></p>
                            </td>
                        </tr>
                        <% Image i1 = list.get(0); %>
                        <% Image i2 = list.get(1); %>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                            	<img src="<%=i1.getFilePath()%><%=i1.getChangeName()%>" style="width:350px; height:250px;">
                            	<img src="<%=i2.getFilePath()%><%=i2.getChangeName()%>" style="width:350px; height:250px;">
                            </td>
                        </tr>
                    </table>
                </div>
                <br />

                <div class="section1-2" align="center">
                    <button class="btn btn-secondary" onclick="toQalist()">목록</button>
                    <button class="btn btn-primary" id="acceptButton">접수</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	function toQalist(){
		location.href="<%=contextPath%>/list.re";
	};
</script>

</body>
</html>
