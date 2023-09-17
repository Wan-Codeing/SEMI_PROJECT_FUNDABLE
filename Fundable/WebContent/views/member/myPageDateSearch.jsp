<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fun.product.model.vo.Image ,com.fun.member.model.vo.Pay, com.fun.member.model.vo.Member , java.util.ArrayList"%>
    <%
    	Image profileImg = (Image)session.getAttribute("profileImg");
    	ArrayList<Image> pList = (ArrayList<Image>) session.getAttribute("pList");
    	ArrayList<Pay> pTextList = (ArrayList<Pay>) session.getAttribute("pTextList");
    	Member addressM = (Member) session.getAttribute("addressM");
    	String address = addressM.getAddress().replace(",", "<br>");
    	String startDate =  request.getParameter("startDate");
    	String endDate = request.getParameter("endDate");
    	ArrayList<Image> searchP = (ArrayList<Image>) session.getAttribute("searchP");
    	ArrayList<Pay> searchTextList = (ArrayList<Pay>) session.getAttribute("searchTextList");
    %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">



<style>
  @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
      *{
        box-sizing: border-box;
        /* margin: 0; */
        font-family: "Pretendard";
      }
 
	nav{
		border-bottom:1px solid rgb(215, 215, 215);
	}
	
      
      /*============================================== 마이페이지 ==================================================*/

      body{
            margin: 0;
            box-sizing: border-box;
            width: clac(100vw - (100vw - 100%));
        }
        
       

      

        #mypagebanner{
            
             width: 85vw;
            height: 18vh;
            /* background-color: rgb(245, 245, 245); */
            
            display: flex;
            margin: auto;
        }

        #mypagebanner img{
            border-radius: 0.6vh;
        }

        #profile{
            width: 15vw;
            height: 100%;
            
        }

        #profile-image{
           display: flex;
           flex-direction: column;
           justify-content: center;
           align-items: center;
           height: 18vh;
        }

        #profile-image img{
          width: 6vw;
          height: 12vh;
        }

        #myname{
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            font-size: 1em;
        }

        #mypagebanner-product{
            width: 65vw;
            height: 100%;
            
        }

        #mypagebanner-product *{
            list-style: none;
            font-size: 1.2em;
            font-weight:bold;
            margin-bottom: 1.5vh;
        }

        #mypagebanner-product img{
            width: 6vw;
            height: 9vh;
        }

        #mypagebanner-product-list{
            display: flex;
            justify-content: space-around;
        }

        #mypagebanner-btn{
            width: 17vw;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: end;
        }

        #seller-page-change{
            width: 9vw;
            height: 4.5vh;
            border-radius: 1vh;
            font-size: 0.9em;
            font-weight: bold;
            background-color: gray;
            color: white;
            border: 1px solid rgb(86, 86, 86);
            margin: 4vh 0 2vh 0;
        }

        #mypage-logout{
            width: 6vw;
            height: 5vh;
            border-radius: 1vh;
            background-color: rgb(223, 224, 224);
            border: 1px solid rgb(86,86,86);
            font-size: 14px;
            font-weight: bold;
            color: rgb(104, 97, 97);
        }

        #mypagebanner-wrap{
          width: 100%;
          background-color: rgb(245, 245, 245);
          border: 1px solid rgb(215, 215, 215);
          margin-top: 10.7vh;
        }

        /*============================================================   마이페이지 배너 밑에 ==========================================*/
        #push-detail{
          margin: 4vh 7vw 1vh 0;
        }

        #mypage-list{
          width: 14vw;
          display: flex;
          flex-direction: column;
         /* background-color: red; */
         
        }

        #mypage-list ul,h4{
          list-style: none;
          padding-left: 0;
          margin-top: 1.5vw;
          font-weight: bold;
        }

        #mypage-list a{
          color: #9b9a9a;
        }
        
        #mypage-list a:hover{
          color: blue;
        }

        #mypage-list li, a{
          margin-top: 1.2vw;
          font-size: 15px;
          text-decoration: none;
          margin-left: 0.1vw;
          color: black;
           
        }

        #mypage-content-wrap{
          display: flex;
          width:85vw;
          margin: 0 auto 15vh;
        }

        #mypage-content{
          width: 71vw;
          
        }

        #fun-wrap{
          width: 100%;
          height: 7vh;
          display: flex;

        }

        #funding-history{
          background-color: rgb(245, 244, 244);
        }

        #funding-history-btn,#wish-list-btn{
          background-color: rgb(230, 230, 230);
        }

        #funding-history{
          border-radius: 1vw;
          border-top-left-radius: 0%;
          width: 71vw;
          height: 164.3vh;
          border: 1px solid #d0cfcf;
        }

        #funding-history-btn{
          width: 6vw;
          height: 6.5vh;
          border: 1px solid #d0cfcf;
          border-top-left-radius: 1vw;
          border-top-right-radius: 1vw;
          text-align: center;
          padding-top: 0.5vw;
          margin-bottom: -0.1vw;
          margin-left: -0.1vw;
          border-bottom: none;
          font-weight: bold;
        }
        
        #wish-list-btn{
          width: 6vw;
          height: 5vh;
          border: 1px solid #d0cfcf;
          border-top-left-radius: 1vw;
          border-top-right-radius: 1vw;
          margin-left: 0.6vw;
        margin-bottom: -0.1vw;
         
          text-align: center;
          padding-top: 1vh;
          border-bottom: none;
          font-weight: bold;
        }
        #date-search{
          width: 59vw;
          padding-top: 1.5vh;
        }
        #ha{
          margin-top: 0;
          display: flex;
          align-items: end;
        }
        #ha:hover{
          color: black;
        }

       #funding-history-header1{
        width: 6vw ;
       }

       #funding-history-header2{
        width: 37vw ;
       }

       #funding-history-header3{
        width: 10vw ;
       }

       #funding-history-header4{
        width: 9vw ;
       }
       
       #funding-history-header5{
        width: 9vw ;
        border-top-right-radius: 1vw;
       }

       #funding-history-header1,
       #funding-history-header2,
       #funding-history-header3,
       #funding-history-header4,
       #funding-history-header5{
        background-color: rgb(230, 230, 230);
       }

        #funding-history tr{
          border-bottom: 1px solid #dfdede;
        }

        #funding-history tbody tr:hover{
          background-color: #ebeaea;
        }

        #mypage-fun-state{
          font-weight: bold;
          font-size: 0.8em;
        }

        #funding-history table{
          text-align: center;
        }

        #funding-history tbody>tr{
        height: 16vh; 
        }

        .form-select{
          font-size: 10px; !important
          background-color: rgb(245, 244, 244);
        }

        tbody img{
          width: 7vw;
          height: 12vh;
          border-radius: 5px;
        }

        #product_info{
          /* background-color: red; */
          display: flex;
          text-align: left;
          height: 100%;
          margin: 0;
        }
        
        #mypage-product-brand{
          margin-bottom: 0;
          
          font-weight: bold;
        }

        #mypage-product-brand a{
          font-size: 0.8em;
        }

        #mypage-product-brand a:hover{
          text-decoration: underline;
        }
        
        #mypage-product-title a{
          font-weight: bold;
          font-size: 0.9em;
        }
        
        #mypage-product-title a:hover{
          text-decoration: underline;
          
        }

        #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
        }

        #mypage-product-option{
         
          margin-bottom: 0;
          font-size: 0.7em;
          color: #707070;
          font-weight: 900;
        }

       

        #mypage-product-textwrap{
          padding-left: 0.3vw;
        }

        #mypage-product-orderno{
          font-weight: bold;
        }

        #mypage-product-orderno:hover{
          cursor: pointer;
          color: rgb(26, 26, 228);
          text-decoration: underline;
        }
        #modal-body-wrap{
          display: flex;

        }
        #modal-img{
          width: 15vw;
          height: 20vh;
          border-radius: 10px;
        }

        .modal-body td{
          width: 16vw;
        }
        
          #ha{
			color:black;
		}
		#mypage-product-title>a{
			color:black;
		}
		a{
			text-decoration:none !important;
		}

		#mins{
			margin-top:25px;
		}     
		#mins2{
			margin-top:0px;
		}
		.d-flex{
			margin-top:20px;
		}
		#mins3{
			height:50px;
		}

    </style>

    
    
 
  </head>
  <body>
    
