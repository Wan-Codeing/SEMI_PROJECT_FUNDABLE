<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.common.model.vo.PageInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fun.product.model.vo.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

    ArrayList<Member> list1 = (ArrayList<Member>)request.getAttribute("list1");


    PageInfo pi = (PageInfo) request.getAttribute("pi");

    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();

%>
<html>
<head>
    <title>관리자-펀딩승인관리</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/fundingWaitList-style.css"
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

<!-- Modal -->
<% for(int i = 0; i < list.size(); i++) { %>
<div
        class="modal fade"
        id="exampleModalCenter<%= i %>"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">
                    상품상세페이지
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
                    <span>상품명 : <%=list.get(i).getpTitle()%></span>
                    <br /><br />
                    <span>카테고리 :
                    <% String category = "";
                        switch (list.get(i).getCategoryNo()) {
                        case 1 : category = "테크/가전"; break;
                        case 2 : category = "패션/잡화"; break;
                        case 3 : category = "홈/리빙"; break;
                        case 4 : category = "뷰티"; break;
                        case 5 : category = "푸드"; break;
                        case 6 : category = "스포츠"; break;
                    }%> <%= category%></span>
                    <br /><br />
                    <span>닉네임 : <%=list.get(i).getSellerNickName()%></span>
                    <br /><br />
                    <span>상품등록일 : <%=list.get(i).getEnrollDate()%></span>
                    <br /><br />
                    <span>상품소개글 : <%=list.get(i).getDescription()%></span>
                    <br /><br />
                    <span>가격 : <%=list.get(i).getPrice()%></span>
                    <br /><br />
                    <span>펀딩목표수량 : <%=list.get(i).getCount()%></span>
                    <br /><br />
                    <span>오픈희망일 : <%=list.get(i).getOpenDate()%></span>
                    <br /><br />
                    <span>종료희망일 : <%=list.get(i).getEndDate()%></span>
                    <br /><br />
                    <span>첨부파일 : </span>


                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal" data-toggle="modal" data-target="#secondModal<%= i %>">
                    펀딩 거부
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#thirdModal<%= i %>">
                    펀딩 승인
                </button>
            </div>
        </div>
    </div>
</div>
<% } %>


<!-- 두 번째 모달창 -->
<% for(int i = 0; i < list.size(); i++) { %>
<div
        class="modal fade"
        id="secondModal<%= i %>"
        tabindex="-1"
        role="dialog"
        aria-labelledby="secondModalTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="secondModalTitle">펀딩 거부</h5>
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
                <div class="delete-message">거부하시겠습니까?</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='<%=contextPath%>/deny.fu?pno=<%=list.get(i).getProductNo()%>'">
                    거부
                </button>
            </div>
        </div>
    </div>
</div>
<% } %>


<!-- 세 번째 모달창 -->
<% for(int i = 0; i < list.size(); i++) { %>
<div
        class="modal fade"
        id="thirdModal<%= i %>"
        tabindex="-1"
        role="dialog"
        aria-labelledby="thirdModalTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="thirdModalTitle">펀딩 승인</h5>
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
                <!-- 세 번째 모달창 내용 -->
                <div class="ban-message">승인하시겠습니까?</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="location.href='<%=contextPath%>/access.fu?pno=<%=list.get(i).getProductNo()%>'">
                    승인
                </button>
            </div>
        </div>
    </div>
</div>
<% } %>


<header>
    <div class="header_wrap">
        <div ></div>
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
                    style="background-color: lightgray; color: black"
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
    <div class="section_1">
        <div class="section_1_wrap">
            <div class="section_1_title">
                <span >펀딩신청관리</span>
            </div>
            <div class="section_1_content">
                <div class="funding_list">
                    <table align="center" class="list-area">
                        <thead>
                        <tr>
                            <th width="10%">대기번호</th>
                            <th width="20%">셀러닉네임</th>
                            <th width="50%">상품</th>
                            <th width="20%">신청일</th>
                        </tr>
                        </thead>
                        <tbody>
                            <% if(list.isEmpty()) { %>
                            <!-- 리스트가 비어있을 경우 -->
                            <tr>
                                <td colspan="5">펀딩 대기중인 상품이 없습니다</td>
                            </tr>
                            <% } else { %>
                            <% for(int i = 0; i < list.size(); i++) { %>
                            <tr data-toggle="modal" data-target="#exampleModalCenter<%= i %>">
                                <td><%= pi.getListCount() - i - (pi.getCurrentPage() - 1)*5 %></td>
                                <td><%=list.get(i).getSellerNickName()%></td>
                                <td><%=list.get(i).getpTitle()%></td>
                                <td><%=list.get(i).getEnrollDate()%></td>
                            </tr>
                            <% } %>
                            <% } %>
                        </tbody>
                    </table>
                    <br /><br />

                    <div align="center" class="paging-area">
                        <% if(currentPage != 1) { %>
                        <button onclick="location.href='<%=contextPath%>/list.fu?currentPage=<%=currentPage - 1%>'">&lt;</button>
                        <% } %>

                        <% for(int p = startPage; p <= endPage; p++) { %>
                        <% if(p != currentPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.fu?currentPage=<%=p%>'"><%=p%></button>
                        <% } else { %>
                        <!-- 현재 내가 보고있는 페이지일 경우 클릭이 안되게끔 -->
                        <button style="background-color: gray; color: black;" disabled><%=p%></button>
                        <% } %>
                        <% } %>

                        <% if(currentPage != maxPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.fu?currentPage=<%=currentPage + 1%>'">&gt;</button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
