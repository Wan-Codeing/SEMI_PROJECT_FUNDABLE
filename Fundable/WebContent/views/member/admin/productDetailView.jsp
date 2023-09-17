<%@ page import="com.fun.member.model.vo.Member" %>
<%@ page import="com.fun.product.model.vo.Product, java.util.ArrayList, com.fun.product.model.vo.Image" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String contextPath = request.getContextPath();

    Member loginUser = (Member) session.getAttribute("loginUser");

    Product p = (Product)request.getAttribute("p");
    
    ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
%>
<html>
<head>
    <title>관리자-상품상세확인</title>

    <link
            rel="stylesheet"
            href="<%=contextPath%>/views/css/productDetailView-style.css"
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
                <h5 class="modal-title" id="secondModalTitle">상품 삭제</h5>
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
                    <p style="font-size: large">상품을 삭제하시겠습니까?</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='<%=contextPath%>/delete.pr?pno=<%=p.getProductNo()%>'">
                    삭제
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
                    style="background-color: lightgray; color: black"
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
        <div class="section_1_wrap" >
            <div class="section_1_title">
                <span>상품상세확인</span>
            </div>
            <div class="section_1_content" style="width:1300px; margin:auto; height:500px;">
                <div class="section1-1">
                    <table id="detail-area" align="center" border="1" style=" width:1200px; margin-left:50px; height:400px; ">
                        <tr>
                            <th width="10%">상품명</th>
                            <td width="60%"><%=p.getpTitle()%></td>
                            <th width="30%">썸네일</th>
                        </tr>
                        <tr>
                        	<%Image img = list.get(p.getProductNo() - 1); %>
                            <th>판매자</th>
                            <td style="height: 1em"><%=p.getSellerNickName()%></td>
                            <td rowspan="3" style="height: 20em"><img src="<%=img.getFilePath()%><%=img.getChangeName()%>"  style="width:360px; height:360px;]"></td>
                        </tr>
                        <tr>
                            <th>상품정보</th>
                            <td>
                    			<p><%=p.getDescription() %></p>
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
                <br />

                <div class="section1-2" align="center">
                    <button class="btn btn-secondary" onclick="toProductList()">목록</button>

                    <button class="btn btn-danger" id="refundButton">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	function toProductList(){
		location.href="<%=contextPath%>/list.pr";
	};
	function toProductDetailList(){
		location.href="<%=contextPath%>/fsi.bo?productNo=<%=p.getProductNo()%>";
	}	
</script>
</body>
</html>