<script>
		const msg = "<%= (String) session.getAttribute( "alertMsg") %>";
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준 후 session에 담긴 해당 메세지는 지워줘야한다.
			// 안그럼, menubar.jsp가 로딩될때마다 항상 메세지가 뜰것..
			<% session.removeAttribute("alertMsg");%>
		}
		
	</script>


  <%@ include file="/views/common/헤더.jsp" %>



<!-- 배너 부분 -->
<div id="mypagebanner-wrap">
  <div id="mypagebanner">
  
    <div id="profile">
    
		<% if(profileImg.getChangeName() != null){ %>
        <div id="profile-image"><img src="<%= contextPath %>/<%= profileImg.getFilePath() + profileImg.getChangeName()%>" >
		<%} else{%>
        <div id="profile-image"><img src="https://www.thechooeok.com/common/img/default_profile.png" >
        <%} %>
            <div id="myname"><span><%= loginUser.getUserName()%>님</span></div>
            
          </div>
        </div>

        <div id="mypagebanner-product">

            <div style="padding-left: 6.5%; margin-top: 1.5%;">최근 본 상품</div>
            <ul id="mypagebanner-product-list">
              
                 <li>
                    <a href="<%=contextPath%>/fsi.bo?productNo=27"><img src="views/img/뷰티27.jpg" alt="" ></a>
                 </li>

                 <li>
                    <a href="<%=contextPath%>/fsi.bo?productNo=4"><img src="views/img/테크4.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href="<%=contextPath%>/fsi.bo?productNo=42"><img src="views/img/스포츠42.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href=" <%=contextPath%>/fsi.bo?productNo=17"><img src="views/img/홈17.jpg" alt="" ></a>
                 </li>

                 <li>
                     <a href="<%=contextPath%>/fsi.bo?productNo=10"><img src=views/img/패션10.jpg alt="" ></a>
                 </li>

             </ul>

        </div>     

        <div id="mypagebanner-btn">

             <form action="<%= contextPath %>/IngProject" method="get"><input type="submit" name="" id="seller-page-change" class="btn btn-outline-secondary"  value="셀러페이지 전환"></form>

        </div>

