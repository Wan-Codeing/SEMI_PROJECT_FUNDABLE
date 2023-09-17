<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.fun.member.model.vo.Member, com.fun.member.model.vo.Pay , com.fun.product.model.vo.Image , java.text.DecimalFormat,java.text.NumberFormat,java.util.Locale"%>
    <%
    Image profileImg = (Image)session.getAttribute("profileImg");
	ArrayList<Image> pList = (ArrayList<Image>) session.getAttribute("pList");
	ArrayList<Pay> pTextList = (ArrayList<Pay>) request.getAttribute("pTextList");
	Member addressM = (Member) session.getAttribute("addressM");
	String address = addressM.getAddress().replace(",", " ");
	
	

	DecimalFormat df = new DecimalFormat("###,###");

	
	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/headers/">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
  @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
      *{
        box-sizing: border-box;
        margin: 0;
        font-family: "Pretendard";
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

        #mypage-list li,a{
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
        
        #delivery-history{
            background-color: rgb(245, 244, 244);
          border-radius: 1vw;
          width: 71vw;
          height: 111.8vh;
          border: 1px solid #d0cfcf;
        }

       
        
        #ha{
          margin-top: 0;
          display: flex;
          align-items: end;
        }
        #ha:hover{
          color: black;
        }


        #delivery-history table{
          text-align: center;
        }

       

        #delivery-headcontent{
            width: 71vw;
            height: 30vh;
        }
       
        #delivery-circle{
            width: 20vh;
            height: 20vh;
            background-color: rgb(36, 11, 83);
            border-radius: 15vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: bold;
        }

        #delivery-circle-wrap{
            display: flex;
            justify-content: space-around;
            width: 55vw;
            margin: auto;
        }

        #delivery-history-header1{
            border-top-left-radius: 1vw;
            width: 40vw;
        }
       
        #delivery-history-header2{
           
            width: 11vw;
        }

        #delivery-history-header3{
           
            width: 10vw;
        }

        #delivery-history-header4{
            border-top-right-radius: 1vw;
            width: 10vw;
        }

        #delivery-history-header1,
        #delivery-history-header2,
        #delivery-history-header3,
        #delivery-history-header4{
            background-color: rgb(230, 230, 230);
        }

        #delivery-history tbody img{
          width: 7vw;
          height: 13vh;
          border-radius: 5px;
        }

        #delivery-history tbody>tr{
        height: 18vh; 
        
        }

        #delivery-history tr{
            border-bottom: 1px solid #dfdede;
            
        }

        #delivery-history tbody tr:hover{
          background-color: #ebeaea;
        }



        #product_info{
          
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
          font-size: 0.8em;
        }

        #delivery-address{
            font-size: 0.8em;
        }

        #product_info{
            padding-left: 1vw;
        }
       
        #modal-img{
            width: 12vw;
            height: 20vh;
        }
        
        #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
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
		table a:hover{
			text-decoration:underline !important;
			color:blue !important;
		}
		table tbody tr:hover{
			 background-color: rgb(230, 230 , 230) !important;
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
    <li><a href="<%= contextPath %>/myPage.me" >펀딩 내역</a></li>
    <li><a href="<%= contextPath %>/wish.me" >찜한 내역</a></li>
    <li><a href="<%= contextPath%>/delivery.me" style="color: blue;">배송 조회</a></li>
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

 
  
      <h4>배송 조회</h4>
        <br>
    
        <div id="delivery-headcontent">

            <div id="delivery-circle-wrap">

                <div>
            <div id="delivery-circle"  >
                <div>배송 준비중</div>
            </div>
            <div style="width: 20vh; font-size: 0.8em; font-weight: bold; margin-top: 0.5vw;" align="center">
                입급확인이 완료되어<br>상품준비중입니다.
            </div>
                </div>

                <div style="display: flex; align-items: center; height: 20vh;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                        <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                      </svg>
                </div>

                <div>
                <div id="delivery-circle"  >
                <div>배 송 중</div>
            </div>
            <div style="width: 20vh; font-size: 0.8em; font-weight: bold; margin-top: 0.5vw;" align="center">배송중입니다.</div>
                </div>

                <div style="display: flex; align-items: center; height: 20vh;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
                        <path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                      </svg>
                </div>

                <div>
                <div id="delivery-circle"  >
                    <div>배 송 완 료</div>
                </div>
                <div style="width: 20vh; font-size: 0.8em; font-weight: bold; margin-top: 0.5vw;" align="center" >상품이 구매자에게<br>전달되었습니다.</div>
                </div>

            </div>

        </div>
  

  <!-- 배송지 컨텐츠부분-->
  <div id="delivery-history">

    

    <table>

        <thead>
            <tr>
            <th id="delivery-history-header1">상품정보</th>
            <th id="delivery-history-header2">주문번호</th>
            <th id="delivery-history-header3"></th>
            <th id="delivery-history-header4">진행상태</th>
        </tr>
        </thead>



        <tbody>
				
				<% if(pList.size() > 0){ %>
				<% for(int i = 0 ; i < pList.size(); i++){ %>
                <tr<%if(pTextList.get(i).getrStatus().equals("N") || pTextList.get(i).getrStatus().equals("C")){ %> style="background-color:rgb(235, 235, 235); color:gray;" <%} %>>
                  <td >
                    <div id="product_info">
    
                    <div> <!--상품이미지--> <a href=""> <img src="<%= contextPath %>/<%= pList.get(i).getFilePath() + pList.get(i).getChangeName() %>" <%if(pTextList.get(i).getrStatus().equals("N") || pTextList.get(i).getrStatus().equals("C")){ %> style="opacity:0.1;" <%} %> > </a></div>
                    <div id="mypage-product-textwrap" >
                      <p id="mypage-product-brand" ><!--브랜드명--> <a href=""><%= pTextList.get(i).getSellerNickName() %></a></p>
                    <span id="mypage-product-title"><!--상품명--> <a href="<%=contextPath %>/fsi.bo?productNo=<%= pTextList.get(i).getProductNo()%>"><%= pTextList.get(i).getProductTitle()%></a></span>
                    <p id="mypage-product-option"><!--옵션-->옵션 : <%= pTextList.get(i).getOptionName() %> &nbsp; <br> 결제금액 : <%= df.format(pTextList.get(i).getTotalPrice()) %>원<br>
                        <!--주소지--><%= address %></p>
                   
                    </div>
                  </div>
                  </td>
                  <td id="mypage-product-orderno"><!-- 주문번호-->20239999<%= pTextList.get(i).getOrederNo() %></td>
                  <td style="font-size: 0.8em; font-weight: bold;"><!--참여일-->
                 <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-dark btn-sm"<%if(pTextList.get(i).getrStatus().equals("C")) {%>disabled<%} %> data-bs-toggle="modal" data-bs-target="#staticBackdrop<%= i%>">
                         <%if(pTextList.get(i).getrStatus().equals("C")) {%>
                         	환불승인대기
                         <%}else if(pTextList.get(i).getrStatus().equals("Y")){%>
                         	환불요청
                         <%}else{ %>
                         	환불완료
                         <%} %>
                        </button>
                </td>
                  <td style="font-size: 0.8em; font-weight: bold;"><!--종료일-->
                  <%if (pTextList.get(i).getdStatus().equals("C")){ %>
                  배송준비중
				<%} else if(pTextList.get(i).getdStatus().equals("N")){%>
				  배송중
				<%} else if(pTextList.get(i).getdStatus().equals("Y")){%>
				  배송완료	
				<%} %>
                  </td>
                  
                </tr>
				
				
				
				<%} %>
				<%}  else{%>
                	<td colspan="5">배송내역이 없습니다</td>
                
                <%} %>
                
                
                
                
                
                  
        </tbody>


    </table>
        
    

    
        
      
    


      
    







  </div>
   <!-- 배송지 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->








  







<!--========================================= 상품상세 모달창 ======================================================-->


  
  <!-- Modal -->
<% for(int i = 0; i < pTextList.size(); i++){ %>
  <div class="modal fade" id="staticBackdrop<%= i%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel" style="font-weight: bold;">환불 요청</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" align="center" style="font-weight: bold;">
            <img src="https://img.freepik.com/premium-vector/the-crying-face-of-the-character_763049-83.jpg?w=740" alt="" id="modal-img"> <br>
         정말 환불을 요청 하시겠습니까?
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-dark" data-bs-target="#exampleModalToggle<%= i+1 %>" data-bs-toggle="modal">요청</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
<%} %>
<!--========================================= 상품상세 모달창 끝 ======================================================-->

<% for(int i = 0; i < pTextList.size(); i++){ %>
<div class="modal fade" id="exampleModalToggle<%= i+1 %>" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalToggleLabel2" style="font-weight: bold;">환불 요청 완료</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body" style="font-weight: bold; margin: 2vh 0;">
          환불 요청이 완료되었습니다.
        </div>
        <div class="modal-footer">
        <form action="<%=contextPath %>/refund.me" method="post">
        <input type="hidden" name="hiddenOrderNo" value="<%= pTextList.get(i).getOrederNo() %>">
        <input type="hidden" name="hiddenRequest" value="request">
          <button type="submit" class="btn btn-dark" data-bs-dismiss="modal">확인</button>
          </form>
        </div>
      </div>
    </div>
  </div>
<%} %>

<%@ include file="/views/common/프터.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>