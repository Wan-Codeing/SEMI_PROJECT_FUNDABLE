<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.fun.board.model.vo.Qa ,com.fun.product.model.vo.Image"%>
    <%
    	ArrayList<Qa> qaList = (ArrayList<Qa>) session.getAttribute("qaList");
    Image profileImg = (Image)session.getAttribute("profileImg");
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
            margin: 9.7vh auto 15vh;
          }
  
          #mypage-content{
            width: 71vw;
            
          }
  
          #fun-wrap{
            width: 100%;
            height: 7vh;
            display: flex;
  
          }
  
        
        #nf-history{
            border-radius: 1vw;
            background-color: rgb(245, 244, 244);
            
            width: 71vw;
            height: 103.6vh;
            border: 1px solid #d0cfcf;
          }
  
  
          #nf-history table{
            text-align: center;
          }

          #nf-history th{
            background-color: rgb(230, 230, 230);
          }

          #nf-history td{
            height: 10vh;
          }
          
          #nf-history tr{
          border-bottom: 1px solid #dfdede;
          }
  
          #nf-history tbody>tr:hover{
            background-color: rgb(230, 230 , 230) !important;
          }
  
          #qa-history-header1{
            width: 11vw;
            border-top-left-radius: 1vw;
          }
         
          #qa-history-header2{
            width: 40vw;
          }
          
          #qa-history-header3{
            width: 10vw;
          }

          #qa-history-header4{
            width: 10vw;
            border-top-right-radius: 1vw;
          }
         
          #qa-title{
            font-weight: bold;
            font-size: 1em;
          }

          #qa-no{
            font-weight: bold;
            font-size: 0.9em;
          }

          #mypagebanner-product-list img:hover{
            transform: scale(1.03);
            box-shadow: 0.3vw 0.3vw  1vw 0.1vw rgb(213, 213, 213);
        }
      </style>

    
   
  </head>
  <body>
    

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




<!-- 마이페이지 컨텐츠부분 감싸는 div-->
<div id="mypage-content-wrap">


<!-- 마이페이지 리스트 -->
<div id="mypage-list">
  
  <h2 style="font-weight: bold;">My Page</h2>
  <ul><h4>펀딩정보</h4>
    <li><a href="<%= contextPath %>/myPage.me" >펀딩 내역</a></li>
    <li><a href="<%= contextPath %>/wish.me">찜한 내역</a></li>
    <li><a href="<%= contextPath%>/delivery.me">배송 조회</a></li>
  </ul>
  <ul><h4>개인정보</h4>
    <li><a href="<%= contextPath %>/check.me">기본 정보 설정</a></li>
    <li><a href="<%= contextPath %>/address.me">주소지 설정</a></li>
  </ul>
  <ul><h4>문의정보</h4>
    <li><a href="" style="color: blue;">문의 내역</a></li>
  </ul>

</div>
<!-- 마이페이지 리스트 끝 -->

<!-- 마이페이지 컨텐츠 -->
<div id="mypage-content">

  <h4 style="font-weight: bold;">문의 내역</h4>
  <br>
  <!-- 알림내역 컨텐츠부분-->
  <div id="nf-history">
    
    <table>

        <thead>
          <tr>
              <th id="qa-history-header1">문의 번호</th>
              <th id="qa-history-header2">제목</th>
              <th id="qa-history-header3">날짜</th>
              <th id="qa-history-header4">답변 여부</th>
              
          </tr>
        </thead>

        
        <tbody>
          	
          	<% if(qaList.size() > 0){ %>
          	<% for(int i = 0 ; i < qaList.size(); i++){ %>
            <tr data-bs-toggle="collapse" href="#collapseExample<%= qaList.get(i).getQaNo() %>" role="button" aria-expanded="false" aria-controls="collapseExample">
                <td id="qa-no">20239999<%= qaList.get(i).getQaNo() %></td>
                <td id="qa-title"><%= qaList.get(i).getQaTitle() %></td>
                <td><%= qaList.get(i).getCreateDate() %></td>
                
                <% if(qaList.get(i).getQaStatus().equals("N")){  %>
                	<td>답변대기</td>
                <%} else{%>
                	<td style="color:blue;">답변완료</td>
                <%} %>
                
            </tr>
            
             
              
              <tr>
           <td style="width: 0; height: 0; border: none; padding: 0; " colspan="4">
            <div class="collapse" id="collapseExample<%= qaList.get(i).getQaNo() %>">
          <div class="card card-body" style="background-color:rgb(245, 244, 244);">
             <%= qaList.get(i).getQaContent() %>
          </div>
            </div>
            </td>
           </tr>
            
            
            
         	<%}}else{ %>
        	<td colspan="4"> 문의내역이 없습니다.</td>
        <%} %>
           
        </tbody>
      
    </table>


  </div>
   <!-- 알림내역 컨텐츠부분 끝-->

  
</div>
<!-- 마이페이지 컨텐츠 끝 -->







</div>
<!-- 마이페이지 컨텐츠부분 감싸는 div끝 -->





<%@ include file="/views/common/프터.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>