</div>
</div>
<!-- 배너 부분  끝 -->

<!-- 알림내역 -->
<div align="right" id="push-detail">
  
  <button type="button" class="btn btn-outline-secondary " style="visibility:hidden;">
    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
      <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
    </svg>&nbsp;
    알림 내역</button>

</div>
<!-- 알림내역 끝-->


<!-- 마이페이지 컨텐츠부분 감싸는 div-->
<div id="mypage-content-wrap">


<!-- 마이페이지 리스트 -->
<div id="mypage-list">
  
  <h2 style="font-weight: bold;">My Page</h2>
  <ul><h4>펀딩정보</h4>
    <li><a href="<%= contextPath %>/myPage.me" style="color: blue;">펀딩 내역</a></li>
    <li><a href="<%= contextPath %>/wish.me">찜한 내역</a></li>
    <li><a href="<%= contextPath%>/delivery.me">배송 조회</a></li>
  </ul>
  <ul><h4>개인정보</h4>
    <li><a href="<%= contextPath %>/check.me">기본 정보 설정</a></li>
    <li><a href="<%= contextPath %>/address.me">주소지 설정</a></li>
  </ul>
  <ul><h4>문의정보</h4>
    <li><a href="<%= contextPath%>/qa.me">문의 내역</a></li>
  </ul>

</div>
<!-- 마이페이지 리스트 끝 -->

