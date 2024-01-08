# SEMI-PROJECT-FUNDABLE
JSP+SERVLET 기반 펀딩사이트

## 🖥️ 프로젝트 소개
와디즈를 메인으로 여러 펀딩사이트를 참고하여 만든 사이트입니다.
<br>

## 🕰️ 개발 기간
* 23.06.19일 - 23.07.19일

### 🧑‍🤝‍🧑 맴버구성
 - 팀장  : 이정완 - 회원가입, 메인페이지 기능, 공지사항, 헤더(검색), 프터, 셀러페이지 등록시 조건제어, 전체 페이지 통합 및 에러수정, 1대1 문의, 1대1 신고, 간단한 QnA UI창
 - 팀원1 : 차재현 - 로그인, 마이 페이지, 회원정보수정, 펀딩상품 조회/예약 취소, 찜한상품 상세 조회, 문의 내역 조회
 - 팀원2 : 이준호 - 셀러페이지, 메인페이지CSS 및 전체적인 CSS 구상, 프로젝트 상품등록, 프로젝트 리워드(옵션)등록, 상품 현황 조회, 상품 정산 조회
 - 팀원3 : 최정준 - 펀딩 상품 목록, 오픈예정 상품 목록, 각 상품들의 상세페이지, 결제 및 공유기능
 - 팀원4 : 신용수 - 관리자페이지, 게시판 및 목록 조회/검색, 공지사항 글 등록, 펀딩 승인 처리, 상품 삭제 관리, 회원 상태 관리, 문의 답변, 신고접수

### ⚙️ 개발 환경
- `Java 11`
- `JDK 11.0.19`
- **IDE** : Eclipse IDE 2020-09
- **Database** : Oracle DB(11g XE)

## 📌 주요 기능
#### 로그인&회원가입 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%A1%9C%EA%B7%B8%EC%9D%B8&%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85)" >상세보기 - WIKI 이동</a>
- DB값 검증
- 주소 API 연동
- 이메일 인증
- Id중복체크

#### 마이 페이지 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI 이동</a>
- 주소 API 연동
- 펀딩상품 조회/예약 취소
- 찜한상품 상세 조회
- 문의 내역 조회

#### 셀러 페이지 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%EC%85%80%EB%9F%AC%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI 이동</a>
- 프로젝트 상품등록
- 프로젝트 리워드(옵션)등록
- 상품 현황 조회
- 상품 정산 조회

#### 메인 페이지 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI이동</a>
- 추천 상품 목록 등록 및 상세보기
- 메인 상품들 이미지 슬라이드(CSS)
- 간단한 QnA창

#### 펀딩 페이지 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%ED%8E%80%EB%94%A9%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI이동</a>
- 펀딩/오픈예정 상품 목록 나열
- 각 상품들의 상세페이지 및 결제 및 공유기능

#### 고객센터 - <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%EA%B3%A0%EA%B0%9D%EC%84%BC%ED%84%B0)" >상세보기 - WIKI 이동</a> 
- 공지사항(게시판) 글 수정, 읽기, 검색
- 문의하기 등록
- 신고하기 등록

#### 관리자 페이지 <a href="https://github.com/Wan-Codeing/SEMI_PROJECT_FUNDABLE/wiki/%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5%EC%86%8C%EA%B0%9C(%EA%B4%80%EB%A6%AC%EC%9E%90%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI이동</a>
- 공지사항 글 등록
- 펀딩 승인 처리
- 상품 삭제 및 회원 상태 관리
- 문의 답변 및 신고접수
- -환불 처리
