<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.product.model.vo.Product" %>
<%@ page import="com.fun.common.model.vo.PageInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fun.member.model.vo.Pay" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    ArrayList<Pay> payList = (ArrayList<Pay>)request.getAttribute("payList");


    PageInfo pi = (PageInfo) request.getAttribute("pi");

    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();

%>
<html>
<head>
    <title>관리자-결제관리</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/payListView-style.css"
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

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
    ></script>

</head>
<body>

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
                <span>결제관리</span>

                <div class="pay_search_wrap">
                    <div class="pay_search_bar">
                        <form action="<%=contextPath%>/search.pa" id="pay-search-form" method="get" align="center">
                            <select name="category" id="search-option">
                                <option value="0">아이디</option>
                                <option value="1">이름</option>
                                <option value="2">주문번호</option>
                            </select>
                            <input type="text" name="keyword" id="search-bar"/>
                            <div id="search-logo">
                                <input type="submit" id="btnSubmit" style="display: none;"><label for="btnSubmit" style="display:block; width:0; height:0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="gray" class="bi bi-search" viewBox="0 0 16 16" style="margin-left:380px; margin-top:-40px;">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </label>
                            </div>
                            <br />
                            <input
                                    type="radio"
                                    name="delivery"
                                    id="delivery"
                                    value=""
                                    checked
                            /><label for="delivery">&nbsp;전체</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input
                                    type="radio"
                                    name="delivery"
                                    id="delivery-prepare"
                                    value="C"
                            /><label for="delivery-prepare">&nbsp;배송준비중</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="delivery" id="delivery-ing" value="N" /><label
                                for="delivery-ing"
                        >&nbsp;배송중</label
                        >
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input
                                    type="radio"
                                    name="delivery"
                                    id="delivery-complete"
                                    value="Y"
                            /><label for="delivery-complete">&nbsp;배송완료</label>
                        </form>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" value="C" style="margin-top:35px;"/>
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" style="display: none;  "  checked>
                        <label class="form-check-label" for="flexSwitchCheckDefault" style="margin-top:30px;"
                        >환불 신청</label
                        >
                    </div>
                </div>
            </div>
            <div class="section_1_content">
                <div class="pay_list">
                    <table align="center" class="list-area" style="height:210px;">
                        <thead>
                        <tr width="100%">
                            <th width="20%">주문번호</th>
                            <th width="20%">아이디</th>
                            <th width="10%">이름</th>
                            <th width="20%">상품명</th>
                            <th width="10%">배송상태</th>
                            <th width="10%">구매일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if(payList.isEmpty()) { %>
                        <!-- 리스트가 비어있을 경우 -->
                        <tr>
                            <td colspan="6">존재하는 기록이 없습니다</td>
                        </tr>
                        <% } else { %>
                        <% for(int i = 0; i < payList.size(); i++) { %>
                        <tr style="height:30px;">
                            <td><%=payList.get(i).getOrederNo()%></td>
                            <td><%=payList.get(i).getUserId()%></td>
                            <td><%=payList.get(i).getUserName()%></td>
                            <td><%=payList.get(i).getProductTitle()%></td>
                            <td>
                                <%
                                    String delivery = "";
                                    switch (payList.get(i).getdStatus()) {
                                    case "C" : delivery = "준비중"; break;
                                    case "N" : delivery = "배송중"; break;
                                    case "Y" : delivery = "완료"; break;
                                }%>
                                <%=delivery%>
                            </td>
                            <td><%=payList.get(i).getFundingDate()%></td>
                        </tr>
                        <% } %>
                        <% } %>
                        </tbody>
                    </table>
                    <br /><br />

                    <div align="center" class="paging-area">
                        <% if(currentPage != 1) { %>
                        <button onclick="location.href='<%=contextPath%>/list.pa?currentPage=<%=currentPage - 1%>'">&lt;</button>
                        <% } %>

                        <% for(int p = startPage; p <= endPage; p++) { %>
                        <% if(p != currentPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.pa?currentPage=<%=p%>'"><%=p%></button>
                        <% } else { %>
                        <!-- 현재 내가 보고있는 페이지일 경우 클릭이 안되게끔 -->
                        <button style="background-color: gray; color: black;" disabled><%=p%></button>
                        <% } %>
                        <% } %>

                        <% if(currentPage != maxPage) { %>
                        <button onclick="location.href='<%=contextPath%>/list.pa?currentPage=<%=currentPage + 1%>'">&gt;</button>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $(".list-area>tbody>tr").click(function () {
            location.href="<%=contextPath%>/detail.pa?ono=" + $(this).children().eq(0).text();
        })
    });

    $(function () {
        // 페이지 로드 시 로컬 스토리지를 확인하여 토글 상태 복원
        var savedToggleState = localStorage.getItem("toggleState");
        if (savedToggleState === "checked") {
            $("#flexSwitchCheckDefault").prop("checked", true);
        }

        $("#flexSwitchCheckDefault").change(function() {
            if ($(this).is(":checked")) {
                localStorage.setItem("toggleState", "checked"); // 체크된 상태를 로컬 스토리지에 저장
                location.href = "<%=contextPath%>/refundList.pa?rstatus=" + $(this).val();
            } else {
                localStorage.setItem("toggleState", "unchecked"); // 체크되지 않은 상태를 로컬 스토리지에 저장
                location.href = "<%=contextPath%>/list.pa";
            }
        });
    });


</script>



</body>
</html>