<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content">

  <!-- 펀딩내역 상단 랩-->
  <div id="fun-wrap">
    <a href="<%= contextPath %>/myPage.me" id="ha"><div id="funding-history-btn"  >펀딩 내역 <br> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
      <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
    </svg></div></a>
    <a href="<%= contextPath %>/wish.me" id="ha"><div id="wish-list-btn">찜한 내역</div></a>
    <div align="right" id="date-search" >
      <form action="<%= contextPath %>/dateSearch.me" method="post">
      <input type="date" name="startDate" id="" value="<%= startDate %>"> ㅡ
      <input type="date" name="endDate" id="" value="<%= endDate %>">
      <button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
      </svg></button>
      </form>
    </div>
  </div>
  <!-- 펀딩내역 상단 랩끝-->

  <!-- 펀딩내역 컨텐츠부분-->
  <div id="funding-history">
    
    <table >

        <thead>
          <tr>
              <th id="funding-history-header1">
               <!--  <select style="font-size:10px" class="form-select" style="width: 6.1vw;" size="1" aria-label="Default select example">
                  <option selected>&nbsp;펀딩현황</option>
                  <option value="진행중">&nbsp;진행중</option>
                  <option value="펀딩성공">&nbsp;펀딩성공</option>
                  <option value="펀딩취소">&nbsp;펀딩취소</option>
                </select> -->
                펀딩현황
              </th>
              <th id="funding-history-header2" >상품정보</th>
              <th id="funding-history-header3" >주문번호</th>
              <th id="funding-history-header4" >참여일</th>
              <th id="funding-history-header5" >종료일</th>
          </tr>
        </thead>

        
        <tbody>
          
        
         			
         			<% if(searchP.size() > 0){ %>
           			<% for(int i = 0 ; i < searchP.size(); i++){ %>
                  <tr  <%if(searchTextList.get(i).getrStatus().equals("N") || searchTextList.get(i).getrStatus().equals("C")){ %> style="background-color:rgb(235, 235, 235); color:gray;" <%} %>>
              
                    <td id="mypage-fun-state"><!--펀딩진행상황--><% if(searchTextList.get(i).getfStatus().equals("Y") && searchTextList.get(i).getrStatus().equals("Y") ){  %>
                    	진행중
                    <%} else if(searchTextList.get(i).getrStatus().equals("N")){%>
                    	펀딩취소
                    <%} else{%>
                    	펀딩종료
                    <%} %>
                    </td>
                    
                      <td >
                        <div id="product_info">
        
                        <div> <!--상품이미지--> <a href=""> <img src="<%= contextPath %>/<%= searchP.get(i).getFilePath() + searchP.get(i).getChangeName() %>" <%if(searchTextList.get(i).getrStatus().equals("N") || searchTextList.get(i).getrStatus().equals("C")){ %> style="opacity:0.1;" <%} %>> </a></div>
                        <div id="mypage-product-textwrap">
                          <p id="mypage-product-brand" ><!--브랜드명--> <a <% if(searchTextList.get(i).getrStatus().equals("Y")){ %> href=""  <%} %> id="pb" <%if(searchTextList.get(i).getrStatus().equals("N") || searchTextList.get(i).getrStatus().equals("C")){ %> style="color:gray; text-decoration:none;" <%} %>><%= searchTextList.get(i).getSellerNickName() %></a></p>
                        <span id="mypage-product-title"><!--상품명--> <a <% if(searchTextList.get(i).getrStatus().equals("Y")){ %> href=""  <%} %> <%if(searchTextList.get(i).getrStatus().equals("N") || searchTextList.get(i).getrStatus().equals("C")){ %> style="color:gray; text-decoration:none;" <%} %>><%= searchTextList.get(i).getProductTitle()%></a></span>
                        <p id="mypage-product-option"><!--옵션-->옵션 : <%= searchTextList.get(i).getOptionName() %> &nbsp; <br> 결제금액 : <%= pTextList.get(i).getTotalPrice() %>원 </p>
                        </div>
                      </div>
                      </td>
                      <td><a id="mypage-product-orderno" <% if(searchTextList.get(i).getrStatus().equals("Y")){ %> data-bs-toggle="modal" data-bs-target="#exampleModa<%= i %>" <%} %>style="font-size: 0.8em; "><!-- 주문번호-->20239999<%= searchTextList.get(i).getOrederNo() %></a></td>
                      <td style="font-size: 0.8em; font-weight: bold;"><!--참여일--><%= searchTextList.get(i).getFundingDate() %></td>
                      <td style="font-size: 0.8em; font-weight: bold;"><!--종료일--><%= searchTextList.get(i).getEndDate() %></td>
                      
                    </tr>
                    <%} %>
                   
                    <%}else{ %>
						<td colspan="5">해당 일자에는 펀딩 참여 내역이 없습니다</td>
					<%} %>
           
        </tbody>
     
    </table>


  </div>
   <!-- 펀딩내역 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->








  







