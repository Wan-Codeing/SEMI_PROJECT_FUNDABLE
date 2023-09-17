<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fun.common.model.vo.PageInfo" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");


    PageInfo pi = (PageInfo) request.getAttribute("pi");

    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자-회원정보관리</title>

    <link
            rel="stylesheet"
            href="<%=contextPath %>/views/css/memberListView-style.css"
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
                    <span>회원번호 : <%=list.get(i).getUserNo()%></span>
                    <br /><br />
                    <span>아이디 : <%=list.get(i).getUserId()%></span>
                    <br /><br />
                    <span>이름 : <%=list.get(i).getUserName()%></span>
                    <br /><br />
                    <span>닉네임 : <%=list.get(i).getUserNick()%></span>
                    <br /><br />
                    <span>활동상태 :
                        <% if(list.get(i).getUserStatus().equals("Y")) { %>
                            정상
                        <% } else { %>
                            차단
                        <% } %>
                    </span>
                    <br /><br />
                    <span>셀러여부 : <%=list.get(i).getSellerYN()%></span>
                    <br /><br />
                    <span>이메일 : <%=list.get(i).getEmail()%></span>
                    <br /><br />
                    <span>휴대전화 : <%=list.get(i).getPhone()%></span>
                    <br /><br />
                    <span>배송지 : <%=list.get(i).getAddress()%></span>
                    <br /><br />
                    <span>관심목록 : <%=list.get(i).getUserInterest()%></span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-target="#secondModal<%= i %>">
                    회원 삭제
                </button>
                <!-- 회원 차단 상태일때는 회원 차단 해제 버튼이 뜨게 해야함 -->
                <% if(list.get(i).getUserStatus().equals("Y")) { %>
                <button class="btn btn-warning" data-dismiss="modal" data-toggle="modal" data-target="#thirdModal<%= i %>">
                    회원 차단
                </button>
                <% } else { %>
                <button class="btn btn-warning" data-dismiss="modal" data-toggle="modal" data-target="#forthModal<%= i %>">
                    회원 차단 해제
                </button>
                <% } %>
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
                <h5 class="modal-title" id="secondModalTitle">회원 삭제</h5>
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
                    정말로 삭제하시겠습니까? (경고 : 삭제시 데이터 복구 불가)
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal" onclick="location.href='<%=contextPath%>/delete.me?mno=<%=list.get(i).getUserNo()%>'">
                    삭제
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
                <h5 class="modal-title" id="thirdModalTitle">회원 차단</h5>
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
                <div class="ban-message">정말로 차단하시겠습니까?</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='<%=contextPath%>/ban.me?mno=<%=list.get(i).getUserNo()%>'">
                    차단
                </button>
            </div>
        </div>
    </div>
</div>
<% } %>



<!-- 네 번째 모달창 -->
<% for(int i = 0; i < list.size(); i++) { %>
<div
        class="modal fade"
        id="forthModal<%= i %>"
        tabindex="-1"
        role="dialog"
        aria-labelledby="thirdModalTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="forthModalTitle">회원 차단 해제</h5>
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
                <!-- 네 번째 모달창 내용 -->
                <div class="ban-message">차단 해제하시겠습니까?</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning"  data-dismiss="modal" onclick="location.href='<%=contextPath%>/release.me?mno=<%=list.get(i).getUserNo()%>'">
                    차단 해제
                </button>
            </div>
        </div>
    </div>
</div>
<% } %>



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
                    style="background-color: lightgray; color: black"
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
    <div class="section_1">
        <div class="section_1_wrap">
            <div class="section_1_title">
                <span>회원정보관리</span>
                <div class="member_search_bar">
                    <form
                            action="<%=contextPath%>/search.me"
                            id="member-search-form"
                            method="get"
                            align="center"
                            style="margin-top:20px;"
                    >
                        <select name="category" id="search-option">
                            <option value="0">아이디</option>
                            <option value="1">이름</option>
                        </select>
                        &nbsp;
                        <input type="text" name="keyword" id="search-bar"/>
                        <div id="search-logo">
                           	<input type="submit" id="btnSubmit" style="display: none;"><label for="btnSubmit" style="display:block; width:0; height:0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="gray" class="bi bi-search" viewBox="0 0 16 16" style="margin-left:380px; margin-top:-40px;">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </label>
                        </div>
                        <input type="hidden" name="seller" id="seller">
                        <input type="checkbox" id="seller-y"/><label for="seller-y"
                            for="seller"
                    >&nbsp;셀러여부</label
                    >
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" name="banned" id="banned">
                        <input type="checkbox" id="banned-y" /><label for="banned-y"
                            for="banned"
                    >&nbsp;차단여부</label
                    >
                    </form>
                </div>
            </div>
            <div class="section_1_content">
                <div class="member_list">
                    <table align="center" class="list-area" style="height:30%;">
                        <thead>
                        <tr width="100%">
                            <th width="10%">회원번호</th>
                            <th width="30%">아이디</th>
                            <th width="20%">이름</th>
                            <th width="20%">가입일</th>
                            <th width="10%">가입상태</th>
                            <th width="10%">셀러여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if(list.isEmpty()) { %>
                        <!-- 리스트가 비어있을 경우 -->
                        <tr>
                            <td colspan="6">존재하는 멤버가 없습니다</td>
                        </tr>
                        <% } else { %>
                        <% for(int i = 0; i < list.size(); i++) { %>
                        <tr data-toggle="modal" data-target="#exampleModalCenter<%= i %>" style="height:30px;">
                            <td><%=list.get(i).getUserNo()%></td>
                            <td><%=list.get(i).getUserId()%></td>
                            <td><%=list.get(i).getUserName()%></td>
                            <td><%=list.get(i).getEnterDate()%></td>
                            <td><%=list.get(i).getUserStatus()%></td>
                            <td><%=list.get(i).getSellerYN()%></td>
                        </tr>
                        <% } %>
                        <% } %>
                        </tbody>
                    </table>
                    <br /><br />

                    <div align="center" class="paging-area">
                        <% if(currentPage != 1) { %>
                        <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=currentPage - 1%>'">&lt;</button>
                        <% } %>

                        <% for(int p = startPage; p <= endPage; p++) { %>
                        <% if(p != currentPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=p%>'"><%=p%></button>
                        <% } else { %>
                        <!-- 현재 내가 보고있는 페이지일 경우 클릭이 안되게끔 -->
                        <button style="background-color: gray; color: black;" disabled><%=p%></button>
                        <% } %>
                        <% } %>

                        <% if(currentPage != maxPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=currentPage + 1%>'">&gt;</button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#btnSubmit").click(function(){

            let seller = $("#seller-y").prop("checked")? "Y" :"N";
            let banned = $("#banned-y").prop("checked")? "N" :"Y";

            $("#seller").val(seller);
            $("#banned").val(banned);

            document.getElementById("member-search-form").submit();
        });
    });
</script>


</body>
</html>
