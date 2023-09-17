<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <!-- 푸터  두줄 CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- CSS only  헤더 !-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<style>
    /* 헤더 css */
    .nav-logo{
          width: 140px;
          height: 30px;
        }
        .container-fluid{
          background-color: white;
        }
        .login{
          display:one;
        }
        .logout{
          display:none;
        }
        .notice-bell{
          margin-left: -30px;
          line-height: 2;
        }
        .footer-table{
        font-size: 12px;
      }
      
    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
    *{
        font-family: "Pretendard";
    }
   
    .somun{
        border-radius: 50%;
        width: 100px;
        height: 100px;
        position: sticky;
        top: 0;
        display: flex;
        justify-content: center;
        text-align: center;
        margin: auto;
        border-color: pink;
        color: beige;
        background-color: lightblue;
    }
    .main{
        display: flex;
        justify-content: center;
        width: 80%;
        margin: auto;
    }
    
    .main-left{
        width: 40%;
        height: auto;
    }
    .main-right{
        width: 35%;
        margin-left: 5%;
        height: auto;
    }
    .buy-content{
        text-align: center;
    }
    .thanks-box{
        height: 100px;
        width: 200px;
    }
    .share-content{
        text-align: center;
    }
    .share-img{
        display: flex;
        justify-content: space-between;
    }
    .share-img img{
        width: 50px;
        height: 50px;
        padding: 10px;
    }
    .gomainpage{
        text-align: center;
        margin-bottom: 50px;
    }

</style>
<body>
    <!-- 헤더 -->
        <div style="margin-top: 10px;">
            <div class="header" style="margin-top: 5px;"><nav class="navbar navbar-expand-md navbar-dark ">
                <div class="container-fluid me-4" style="margin-left: 2%;">
                  <a class="navbar-brand" href="#">
                    <img class="nav-logo" src="<%=contextPath %>/resources/img/FUNDABLE-LOGO.gif">
                  </a>
                  <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-md-0" style="margin-left: 20px;"> 
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: black;">오픈예정</a>
                          </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" style="color: black;">펀딩</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" style="color: black;">고객센터</a>
                      </li>
                    </ul>
                    <ul class="navbar-nav mb-md-0 me-4 logout">
                        <li>
                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: black;">로그인</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#" style="color: black;">회원가입</a>
                        </li>
                      </ul>
                      <ul class="navbar-nav mb-md0 me-4 login">
                        <li>
                          <a href="" class="notice-bell">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-bell" viewBox="0 0 16 16">
                              <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                            </svg>
                          </a>
                        </li>
                        <li>
                          <span style="color:gray;"><span style=" line-height: 2.5;">누구누구</span>님 환영합니다.</span>
                        </li>
                        <li>
                          <a class="nav-link" href="#" style="color: black;">로그아웃</a>
                        </li>
                        <li>
                          <a class="nav-link" href="#" style="color: black;">마이페이지</a>
                        </li>
                      </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control me-3" type="search" placeholder="검색" aria-label="검색">
                      <button class="btn btn-outline-success" style="width:100px;" type="submit">검색</button>
                    </form>
                  </div>
                </div>
              </nav></div>
    </div>

    <div class="somun"><br><br>소문내기</div>

    <div class="main">

        <div class="main-left">

            <div class="buy-content">
                <div class="buy-image">
                    <img src="resources/gift.png" alt="">
                </div>
                <div class="buy-text" style="height: auto;">
                    <br>너님 이돈 주고 이거삼
                </div>

            </div>
            <div style="display: flex; justify-content: center;">
            <button class="thanks-box">
                
               호객님의 호구짓에 감사드립니다.

            </button>
        </div>
        </div>
        <div class="main-right">

            <div class="share">

                <div class="share-content">
                    <br><br><br><br>
                    호갱님이 선택한 아이디어를 사람들과 공유해주세요 
                    공유해주신 호갱님들을 위한 특별한 선물과 이벤트가 준비되어있습니다

                </div>
                <div class="share-img">
                    <img src="resources/kakaotalk.png" alt="">
                    <img src="resources/instagram.png" alt="">
                    <img src="resources/twitter.png" alt="">
                    <img src="resources/facebook.png" alt="">
                </div>
                <div class="share-event">
                <br><br><br><br>
                    이벤트 내용 : 공유한 호갱중에 한명을뽑아서 한번더 살수 있는 기회를 드립니다! 바로 참여하세요!

                </div>
            </div>

        </div>

        
    </div>
        <!-- 푸터 -->
<footer class="py-3 my-4" style="">

    <div class="gomainpage">
        <p style="color: red;">다른 아이디어들도 둘러보시는건 어떤가요?</p>
        <a href="wadiz_이준호/wadiz/wadiz_main.html">메인 페이지로</a>
        
    </div>

    <div style="color:gray">
      <table class="footer-table" style="margin-left: 20px;">
        <tr>
          <td>FUNDABLE㈜&nbsp;&nbsp;</td>
          <td>대표이사 이준호&nbsp;&nbsp;</td>
          <td>사업자등록번호 010-87-01370&nbsp;&nbsp;</td>
          <td>통신판매업신고번호 2021-성남분당C-1153&nbsp;&nbsp;</td>
          <td>경기 성남시 분당구 판교로 242 Z동 702호&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">이메일 상담 info@FUNDABLE.kr&nbsp;&nbsp;</td>
          <td colspan="3">유선 상담 1588-6210&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td colspan="5">  © FUNDABLE Co., Ltd.&nbsp;&nbsp;</td>
        </tr>
        <tr></tr>
        <tr>
          <td colspan="5">일부 상품의 경우 와디즈는 통신판매중개자이며 통신판매 당사자가 아닙니다.</td>
        </tr>
        <tr>
          <td colspan="5"> 해당되는 상품의 경우 상품, 상품정보, 거래에 관한 의무와 책임은 셀러에게 있으므로,
            각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
          </td>
        </tr>
      </table> 
    </div>
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item" style="color:gray">이준호&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;이정완&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;차재현&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;최정준&nbsp;|</li>
      <li class="nav-item" style="color:gray">&nbsp;신용수&nbsp;</li>
    </ul>
    <p class="text-center text-muted">© 2023 Company, FUNDABLE</p>
  </footer>

    
















</body>
</html>