<!--========================================= 상품상세 모달창 ======================================================-->

<!-- Modal -->
<% for(int i = 0; i < searchP.size(); i++){ %>
<div class="modal fade" id="exampleModa<%= i %>" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">상품정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <!-- 모달바디 -->
          <div id="modal-body-wrap">
          <a href="" style="margin: 0;"> <img src="<%= contextPath %>/<%= searchP.get(i).getFilePath() + searchP.get(i).getChangeName() %>" id="modal-img"></a>
          <div style="margin-top: 2vh; padding-left: 1vw; width:100%" >
            <p id="mypage-product-brand" style="margin-bottom: 0.6vh;"><!--브랜드명--> <a href="" style="font-size: 15px;" id="modal-brand"><%= searchTextList.get(i).getSellerNickName() %> </a></p>
          <span id="mypage-product-title"><!--상품명--> <a href="" style="font-size: 16px;" id="modal-title"><%= searchTextList.get(i).getProductTitle() %></a></span>
          <p id="mypage-product-option" style="font-size: 11px; margin-top: 1vh; margin-bottom: 1.5vh;"><!--옵션-->옵션 : <%= searchTextList.get(i).getOptionName() %> &nbsp; <br> 결제금액 : <%= pTextList.get(i).getTotalPrice() %>원</p>
          <form align="right" action="test.do" method="post"><button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalToggleLabe<%= i%>">예약 취소</button></form>
          </div>
        </div>



        </div>
        <!-- 배송지 관리 -->
        <div class="modal-body" style="border-top: 1px solid rgb(216, 215, 215);">
          <table align="right">
            <tr >
              <td style="font-weight: bold; font-size: 18px;">배송정보
              </td>
              <td style=" font-weight: bold; font-size: 18px;">배송요청사항</td>
              <td >
             
            </td>
            </tr>

            <tr>
              <td >
                <span><%= addressM.getUserName() %></span><br>
                <span><%= addressM.getPhone() %></span><br>
                <span><%= addressM.getEmail() %></span><br>
                <span><%= address %></span>
              </td>
              <td >문앞에 두고 가주세요</td>
              <td   style="padding-bottom: 0;">
              <div  style="display: flex; justify-content:flex-end;  height:15vh; align-items:end"><button type="button" class="btn btn-secondary" onclick="location.href='<%= contextPath %>/views/member/myPageAddress.jsp'">배송지 변경</button></div>
            </td>
            </tr>
          </table>

      </div>
    </div>
  </div>
</div>

<%} %>



<!--========================================= 상품상세 모달창 끝 ======================================================-->
<% for(int i = 0; i < searchTextList.size(); i++){ %>
<!-- Modal -->
<div class="modal fade" id="exampleModalToggleLabe<%= i%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel" style="font-weight: bold;">예약 취소</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" align="center" style="font-weight: bold;">
          <img src="https://img.freepik.com/premium-vector/the-crying-face-of-the-character_763049-83.jpg?w=740" alt="" id="modal-img"> <br>
       정말 예약을 취소 하시겠습니까?
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-dark" data-bs-target="#exampleModalToggle<%= i+1 %>" data-bs-toggle="modal">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<%} %>

<% for(int i = 0; i < searchTextList.size(); i++){ %>
<div class="modal fade" id="exampleModalToggle<%= i+1 %>" aria-hidden="true" data-bs-backdrop="static" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2" style="font-weight: bold;">예약 취소 완료</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="font-weight: bold; margin: 2vh 0;">
        예약이 취소되었습니다.
        
      </div>
      <div class="modal-footer">
         <form action="<%=contextPath %>/refund.me" method="post">
         <input type="hidden" name="hiddenOrderNo" value="<%= searchTextList.get(i).getOrederNo() %>">
         <input type="hidden" name="hiddenRequest" value="refund">
         <button type="submit" class="btn btn-dark" data-bs-dismiss="modal" >확인</button>
         </form>
      </div>
    </div>
  </div>
</div>
<%} %>
 
<%@ include file="/views/common/프터.jsp" %>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
	
	$(function(){

    $("#mypage-product-orderno").click(function(){
    console.log($(this).parents().find("#pb").text());
    });
 
    
  });
	
	

</script>
</body>
</html>