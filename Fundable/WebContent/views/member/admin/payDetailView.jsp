<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.member.model.vo.Pay" %>
<%@ page import="com.fun.product.model.vo.Option" %>
<%@ page import="com.fun.product.model.vo.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList, com.fun.product.model.vo.Image" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    Pay pay = (Pay) request.getAttribute("pay");
    Member mem = (Member) request.getAttribute("mem");
    Option op = (Option) request.getAttribute("op");
    Product pro = (Product) request.getAttribute("pro");
    ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
    System.out.println(mem);
%>
<html>
<head>
    <title>관리자-결제상세확인</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/payDetailView-style.css"
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
            $('#refundButton').click(function() {
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

<!-- PRODUCT Modal -->
<div
        class="modal fade"
        id="exampleModalCenter2"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true"
>
    <div
            class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
            role="document"
    >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle2">
                    상품상제정보
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
                <div class="product-info">

                    <table align="center" border="1">
                        <tr>
                            <th width="10%">상품명</th>
                            <td width="60%"><%=pro.getpTitle()%></td>
                            <th width="30%">썸네일</th>
                        </tr>
                        <tr>
                        	<%Image img = list.get(pro.getProductNo() - 1); %>
                            <th>판매자</th>
                            <td style="height: 1em"><%=pro.getSellerNickName()%></td>
                            <td rowspan="3" style="height: 20em"><img src="<%=img.getFilePath()%><%=img.getChangeName()%>"></td>
                        </tr>
                        <tr>
                            <th>상품정보</th>
                            <td>
                 		    	<p><%=pro.getDescription() %></p>
                            </td>
                        </tr>
                       <tr>
                            <th height="15px;">상세페이지</th>
                            <td colspan="2">
                   				<button class="btn btn-secondary" align="center" onclick="toProductDetailList()">상세페이지</button>
                            </td>
                        </tr>
                    </table>

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

<!-- 환불 모달창 -->
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
                <h5 class="modal-title" id="secondModalTitle">환불 승인</h5>
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
                    <p style="font-size: large">환불을 승인하시겠습니까?</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='<%=contextPath%>/delete.pa?ono=<%=pay.getOrederNo()%>'">
                    승인
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
                    style="background-color: lightgray; color: black"
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
    <div class="section_1">
        <div class="section_1_wrap">
            <div class="section_1_title">
                <span>결제상세확인</span>
            </div>
            <div class="section_1_content">
                <div class="section1-1">
                    <table id="detail-area" align="center" border="1">
                        <tr>
                            <th width="40">아이디</th>
                            <td
                                    width="200"
                                    data-toggle="modal"
                                    data-target="#exampleModalCenter"
                            >
                                <%=mem.getUserId()%>
                            </td>
                            <th width="70">주문번호</th>
                            <td width="200"><%=pay.getOrederNo()%></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><%=mem.getUserName()%></td>
                            <th>상품</th>
                            <td data-toggle="modal" data-target="#exampleModalCenter2">
                                <% String pTitle = pay.getProductTitle().substring(0,20) + "..."; %>
                                <%=pTitle%>
                            </td>
                        </tr>
                        <tr>
                            <th>결제일</th>
                            <td><%=pay.getFundingDate()%></td>
                            <th>옵션</th>
                            <td><%=op.getOptionName()%></td>
                        </tr>
                        <tr>
                            <th>펀딩현황</th>
                            <td><% String fStatus = "";
                                switch (pro.getfStatus()) {
                                case "Y" : fStatus = "펀딩진행중"; break;
                                case "N" : fStatus = "펀딩완료"; break;
                            }%>
                                <%=fStatus%>
                            </td>
                            <th>주문금액</th>
                            <td><%=pay.getTotalPrice()%>원
                            </td>
                        </tr>
                        <tr>
                            <th>환불요청</th>
                            <td colspan="3"><%=pay.getrStatus()%></td>
                        </tr>
                        <tr>
                            <th>배송자 정보</th>
                            <td colspan="3">
                                <p style="height: 6em">
                                    수신자 : <%=mem.getUserName()%><br>
                                    전화번호 : <%=mem.getPhone()%><br>
                                    배송지 : <%=mem.getAddress()%><br>
                                    발송자 : <%=pro.getSellerNickName()%><br>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />

                <div class="section1-2" align="center">
                    <a href="javascript:history.back()" class="btn btn-secondary">목록</a>

                    <button class="btn btn-primary" id="refundButton">환불</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
