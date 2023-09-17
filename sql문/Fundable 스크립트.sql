DROP TABLE ANSWER;
DROP TABLE CATEGORY;
DROP TABLE IMAGE;
DROP TABLE NOTICE;
DROP TABLE PAY_HISTORY;
DROP TABLE PRODUCT;
DROP TABLE QA;
DROP TABLE REPORT;
DROP TABLE WISH_LIST;
DROP TABLE NOTIFICATION;
DROP TABLE INTEREST;
DROP TABLE SELLER;
DROP TABLE P_OPTION;
DROP TABLE MEMBER;





CREATE TABLE "WISH_LIST" (
	"USER_NO"	NUMBER		NOT NULL,
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"WISH_STATUS"	VARCHAR(1)	DEFAULT 'Y'	NOT NULL
);

CREATE TABLE "P_OPTION" (
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"OPTION_NO"	NUMBER		NOT NULL,
	"OPTION_NAME"	VARCHAR(30)		NOT NULL,
	"OPTION_PRICE"	NUMBER	DEFAULT 1	NULL,
    "OPTION_DESCRIPTION" VARCHAR2(50) NOT NULL
);

CREATE TABLE "PRODUCT" (
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"DESCRIPTION"	VARCHAR(200)		NOT NULL,
	"PRODUCT_TITLE"	VARCHAR(100)		NOT NULL,
	"PRICE"	NUMBER		NOT NULL,
	"COUNT"	NUMBER		NOT NULL,
	"FUND_PRICE"	NUMBER		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"OPEN_DATE"	DATE		NULL,
	"END_DATE"	DATE		NULL,
    "SELLER_NICKNAME" VARCHAR2(30) NOT NULL,
	"FUNDING_YN"	VARCHAR(10)	DEFAULT 'N'	NOT NULL
);



COMMENT ON COLUMN "PRODUCT"."FUNDING_YN" IS 'CHECK(N/Y/E)';

CREATE TABLE "NOTICE" (
    "ARTICLE_NO"	NUMBER		NOT NULL,
	"CLICKVIEW"	NUMBER DEFAULT 0 NOT NULL,
	"ARTICLE_TITLE"	VARCHAR(150)		NOT NULL,
	"ARTICLE_CONTENT"	VARCHAR(3000)		NOT NULL,
	"ARTICLE_CREATED_DATE"	DATE		NOT NULL
);


CREATE TABLE "IMAGE" (
	"FILE_NUMBER"	NUMBER		NOT NULL,
	"PRODUCT_NO"	NUMBER		NOT NULL,
    "USER_NO" NUMBER NOT NULL,
	"ORIGIN_NAME"	VARCHAR(200)		NOT NULL,
	"CHANGE_NAME"	VARCHAR(200)		NOT NULL,
	"FILE_SIZE"	NUMBER		NOT NULL,
	"FILE_LEVEL"	NUMBER		NOT NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"STATUS"	VARCHAR(1)	DEFAULT 'Y'	NOT NULL
);


CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR(20)		NOT NULL
);

CREATE TABLE "QA" (
	"QA_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"QA_TITLE"	VARCHAR(100)		NOT NULL,
	"QA_CONTENT"	VARCHAR(3000)		NOT NULL,
    "QA_EMAIL"  VARCHAR(300)           NOT NULL,
    "QA_PHONE"  VARCHAR(300)           NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"QA_STATUS"	VARCHAR(3)	DEFAULT 'N'	NOT NULL,
    "QA_PERSON"  VARCHAR(300) DEFAULT '프로젝트에 참여한 서포터 입니다.'        NOT NULL
);

CREATE TABLE "MEMBER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR(50)		NOT NULL,
	"USER_PWD"	VARCHAR(30)		NOT NULL,
	"USER_NAME"	VARCHAR(20)		NOT NULL,
	"USER_NICKNAME"	VARCHAR(30)		NOT NULL,
	"USER_SSG"	VARCHAR(150)		NOT NULL,
	"USER_EMAIL"	VARCHAR(300)		NOT NULL,
	"USER_ADDRESS"	VARCHAR(300)		NOT NULL,
	"USER_PHONE"	VARCHAR(100)		NOT NULL,
	"ENTER_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_INTEREST"	VARCHAR(150)		NULL,
	"USER_STATUS"	VARCHAR(3)	DEFAULT 'Y'	NOT NULL,
    "SELLER_YN" VARCHAR(5) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN "MEMBER"."USER_ID" IS 'UNIQUE';

COMMENT ON COLUMN "MEMBER"."USER_NICKNAME" IS 'UNIQUE';

COMMENT ON COLUMN "MEMBER"."USER_SSG" IS 'UNIQUE';

COMMENT ON COLUMN "MEMBER"."USER_EMAIL" IS 'UNIQUE';

COMMENT ON COLUMN "MEMBER"."USER_PHONE" IS 'UNIQUE';

COMMENT ON COLUMN "MEMBER"."USER_STATUS" IS 'CHECK(Y/N)';

CREATE TABLE "ANSWER" (
	"QA_NO"	NUMBER		NOT NULL,
	"QA_ANSWER"	VARCHAR(300)		NOT NULL,
	"ANSWER_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "PAY_HISTORY" (
	"ORDER_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"PRODUCT_TITLE"	VARCHAR(200)		NOT NULL,
	"OPTION_NO"	NUMBER		NOT NULL,
	"TOTAL_PRICE"	NUMBER		NOT NULL,
	"COUNT"	NUMBER		NOT NULL,
	"FUNDING_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FUNDING_YN"	VARCHAR(3)	DEFAULT 'Y'	NOT NULL,
    "SELLER_NICKNAME" VARCHAR2(30) NOT NULL,
	"DELIVERY"	VARCHAR(20)		NOT NULL,
	"REFUND_STATUS"	VARCHAR(3)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "PAY_HISTORY"."FUNDING_YN" IS 'CHECK(Y/N)';

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
    "USER_ID"	VARCHAR(200)		NOT NULL,
    "USER_EMAIL"	VARCHAR(300)		NOT NULL,
	"REPORT_TARGET"	VARCHAR(20)		NOT NULL,
    "REPORT_CATEGORY"	VARCHAR(300)		NOT NULL,
    "REPORT_TITLE"	VARCHAR(300)		NOT NULL,
	"CREATED_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPORT_CONTENT"	VARCHAR(3000)		NOT NULL,
	"REPORT_STATUS"	VARCHAR(3)	DEFAULT 'N'	NOT NULL
);




ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"PRODUCT_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"ARTICLE_NO"
);

ALTER TABLE "IMAGE" ADD CONSTRAINT "PK_IMAGE" PRIMARY KEY (
	"FILE_NUMBER"
);


ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "QA" ADD CONSTRAINT "PK_QA" PRIMARY KEY (
	"QA_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "ANSWER" ADD CONSTRAINT "PK_ANSWER" PRIMARY KEY (
	"QA_NO"
);

ALTER TABLE "PAY_HISTORY" ADD CONSTRAINT "PK_PAY_HISTORY" PRIMARY KEY (
	"ORDER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);



ALTER TABLE "ANSWER" ADD CONSTRAINT "FK_QA_TO_ANSWER_1" FOREIGN KEY (
	"QA_NO"
)
REFERENCES "QA" (
	"QA_NO"
);



ALTER TABLE MEMBER
ADD UNIQUE(USER_ID);

ALTER TABLE MEMBER
ADD UNIQUE(USER_SSG);

ALTER TABLE MEMBER
ADD UNIQUE(USER_PHONE);

ALTER TABLE MEMBER
ADD UNIQUE(USER_NICKNAME);






INSERT INTO CATEGORY VALUES(
    1,
    '테크/가전'
);

INSERT INTO CATEGORY VALUES(
    2,
    '패션/잡화'
);

INSERT INTO CATEGORY VALUES(
    3,
    '홈/리빙'
);
INSERT INTO CATEGORY VALUES(
    4,
    '뷰티'
);

INSERT INTO CATEGORY VALUES(
    5,
    '푸드'
);
INSERT INTO CATEGORY VALUES(
    6,
    '스포츠'
);

ALTER TABLE PRODUCT
MODIFY DESCRIPTION VARCHAR2(500);
ALTER TABLE PRODUCT
MODIFY PRODUCT_TITLE VARCHAR2(500);
ALTER TABLE PAY_HISTORY
MODIFY PRODUCT_TITLE VARCHAR2(500);

DROP SEQUENCE SEQ_PNO; /* 프로덕트 시퀀스 */
DROP SEQUENCE SEQ_MNO; /* 멤버 시퀀스 */
DROP SEQUENCE SEQ_FNO; /* 파일넘버 시퀀스 */
DROP SEQUENCE SEQ_QNO; /* QA 시퀀스 */
DROP SEQUENCE SEQ_ANO; /* 아티클 시퀀스 */
DROP SEQUENCE SEQ_ONO; /* 주문번호 시퀀스 */
DROP SEQUENCE SEQ_RNO; /* 리포트 시퀀스 */


CREATE SEQUENCE SEQ_PNO; /* 프로덕트 시퀀스 */
CREATE SEQUENCE SEQ_MNO; /* 멤버 시퀀스 */
CREATE SEQUENCE SEQ_FNO; /* 파일넘버 시퀀스 */
CREATE SEQUENCE SEQ_QNO; /* QA 시퀀스 */
CREATE SEQUENCE SEQ_ANO; /* 아티클 시퀀스 */
CREATE SEQUENCE SEQ_ONO; /* 주문번호 시퀀스 */
CREATE SEQUENCE SEQ_RNO; /* 리포트 시퀀스 */
INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '누구나 쉽게 연결할 수 있는 프리미엄 다이나믹 마이크! 사운드 전문 글로벌 브랜드 Fifine이 스튜디오급 음질을 만들어드립니다 KC인증까지 받은 품질좋은 마이크를 만나보세요',
    '피핀 다이나믹 마이크, 크리에이터부터 게이머까지｜마이크 하나로 스튜디오를',
    79000,
    499,
    39500000,
    SYSDATE,
    '2023/07/10',
    '2023/08/22',
    'Fifine',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '멀티허브 전문 브랜드 basix의 3가지 컬러, 가성비 최강 6in1 USB-C타입 멀티허브! 안써본 사람은 있어도 한번만 쓴 사람은 없다는 멀티허브 맛집♥',
    '[앵콜] 예쁜 컬러 팔방미인 멀티허브 6in1 HDMI+C타입+랜+USB',
    33800,
    500,
    16900000,
    SYSDATE,
    '2023/07/23',
    '2023/08/23',
    '멀티허브',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '무궁무진한 활용성 필요한 기능만 담았다! 캠핑 갈 때 손전등 하나로 준비 끝! 무드등,전조등, 조명등 까지 모든 기능을 한번에 3in1 멀티 후레쉬',
    '[앵콜]눈뽕주위! 보고싶어도 보지못하는 강렬함! 아이스페이스 멀티 후레쉬',
    34000,
    500,
    17000000,
    SYSDATE,
    '2023/07/24',
    '2023/08/24',
    '멀티후레쉬',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '알루미늄 소재 / 스크래치 및 밀림 방지를 위해 바닥 부분 거치대 부분 실리콘 패드를 적용했습니다. 360도 회전 가능하며, 내가 원하는 높이로 조절 가능한 노트북 회전 거치대',
    '[3만원대] 360도 회전 및 높이 조절 가능한 알루미늄 노트북 거치대',
    31500,
    500,
    15750000,
    SYSDATE,
    '2023/07/25',
    '2023/08/25',
    '미친거치대',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '쏙~ 뽁~ 톡! 이제 어려운 와인병따기는 그만! 가볍고, 콤팩트한 미니 자동 와인오프너 와이너와 함께 이제 간편하게 와인 코르크마개를 열어보세요!',
    '[와인 필수품]단 6초로 끝내는 와인 따기! 자동 와인오프너',
    29800,
    499,
    14900000,
    SYSDATE,
    '2023/07/10',
    '2023/08/10',
    '오프너장인',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '원하는 곳 어디든! 차박 캠핑러들에게 전하는 셀프튜닝용품! 초보자도 할 수 있는 초간단 DIY 모비디안 LED바 식빵등 최상의 품질로 만족감을 선사하는 플렉시블 면발광 LED 5M',
    '감성 차박 트렁크등 LED바 면발광 식빵등 DIY 세트 5M',
    12900,
    500,
    6450000,
    SYSDATE,
    '2023/07/11',
    '2023/08/11',
    '전광전자',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '와디즈 에어컨 1차 펀딩 3.4억 펀딩 성공! 작년 10만대를 판매를 기록했던 에어컨 선풍기가 더 업그레이드되어 돌아왔습니다. 빠르게 냉각되는 패드와 슬림해진 헤드사이즈!',
    '[3.4억 앵콜] 에어컨 선풍기는 처음이시죠?쿨패드의 즉각적인 시원함!',
    27900,
    500,
    13950000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5',
    '케리어 리프레시',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '이게 진짜 정품이 아니라고!? 세상에 없던 자석 탈착식 충전 기술을 개발한 원조의 기술력과 미니멀리즘의 미학이 더해져 탄생한 [맥세이프 악세서리 최종 종결자]',
    '맥세이프 악세서리 최종 종결자 미니멀 디자인 보조배터리 and 맥세이프톡',
    52900,
    500,
    26450000,
    SYSDATE,
    '2023/07/13',
    '2023/08/13',
    'Recharge',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '그동안! 캐리어 중심에 있는 핸들 때문에 울퉁불퉁! 짐 싸기 불편하셨죠? 이제는 와이드 핸들로 외관은 모던! 수납은 완벽하게! 텔로 캐리어와 함께하세요!',
    '캐리어의 숨은 공간까지 찾았다! 동급 최대 용량! 와이드 핸들 캐리어',
    125000,
    500,
    62500000,
    SYSDATE,
    '2023/07/30',
    '2023/08/30',
    '텔로 캐리어',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '평점 5.0 / 4억 주얼리 메이커의 [1%만 누리던 보석] 여름에 딱!, 6만원대로 만나는 6캐럿 달콤 천연보석 14k 목걸이',
    '[1%만 누리던 보석] 6만원대로 만나는 6캐럿 천연보석 14k 목걸이',
    68800,
    500,
    34400000,
    SYSDATE,
    '2023/07/31',
    '2023/08/31',
    '보광주얼리',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '일상과 여행에 사랑스러움을 더해보세요. 엄청난 수납력과 튼튼한 내구성으로 10년은 거뜬한 포켓 캔버스백입니다.',
    '[장마도 견뎌낼 보부상백]40년 장인이 만들어 16kg 무게도 거뜬해요!',
    129800,
    500,
    64900000,
    SYSDATE,
    '2023/08/1',
    '2023/09/1',
    '캔버스 에브리웨어',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '마크모크 TERA 인기샌들 30,000족 판매기념 펀다블 고객만을 위한 쇼킹 펀딩!(43% SALE)',
    '[4만원대]누적 3만족 판매! 여름샌들의 최강자, 남여공용 피셔맨 #테라',
    52900,
    500,
    26450000,
    SYSDATE,
    '2023/08/2',
    '2023/09/2',
    '테라',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '진짜 자신감은 속옷에서 나오죠. 이너웨어 그 자체로, 여름철 힙한 패션 아이템으로, 활동적인 운동을 할 때 그 어디서든 든든히 서포트해드릴게요.',
    '고강도 운동에도 압도적인 편안함ㅣ어디서든 입을 수 있는 멀티 이너웨어',
    295000,
    500,
    147500000,
    SYSDATE,
    '2023/07/3',
    '2023/08/3',
    '이너피스',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '국내 유일 [패션 + IT 기술]을 접목시켜 달려온 디자이너 브랜드 에이벨에서 인공지능을 적용해 “내가 만드는 나만의 티셔츠와 가방을 커스터마이징” 할 수 있도록 준비했습니다.',
    '[2만원대] 챗GPT로 만드는 나만의 옷과 가방｜생각을 글로 적어보세요',
    295000,
    500,
    147500000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4',
    'ai랩',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '[한정수량] 일반 울이 아닌 메리노울 100% 고급 원단, 10년간 여성복을 만들어 온 메이커와 30년 경력 자켓 장인이 만든 명품 자켓을 단 10만원대에 만나보세요.',
    '명품 자켓을 이 가격에 ? 10만원 대에 만나보는 100% 메리노울 자켓',
    158000,
    500,
    79000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5',
    '한성모직',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '오직 펀다블에서 만나는 반달 울템은 정확한 설계 바탕 위에 좋은 재료와 기술을 담아 올바른 가격으로 제대로 만들어 편안한 착용감의 국내 제조 뿔테 안경 반달울템을 소개해 드립니다.',
    '서포터님만의 개성과 스타일을 빛낼 다양한 컬러로 2만원대에 만나는명품안경',
    29000,
    500,
    14500000,
    SYSDATE,
    '2023/07/6',
    '2023/08/6',
    '클리어웨어',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '하이볼에 진심인, 그러나 얼음에 서툰 지인들을 위해 선물해보세요. 음료만 있으면 전문 바텐더가 될 수 있는 쥬얼아이스 스타터 킷트를 소개합니다!',
    '[8억]카빙은 필요없죠, 홈바 and 홈술 필수템. 녹지않는 쥬얼아이스의 귀환',
    99000,
    500,
    49500000,
    SYSDATE,
    '2023/08/7',
    '2023/09/7',
    '홈킷드링크',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '제발 힘들게 솔질하지말고 뿌리기만 하세요! 뿌리기만 하면 곰팡이, 물때, 찌든때가 말끔히 사라지는 초강력 곰팡이제거제',
    '솔질없이 뿌리면 사라지는 초강력 곰팡이제거제',
    7800,
    500,
    3900000,
    SYSDATE,
    '2023/08/8',
    '2023/09/8','ssg팡',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '드립백 거치대 유목민들 다 모이세요! 접어서 한손에 쏙! 두께 3mm !! 접이식 드립백 거치대 커프닉의 [접이식 드립백 거치대] 소개합니다',
    '접어서 한손에 쏙! 커프닉 접이식 드립백 거치대',
    21900,
    500,
    10950000,
    SYSDATE,
    '2023/08/9',
    '2023/09/10','오피스텔 커피',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '[잠못드는 열대야] 열을 식혀주는 자연주의 쿨링 가공, 순면 피그먼트 이불로 밤부터 아침까지 쾌적하게! 땀배출이 좋아 축축하게 깰 염려 없어요. 늘 뽀송하고 시원하게 잠드세요~',
    '빠른배송ㅣ2만원대 순면 쿨링 피그먼트 이불로 시원한 여름밤! 3억 앵콜',
    29000,
    500,
    14500000,
    SYSDATE,
    '2023/08/10',
    '2023/09/10','진성모직',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '심플하고 부드러운 미드센츄리 디자인의 스테인리스 철제 수납함. 쏘옥쏘옥 차곡차곡 정리정돈해보세요! 30-40대 여성을 위한 편리한 수납 솔루션. 공간을 더욱 세련되게 관리하세요',
    '[JVR] 미드센츄리 모던디자인! 스르륵 쏘옥쏘옥 스테인리스 철제 수납함',
    158000,
    500,
    79000000,
    SYSDATE,
    '2023/07/2',
    '2023/08/2','iron BAG',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '악취?벌레?설치만 하면 고민 끝!! 자동개폐시스템을 이용한 하수구트랩으로 자동으로 열리고 닫혀 지긋지긋 했던 악취와 벌레에서 해방되세요!',
    '[앵콜N사평점4.8]원인 모를 악취,벌레 이거 하나로 걱정 끝!',
    19900,
    500,
    9950000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4','벅스트랩',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '스트레스부터, 잘못된 자세까지 뒷골 당기는 일이 너무나도 많죠? 하루 20분, 굳어버린 뒷 목을 싹- 풀어주는 스트레칭 기능도 모자라 EMS 저주파 마사지 기능까지!',
    '뒷 목에 대고 누우면 EMS와 스트레칭을 동시에! 저주파 슬립 목마사지기',
    236000,
    500,
    118000000,
    SYSDATE,
    '2023/06/29',
    '2023/07/29','우리손 연구소',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '컴팩트한 사이즈로 어디서나 실용적으로 사용이 가능한 제품입니다. 바이닐, LP 플레이어에 최적화된 사이즈로 하단 레일 서랍 공간을 유용하게 사용할 수 있습니다.',
    '감성 수납장-따로 또 같이,활용적인 수납 공간,버터가득담은 #앙버터수납장',
    329700,
    500,
    164850000,
    SYSDATE,
    '2023/06/28',
    '2023/07/28','지오 까사',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '긁고 문대서 없애는 필링 케어는 그만!모공,각질,결 임상 확인!5.0 실사용 극찬후기! 피지 득실 득실한 나비존부터 얼굴 전체까지 모공 속 피지 쏙 각질 싹!아기모공 시절로 컴백!',
    '[6억 메이커]역대급 모공시험!물리적 각질제거STOP-돌아온 아기모공팩!',
    20000,
    499,
    10000000,
    SYSDATE,
    '2023/07/22',
    '2023/08/22','베이비스킨팜',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '가슴 관리에 쓰일 만큼, 꺼진 볼륨에 탁월한 보르피린 성분이 피부 끝까지 닿는 양은 다다익선이어야 하니까. 덕분에 내 나이 듣고 동안이라고 깜짝 놀란 사람들을 가을엔 보실 거예요.',
    '2만 원대 초반으로 눈 밑 꺼진 살과 팔자 주름, 가을 전에 끝장 봅시다',
    50000,
    500,
    25000000,
    SYSDATE,
    '2023/07/23',
    '2023/08/23','오리진스',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '기존의 비타민 앰플과 비교를 거부합니다. 단순하게 고함량만을 뛰어넘은 , 궁극의 침투력 슈퍼비타민 캡슐. 2-3일 후면 피부가 확실히 달라집니다. 피부코어를 강화 시키는 미백 앰플',
    '왜? 모두가 리뷰를 이렇게 길게, 꼭 확인해보세요! 31%순수비타민C앰플',
    40000,
    500,
    20000000,
    SYSDATE,
    '2023/07/24',
    '2023/08/24','바이오 캐슬',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '[1억메이커]3초면 됩니다 !속건조 잡는 알리오연구실의 비법을 담은 미스트!!!시간이 지나도 건조해지지 않는 유효성분98%로 촉촉 피부완성!',
    '[1억 알리오] 3초면 됩니다.유효성분98%로 촉촉 피,부,완,성!',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/25',
    '2023/08/25','물랑 비오',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    ' 와 살 것 같다! 민감성 피부를 가진 서포터분들의 피부 구원자 <사해겔> 1년만에 다시 돌아 왔습니다. 피부 진정과 극강의 수분 충전 그리고 시원한 쿨링까지!',
    '[사해소금화장품]1년만에 돌아온 피부진정 필수템ㅣ풀/햇빛/급속진정 사해겔',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/10',
    '2023/08/10','사해겔',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '제조사 요청으로 언급할 수 없지만 대형 헤어프렌차이즈 샴푸 베이스에서 전 성분만 전부 업그레이드한 샴푸입니다.',
    '헤어프렌차이즈 샴푸 베이스. 딱! 한번 1,000ml + 1,000ml',
    15000,
    499,
    7500000,
    SYSDATE,
    '2023/07/11',
    '2023/08/11','바이 파인 헤어',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '한국 여성 피부고민 TOP 3 탄력저하/주름/건조의 모든 원인은 콜라겐 산화! 꽃잎세럼이 살아있는 항산화 비타민 성분으로 꽉 막고, 손실 없도록 수분으로 꽉 잠가드릴게요.',
    '[여름피부관리필수품] 속건조+탄력케어를 진피층부터 완벽관리 세럼',
    30000,
    500,
    15000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5','아모레파티',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '[신개념 버블 트리트먼트] K-POP 아이돌의 헤어 잔혹사를 한 순간에 해결하는 국내 최정상 헤어 스타일리스트 박내주의 숨은 비법.',
    '아이돌 머릿결 비결 | 20년차 헤어스타일리스트의 버블 트리트먼트',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/13',
    '2023/08/13','내주',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '술자리 인싸템 우주고래는 소주를 우주술로 진화시켜 더 상쾌하고 특별한 맛과 향을 선사합니다. 신개념 우주술의 세계에 빠져들며 여름 휴가를 더욱 특별하게 만들어보세요.',
    '[술자리 인싸템] 여름휴가의 새로운 선택, 우주고래와 함께 특별한 경험',
    10000,
    500,
    5000000,
    SYSDATE,
    '2023/07/31',
    '2023/08/31','스페이스 잼',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '단백질 보충제, 더 이상 맛별로 구매하지 마세요! 플레인/딸기/초코/쿠키앤크림 맛을 내 맘대로 골라서 즐기는 조합형 단백질 보충제 커스틴을 만나보세요',
    '[4가지 맛 n가지 조합] 내 맘대로 골라 먹는 커스텀 단백질 보충제',
    25000,
    500,
    12500000,
    SYSDATE,
    '2023/08/1',
    '2023/09/1','푸싱 머슬',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '한 알에 무려 70억! 최초 펀딩 2,136% 달성! 서울대 연구진의 특허받은 유산균으로 구강 내 유익균과 유해균의 균형있는 환경을 만들어, 입냄새의 근본 원인을 케어해줍니다.',
    '[한알에 70억]입냄새의 근본, 속부터 케어하는 압도적 함량! 구강유산균',
    50000,
    500,
    25000000,
    SYSDATE,
    '2023/08/2',
    '2023/09/2','BIO GIVEN',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '극락가는 말랑구슬징어로 3,188% 일냈던 노란오징어 이번엔 극강의 꼬들함으로 돌아왔습니다 우리는 수분감 절대 안버리는거 아시죠? 그 비밀의 맛 아래서 확인해보세요!',
    '[완판전설] 누가 오징어를 이렇게까지 연구해요... 극락가는 오징어 2탄',
    15000,
    500,
    7500000,
    SYSDATE,
    '2023/08/3',
    '2023/09/3','해징어',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '불편한 야채손질은 그만! 간편하게 물과함께 섭취할 수 있는 야채습관ABC와 함께 새로운 야채습관을 만들어보세요~!',
    '[하루야채] 2알로 충분하게 충전하고 시작하세요!',
    3000,
    500,
    1500000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4','하루야채',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '완전 크고, 완전 달다!! 제주에서 달달~하게 자란 열대 왕망고를 만나보세요. 케이트 망고 품종으로 해외에서 맛보았던 이국적인 망고 맛이 그대로~ 신맛이 적고 달달함이 남달라요.',
    '[케이트망고] 제주에서 온 찐한 달큰함이 이국적인 왕!큰! 프리미엄 망고',
    70000,
    500,
    35000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5','케이트망고',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '다양한 품종으로 고민하고 계실 분들을 위해 품종 별 맛도리 복숭아만 골라왔어요. 아삭 말랑 쫀~득 다양한 식감을 즐길 수 있는 복숭아 3종을 만나보세요 !',
    '복숭아끝판왕 3종ㅣ아삭,쫀-득,말랑! 품종 별 최고의 복숭아만 모았어요.',
    40000,
    500,
    25000000,
    SYSDATE,
    '2023/07/6',
    '2023/08/6','정도과일',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '[홈쇼핑 완판 꿀!] 유럽 천연 감로꿀의 달콤한 건강함 꽃이 아닌 나무에서 얻는 귀한 꿀 명품 감로꿀 [로얄비 감로꿀] 펀다블 특별 프로모션으로 만나보세요!',
    '[홈쇼핑 완판꿀] 로얄비 유럽 천연 감로꿀 여름철 75% 와디즈 특별가!',
    50000,
    500,
    20000000,
    SYSDATE,
    '2023/07/7',
    '2023/08/7','허니혼',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '퍼터 전문 브랜드 굴림채에서 퍼터의 끝판왕 브룸스틱 퍼터를 출시합니다. 프로선수들의 많은 선택을 받으며 트렌드로 떠오르는 브룸스틱퍼터를 펀다블에서 제일 먼저 경험 하세요.',
    '[브룸스틱 퍼터] 두개의 그립으로 완벽한 손목 고정, 퍼터의 끝판왕!',
    300000,
    500,
    150000000,
    SYSDATE,
    '2023/08/10',
    '2023/09/10', '굴림채',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '내가 원하는 부위만 골라서 마사지 하면 근육통 완전 풀리잖아! 딱딱하지 않은 부드러운 실리콘 소재로 원하는 부위에 마사지 해보세요! 바디클래스 실리콘 마사지볼을 만나보세요~!',
    '[N사평점4.9점] 뭉친근육과 피로를 풀어주는 바디클래스 실리콘 마사지볼',
    25000,
    500,
    12500000,
    SYSDATE,
    '2023/08/9',
    '2023/09/9','스마트 케어 보르',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '펀칭백 운동을 보다 액티브하고 즐겁게 할 수 있게 종심타격 센서와 직관적인 타격데이터 디스플레이를 갖추면서도 어떠한 타격도 견딜 수 있는 견고한 구성을 갖춘 스탠딩 펀칭백',
    '내 타격에 반응하는 스마트 펀칭백',
    250000,
    490,
    125000000,
    SYSDATE,
    '2023/08/8',
    '2023/09/8','팡팡 스포츠',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '미끄러지지 않는 진짜 논슬립 그립! 스코어를 줄여주는 올바른 그립라인! 최고급 피타드 양피와 특수제작 실리콘의 만남으로 오랫동안 사용가능한 스파이더 그립 골프장갑!',
    '[ 2515%달성 앵콜] 여성 사이즈 신규 출시!스파이더 그립 골프장갑!',
    10000,
    45,
    5000000,
    SYSDATE,
    '2023/08/6',
    '2023/09/6','이준호',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '엘라스토머 보다 쫀쫀~하고, 합성고무만큼 내구성이 좋은 그립계의 단조! 프로님들께서도 한번 사용하다 보면 다른 그립 사용 못 한다고 하시네요~^^',
    'fundable 첫 공개 [100% 내추럴 라텍스] 아머스킨 포지드 골프 그립',
    25000,
    120,
    12500000,
    SYSDATE,
    '2023/06/28',
    '2023/07/28','이준호',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '골프병에 걸린 <골프환자>가 직접 연구개발한 지오브카이저 *풀컬러 올인원 골프티* 비거리/방향성/에이밍/내구성/주야겸용 거기에 볼마커 퍼팅라이까지!! 카이저골프티 하나로 핵인싸',
    '비거리 and 방향성 문제타파! 골프에 진심 미친 사람이 만든 <카이저 골프티>',
    30000,
    50,
    15000000,
    SYSDATE,
    '2023/06/30',
    '2023/07/30','이준호',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '펀다블에서만 완벽한 스트레칭을 위한 반원형 스파인 코렉터 합니다 어디에도 없는 특별구성 전용 TPE 다용도 매트를 함께 받아 보실수 있습니다',
    '한 번의 스트레칭도 제대로 할 수 있도록ㅣ압도적 시원함 스파인 코렉터',
    50000,
    300,
    25000000,
    SYSDATE,
    '2023/07/9',
    '2023/08/9','이준호',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '국내생산 기능성 원단을 사용한 압박력 좋은 무릎보호대',
    '[국내생산]에어로쿨 기능성 원단으로 제조한 얇은 무릎보호대',
    30000,
    10,
    15000000,
    SYSDATE,
    '2023/07/8',
    '2023/08/8','이준호',
    'Y'
);


UPDATE PRODUCT
SET OPEN_DATE = '2023/07/21' ,
    FUNDING_YN = 'N'
WHERE PRODUCT_NO IN(2,3,4,5,6);


INSERT INTO MEMBER VALUES(
    SEQ_MNO.NEXTVAL,
    'admin',
    'admin',
    '관리자',
    '관리자',
    '999999-999999',
    '관리자이메일',
    '관리자주소',
    '99999999999',
    SYSDATE,
    NULL,
    'Y',
    DEFAULT
);



INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'user01',
          '1234',
          '민경민',
          '민경민',
          '111111-1111111',
          'rudals@naver.com',
          '06234,서울 강남구 테헤란로14길 6,2층 C강의장',
          '010-1234-1234',
          SYSDATE,
          '푸드',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wnsgh',
          'wnsgh',
          '이준호',
          '이준호',
          '222222-2222222',
          'wnsgh@naver.com',
          '06234,서울 중구 5414길-6 6,2층 C강의장',
          '010-2222-2222',
          SYSDATE,
          '홈/리빙',
          DEFAULT,
         'Y'
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjddhks',
          'wjddhks',
          '이정완',
          '이정완',
          '333333-3333333',
          'wjddhks@naver.com',
          '06234,서울 북구 5414길-6 6,2층 C강의장',
          '010-3333-3333',
          SYSDATE,
          '홈/리빙',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wogus',
          'wogus',
          '차재현',
          '차재현',
          '444444-4444444',
          'wogus@naver.com',
          '06234,서울 동작구 5414길-6 6,2층 C강의장',
          '010-4444-4444',
          SYSDATE,
          '푸드',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjdwns',
          'wjdwns',
          '최정준',
          '최정준',
          '555555-5555555',
          'wjdwns@naver.com',
          '06234,서울 강동구 5414길-6 6,2층 C강의장',
          '010-5555-5555',
          SYSDATE,
          '푸드',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'dydtn',
          'dydtn',
          '신용수',
          '신용수',
          '666666-6666666',
          'wjdwns@naver.com',
          '06234,서울 동작구 사당동 5414길-6 6,2층 C강의장',
          '010-6666-6666',
          SYSDATE,
          '스포츠',
          DEFAULT,
          DEFAULT
);



INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    1,
    2,
    '테크1.jpg',
    '테크1.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    2,
    999,
    '테크2.jpg',
    '테크2.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    3,
    999,
    '테크3.jpg',
    '테크3.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    4,
    999,
    '테크4.jpg',
    '테크4.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    5,
    2,
    '테크5.jpg',
    '테크5.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    6,
    999,
    '테크6.jpg',
    '테크6.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    7,
    999,
    '테크7.jpg',
    '테크7.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    8,
    999,
    '테크8.jpg',
    '테크8.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    9,
    999,
    '패션9.jpg',
    '패션9.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    10,
    999,
    '패션10.jpg',
    '패션10.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    11,
    999,
    '패션11.jpg',
    '패션11.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    12,
    999,
    '패션12.jpg',
    '패션12.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    13,
    999,
    '패션13.jpg',
    '패션13.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    14,
    999,
    '패션14.jpg',
    '패션14.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    15,
    999,
    '패션15.jpg',
    '패션15.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    16,
    999,
    '패션16.jpg',
    '패션16.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    17,
    999,
    '홈17.jpg',
    '홈17.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    18,
    999,
    '홈18.jpg',
    '홈18.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    19,
    999,
    '홈19.jpg',
    '홈19.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    20,
    999,
    '홈20.jpg',
    '홈20.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    21,
    999,
    '홈21.jpg',
    '홈21.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    22,
    999,
    '홈22.jpg',
    '홈22.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    23,
    999,
    '홈23.jpg',
    '홈23.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    24,
    999,
    '홈24.jpg',
    '홈24.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);



INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    25,
    2,
    '뷰티25.jpg',
    '뷰티25.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    26,
    2,
    '뷰티26.jpg',
    '뷰티26.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    26,
    2,
    '뷰티26.jpg',
    '뷰티26.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    27,
    2,
    '뷰티27.jpg',
    '뷰티27.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    28,
    2,
    '뷰티28.jpg',
    '뷰티28.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    29,
    2,
    '뷰티29.jpg',
    '뷰티29.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    30,
    2,
    '뷰티30.jpg',
    '뷰티30.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    31,
    2,
    '뷰티31.jpg',
    '뷰티31.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    32,
    2,
    '뷰티32.jpg',
    '뷰티32.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    33,
    2,
    '푸드33.jpg',
    '푸드33.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    34,
    2,
    '푸드34.jpg',
    '푸드34.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    35,
    2,
    '푸드35.jpg',
    '푸드35.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    36,
    2,
    '푸드36.jpg',
    '푸드36.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    37,
    2,
    '푸드37.jpg',
    '푸드37.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    38,
    2,
    '푸드38.jpg',
    '푸드38.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    39,
    2,
    '푸드39.jpg',
    '푸드39.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    40,
    2,
    '푸드40.jpg',
    '푸드40.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    41,
    2,
    '스포츠41.jpg',
    '스포츠41.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    42,
    2,
    '스포츠42.jpg',
    '스포츠42.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    43,
    3,
    '스포츠43.jpg',
    '스포츠43.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    44,
    2,
    '스포츠44.jpg',
    '스포츠44.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    45,
    3,
    '스포츠45.jpg',
    '스포츠45.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    46,
    3,
    '스포츠46.jpg',
    '스포츠46.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    47,
    3,
    '스포츠47.jpg',
    '스포츠47.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    3,
    '스포츠48.jpg',
    '스포츠48.jpg',
    '100',
    1,
    SYSDATE,
    'views/img/',
    DEFAULT
);



INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    1,
    2,
    '테크1.jpg',
    '테크1.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    2,
    999,
    '테크2.jpg',
    '테크2.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    3,
    999,
    '테크3.jpg',
    '테크3.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    4,
    999,
    '테크4.jpg',
    '테크4.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    5,
    2,
    '테크5.jpg',
    '테크5.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    6,
    999,
    '테크6.jpg',
    '테크6.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    7,
    999,
    '테크7.jpg',
    '테크7.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    8,
    999,
    '테크8.jpg',
    '테크8.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    9,
    999,
    '패션9.jpg',
    '패션9.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    10,
    999,
    '패션10.jpg',
    '패션10.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    11,
    999,
    '패션11.jpg',
    '패션11.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    12,
    999,
    '패션12.jpg',
    '패션12.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    13,
    999,
    '패션13.jpg',
    '패션13.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    14,
    999,
    '패션14.jpg',
    '패션14.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    15,
    999,
    '패션15.jpg',
    '패션15.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    16,
    999,
    '패션16.jpg',
    '패션16.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    17,
    999,
    '홈17.jpg',
    '홈17.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    18,
    999,
    '홈18.jpg',
    '홈18.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    19,
    999,
    '홈19.jpg',
    '홈19.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    20,
    999,
    '홈20.jpg',
    '홈20.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    21,
    999,
    '홈21.jpg',
    '홈21.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    22,
    999,
    '홈22.jpg',
    '홈22.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    23,
    999,
    '홈23.jpg',
    '홈23.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    24,
    999,
    '홈24.jpg',
    '홈24.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);



INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    25,
    2,
    '뷰티25.jpg',
    '뷰티25.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    999,
    2,
    '뷰티26.jpg',
    '뷰티26.jpg',
    '100',
    999,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    27,
    2,
    '뷰티27.jpg',
    '뷰티27.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    28,
    2,
    '뷰티28.jpg',
    '뷰티28.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    29,
    2,
    '뷰티29.jpg',
    '뷰티29.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    30,
    2,
    '뷰티30.jpg',
    '뷰티30.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    31,
    2,
    '뷰티31.jpg',
    '뷰티31.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    32,
    2,
    '뷰티32.jpg',
    '뷰티32.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    33,
    2,
    '푸드33.jpg',
    '푸드33.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    34,
    2,
    '푸드34.jpg',
    '푸드34.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    35,
    2,
    '푸드35.jpg',
    '푸드35.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    36,
    2,
    '푸드36.jpg',
    '푸드36.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    37,
    2,
    '푸드37.jpg',
    '푸드37.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    38,
    2,
    '푸드38.jpg',
    '푸드38.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    39,
    2,
    '푸드39.jpg',
    '푸드39.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    40,
    2,
    '푸드40.jpg',
    '푸드40.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    41,
    2,
    '스포츠41.jpg',
    '스포츠41.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    42,
    2,
    '스포츠42.jpg',
    '스포츠42.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    43,
    2,
    '스포츠43.jpg',
    '스포츠43.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);







INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    44,
    2,
    '스포츠44상세.jpg',
    '스포츠44상세.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    45,
    2,
    '스포츠45상세.jpg',
    '스포츠45상세.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    46,
    2,
    '스포츠46상세.jpg',
    '스포츠46상세.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    47,
    2,
    '스포츠47상세.jpg',
    '스포츠47상세.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    2,
    '스포츠48상세.jpg',
    '스포츠48상세.jpg',
    '100',
    2,
    SYSDATE,
    'views/img/',
    DEFAULT
);





INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    1,
    '피핀 다이나믹 마이크, 크리에이터부터 게이머까지｜마이크 하나로 스튜디오를',
    1,
    79000,
    1,
    '20230721',
    DEFAULT,
    'FIFINE',
    'N',
    'Y'
);

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    25,
    '[6억 메이커]역대급 모공시험!물리적 각질제거STOP-돌아온 아기모공팩!',
    1,
    20000,
    1,
    '20230720',
    DEFAULT,
    '나비미용',
    'C',
    'Y'
);




INSERT INTO P_OPTION VALUES(
    1,
    1,
    '블랙',
    79000,
    '옵션설명'
);

INSERT INTO P_OPTION
VALUES (2,1,'화이트',33800,'색상');

INSERT INTO P_OPTION
VALUES (3,1,'블랙',34000,'색상');

INSERT INTO P_OPTION
VALUES (4,1,'네이비',31500,'색상');

INSERT INTO P_OPTION
VALUES (5,1, '중',29800, '크기');

INSERT INTO P_OPTION
VALUES (6,1, '3', 12900, '수량');

INSERT INTO P_OPTION
VALUES (7,1, '1+1', 27900, '패키지');

INSERT INTO P_OPTION
VALUES (8,1, '충전기', 52900, '패키지');

INSERT INTO P_OPTION
VALUES (9,1, '소형', 125000, '추가상품');

INSERT INTO P_OPTION
VALUES (10,1, '금', 68800, '재질');

INSERT INTO P_OPTION
VALUES (11,1, '그린', 129800, '색상');

INSERT INTO P_OPTION
VALUES (12,1, '270', 52900, '사이즈');

INSERT INTO P_OPTION
VALUES (13,1, 'M' , 295000, '사이즈');

INSERT INTO P_OPTION
VALUES (14,1, '컨텐츠+강의', 295000, '내용');

INSERT INTO P_OPTION
VALUES (15,1, '브라운', 158000, '색상');

INSERT INTO P_OPTION
VALUES (16,1, '뿔테', 29000, '스타일');

INSERT INTO P_OPTION
VALUES (17,1, '잔', 99000, '패키지');

INSERT INTO P_OPTION
VALUES (18,1, '솔', 7800, '패키지');

INSERT INTO P_OPTION
VALUES (19,1, '파우치', 21900, '패키지');

INSERT INTO P_OPTION
VALUES (20,1, '베게', 29000, '패키지');

INSERT INTO P_OPTION
VALUES (21,1, '중형', 158000, '사이즈');

INSERT INTO P_OPTION
VALUES (22,1, '1+1', 19900, '패키지');

INSERT INTO P_OPTION
VALUES (23,1, '1+1', 236000, '패키지');

INSERT INTO P_OPTION
VALUES (24,1, '대형', 329700, '사이즈');

INSERT INTO P_OPTION
VALUES (25,1, '래핑팩', 20000, '패키지');

INSERT INTO P_OPTION
VALUES (26,1, '크림', 50000, '패키지');

INSERT INTO P_OPTION
VALUES (27,1, '1+1', 40000, '패키지');

INSERT INTO P_OPTION
VALUES (28,1, '샘플', 20000, '패키지');

INSERT INTO P_OPTION
VALUES (29,1, '팩', 40000, '패키지');

INSERT INTO P_OPTION
VALUES (30,1, '컨디셔너', 15000, '패키지');

INSERT INTO P_OPTION
VALUES (31,1, '팩', 30000, '패키지');

INSERT INTO P_OPTION
VALUES (32,1, '컨디셔너', 20000, '패키지');

INSERT INTO P_OPTION
VALUES (33,1, '숙취해소제', 10000, '패키지');

INSERT INTO P_OPTION
VALUES (34,1, '초코', 25000, '맛');

INSERT INTO P_OPTION
VALUES (35,1, '민트', 50000, '향');

INSERT INTO P_OPTION
VALUES (36,1, '1+1', 15000, '패키지');

INSERT INTO P_OPTION
VALUES (37,1, '비타민', 3000, '패키지');

INSERT INTO P_OPTION
VALUES (38,1, '300g', 70000, '중량');

INSERT INTO P_OPTION
VALUES (39,1, '물복숭아', 40000, '종류');

INSERT INTO P_OPTION
VALUES (40,1, '아카시아', 50000, '향');

INSERT INTO P_OPTION
VALUES (41,1, '손목보호대', 300000, '패키지');

INSERT INTO P_OPTION
VALUES (42,1, '폼롤러', 25000, '패키지');

INSERT INTO P_OPTION
VALUES (43,1, '글러브', 250000, '패키지');

INSERT INTO P_OPTION
VALUES (44,1, '소', 10000,'사이즈');

INSERT INTO P_OPTION
VALUES (45,1, '스트랩',25000,'패키지');

INSERT INTO P_OPTION
VALUES (46,1, '골프공',30000,'패키지');

INSERT INTO P_OPTION
VALUES (47,1, '매트',50000,'패키지');

INSERT INTO P_OPTION
VALUES (48,1, '관절약',30000,'패키지');

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    5,
    '[와인 필수품]단 6초로 끝내는 와인 따기! 자동 와인오프너',
    1,
    29800,
    1,
    '20230718',
    DEFAULT,
    '병따개장인',
    'N',
    'Y'
);

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    30,
    '헤어프렌차이즈 샴푸 베이스. 딱! 한번 1,000ml + 1,000ml',
    1,
    15000,
    1,
    '20230719',
    DEFAULT,
    '샴푸장인',
    'N',
    'Y'
);



INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    48,
    '[국내생산]에어로쿨 기능성 원단으로 제조한 얇은 무릎보호대',
    1,
    30000,
    1,
    '20230721',
    DEFAULT,
    '이준호',
    'C',
    'Y'
);

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    4,
    47,
    '한 번의 스트레칭도 제대로 할 수 있도록ㅣ압도적 시원함 스파인 코렉터',
    1,
    50000,
    1,
    '20230721',
    DEFAULT,
    '이준호',
    'N',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    5,
    46,
    '비거리 and 방향성 문제타파! 골프에 진심 미친 사람이 만든 <카이저 골프티>',
    1,
    30000,
    1,
    '20230721',
    DEFAULT,
    '이준호',
    'Y',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    6,
    45,
    'fundable 첫 공개 [100% 내추럴 라텍스] 아머스킨 포지드 골프 그립',
    1,
    25000,
    1,
    '20230721',
    DEFAULT,
    '이준호',
    'C',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    7,
    44,
    '[ 2515%달성 앵콜] 여성 사이즈 신규 출시!스파이더 그립 골프장갑!',
    1,
    10000,
    1,
    '20230721',
    DEFAULT,
    '이준호',
    'Y',
    'Y'
);

INSERT INTO WISH_LIST VALUES(
    2,
    1,
    DEFAULT
);

INSERT INTO WISH_LIST VALUES(
    2,
    5,
    DEFAULT
);

INSERT INTO WISH_LIST VALUES(
    2,
    25,
    DEFAULT
);

INSERT INTO WISH_LIST VALUES(
    2,
    30,
    DEFAULT
);


INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    2,
    '배송시작 2주째 안와요',
    '배송시작 2주째 안와요',
    'abc@naver.com',
    '010-1234-1234',
    SYSDATE,
    DEFAULT,
    DEFAULT
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    2,
    2,
    '배너1.jpg',
    '배너1.jpg',
    '100',
    20,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    3,
    2,
    '배너2.jpg',
    '배너2.jpg',
    '100',
    20,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    4,
    2,
    '배너3.jpg',
    '배너3.jpg',
    '100',
    20,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    5,
    2,
    '배너4.jpg',
    '배너4.jpg',
    '100',
    20,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    6,
    2,
    'item1.jfif',
    'item1.jfif',
    '100',
    21,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);
INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    7,
    2,
    'item2.jfif',
    'item2.jfif',
    '100',
    21,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    7,
    2,
    'item2.jfif',
    'item2.jfif',
    '100',
    111,
    SYSDATE,
    'views/img/uproadfiles/',
    DEFAULT
);


INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 지지서명 서비스와 포인트 정책 개편',
    '안녕하세요, FUNDABLE입니다.

    내가 좋아하는 프로젝트를 지지하면서 메이커의 멋진 이야기를 세상에 알릴 수 있는 ‘FUNDABLE 지지서명’ 서비스가 개편되었습니다.

    페이스북과 FUNDABLE 계정 연동 후 가능했던 지지서명,
    
    이제는 내가 좋아하는 프로젝트에 바로 지지서명 하고 FUNDABLE 피드에서 나를 팔로우한 친구들에게 바로 보여줄 수 있습니다.  또, 카카오톡과 페이스북으로 내 지지서명을 자유롭게 공유할 수 있습니다.
    
    지지서명의 방법과 지지서명을 통해 지급되는 포인트 정책의 변경 내용을 지금 확인해보세요.

    내가 좋아하는 프로젝트에 지지서명해보세요.
    ※2023년 1월 26일 이후, 투자 프로젝트에서 지지서명 서비스는 종료되었습니다.
    
    1. 오픈예정, 펀딩, 프리오더 상세 페이지의 지지서명 아이콘 또는 버튼을 클릭해주세요.
    
    2. 지지서명 화면이 뜨면 ‘지지하는 이유를 알려주세요’ 하단의 키워드를 선택해주세요. (최소 1개 이상, 중복 선택 가능)
    
    3. 키워드를 선택하고 지지하는 이유를 최소 10자 이상 작성한 후 [지지서명하기] 버튼을 눌러주세요. (최소 10자 이상 / 최대 1,000자 이하)
    
    4. 지지서명이 완료되었어요. 나의 지지서명을 친구들에게 카카오톡 또는 페이스북으로 공유해주세요. 친구들에게 많이 공유할수록 친구가 결제를 해서 내가 포인트를 받을 확률이 더욱 높아져요.
    
    5. 완료된 지지서명은 피드-내 활동 또는 지지서명한 프로젝트에서 다시 지지서명 버튼을 누르면 확인할 수 있어요.
    
    내 지지서명을 주변에 공유하고 포인트도 받으세요!
    지지서명을 하고 받을 수 있는 포인트 정책이 바뀌었어요.
    
    ※기존 지지서명 후 펀딩 참여 시 받을 수 있던 1000p는 2023년 1월 26일 이전(신규 지지서명 배포 전)까지 완료한 지지서명에 한하여, 펀딩 또는 프리오더에 참여할 경우 지급될 예정입니다. 
    
    자세한 사항은 지지서명 포인트 지급 정책 을 통해 확인해주세요.
    
    또한 지지서명 관련 문의사항은 FUNDABLE 고객센터 채팅 상담을 통해 문의해 주세요. 
    
    앞으로도 서포터와 메이커에게 더욱 의미있는 서비스를 제공하기 위해 항상 고민하고 노력하겠습니다.
    고맙습니다.
    
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] 프리오더 서비스가 리뉴얼됩니다.',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE에서 누구나 도전할 수 있도록 프리오더 서비스가 리뉴얼됩니다.

    해외에서 론칭된 리워드를 국내에서 공식적으로 만나볼 수 있는 글로벌 프로젝트와
    많은 서포터님들의 응원을 받아 성공한 프로젝트의 동일 리워드를 다시 만나볼 수 있는 앵콜 프로젝트에서 확장해
    
    모든 카테고리에서 기존에 출시된 제품서비스 콘텐츠를 더욱 특별한 혜택을 통해 제공하는 프리오더 프로젝트를 만나보실 수 있습니다.

    프리오더(PRE-ORDER) 서비스란?

    프리오더 서비스란 특별한 혜택이 있는 리워드를 예약 구매하는 서비스입니다.

    와디즈 서비스를 둘러보다 예약구매 레이블로 한 눈에 프리오더 프로젝트를 구분하고, 눈길이 가는 프로젝트에 몇 명이 참여하고 있는지 쉽게 확인할 수 있습니다.

    리뉴얼된 프리오더 프로젝트는 프리오더 홈 에서 모아 보실 수 있어요.
    프리오더 홈에 추가된 카테고리 필터로 관심있는 분야의 프로젝트만 선별해 더욱 편리하게 프로젝트를 탐색할 수 있습니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[서비스 안내] FUNDABLE SNS 광고 수수료 변경 및 정책 안내',
    '안녕하세요, FUNDABLE입니다.

    FUNDABLE는 ‘누구나 도전할 수 있는 세상’을 만듭니다. 라는 비전을 바탕으로, 자유롭게 도전하며 성장하는 세상을 만들어나가고 있습니다.
    
    FUNDBALE에서는 메이커님들이 프로젝트를 더 많은 서포터에게 알릴 수 있도록 SNS 광고를 진행하고 있으나 요금제 별로 상이하게 적용되어 메이커들께 불편함이 있었습니다.
    이를 개편하여 모든 메이커님들이 동일한 조건으로 광고를 운영 할 수 있도록 광고 수수료 변경 및 정책이 변경됨을 안내드립니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[서비스 안내] 후원 펀딩 개편 안내(22.08.30)',
    '안녕하세요, FUNDABLE입니다.
    
    FUNDABLE에서는 ‘누구나 도전할 수 있는 세상’을 만들기 위해, 더 많은 개인 메이커님들께서 쉽고 편하게 와디즈 서비스를 이용하실 수 있도록
    후원 펀딩 정책을 개편하였습니다. 개편된 후원 펀딩 정책은 2022년 8월 30일부터 시행되며, 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.
    
    감사합니다.
    FUNDABLE 드림',
    SYSDATE
);

INSERT INTO REPORT 
 
VALUES(
        SEQ_RNO.NEXTVAL,
        2,
        'user01',
        'rudals@naver.com22',
        '신용수',
        'seller',
        '준호형 servlet 버그씀',
        '23/07/17',
        '준호형 파이널 화이팅',
        'N'
);





INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjdcks',
          'wjdcks',
          '김정찬',
          '김정찬',
          '777777-7777777',
          'wjdcks@naver.com',
          '06234,서울 동대문구 천호대로 107길 8 6,2층 C강의장',
          '010-7777-7777',
          SYSDATE,
          '스포츠',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wornr',
          'wornr',
          '안재국',
          '안재국',
          '888888-8888888',
          'wornr@naver.com',
          '06234,서울 동작구 신대방1동 70-8,2층 C강의장',
          '010-8888-8888',
          SYSDATE,
          '패션/잡화',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'hani',
          'hani',
          '팜하니',
          '팜하니',
          '041006-9999999',
          'hani@naver.com',
          '06234,서울 용산구 한강대로 42,2층 C강의장',
          '010-9999-9999',
          SYSDATE,
          '패션/잡화',
          DEFAULT,
          DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    3,
    '펀딩 신청을 하고 싶은데',
    '프로젝트 신청을 하고 싶은데 안넘어가네요',
    'wnsgh@naver.com',
    '010-2222-2222',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    4,
    '배송 조회가 되질 않아요',
    '주문 번호 3 인데 조회가 안되네요',
    'wjdghks@naver.com',
    '010-3333-3333',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    5,
    '사이즈가 안맞아서',
    '환불하고 싶은데 방법을 모르겠어요',
    'wogus@naver.com',
    '010-4444-4444',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    6,
    '주소지가 변경되었는데',
    '배송이 시작되었어여ㅠ',
    'wjdwns@naver.com',
    '010-5555-5555',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    7,
    '비밀번호를 바꾸고 싶어요',
    '어떻게 바꾸죠?',
    'dydtn@naver.com',
    '010-6666-6666',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        2,
        'user01',
        'rudals@naver.com',
        'wnsgh',
        'stop',
        '국산인데 중국산인척하고 판매',
        '23/07/18',
        '국산불매기업 신고',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        3,
        'wnsgh',
        'wnsgh@naver.com',
        'wnsgh',
        'seller',
        '양심이 찔려서 자진신고',
        '23/07/16',
        '세금 신고 안했음',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        6,
        'wjdwns',
        'wjdwns@naver.com',
        'wjdwns',
        'bad',
        '전역 신고',
        '23/07/16',
        '단결! 신고 합니다. 병장 최정준은 2023년 3월 5일부로 전역을 명 받았습니다. 이에 신고합니다.',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        7,
        'dydtn',
        'dydtn@naver.com',
        'wjdcks',
        'bad',
        '간첩 신고',
        '23/07/16',
        '남파 공작원 김수현 닮음',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        7,
        'dydtn',
        'dydtn@naver.com',
        'user01',
        'bad',
        '그냥 신고',
        '23/07/16',
        '맨날 웹툰보고 꿀빠는데 맘에 안듦',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        7,
        'dydtn',
        'dydtn@naver.com',
        'wornr',
        'bad',
        '군대 안갔음',
        '23/07/16',
        '빨리 가라 동현이랑 손잡고',
        'N'
);

INSERT INTO REPORT 
VALUES(
        SEQ_RNO.NEXTVAL,
        7,
        'dydtn',
        'dydtn@naver.com',
        'hani',
        'stop',
        '혼인 신고',
        '23/07/16',
        '하고싶다',
        'N'
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    3,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    3,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    6,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    6,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    47,
    7,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    47,
    7,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    46,
    7,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    46,
    7,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    45,
    7,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    45,
    7,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    44,
    7,
    '신고.jpg',
    '신고.jpg',
    '100',
    7,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    44,
    7,
    '신고2.jpg',
    '신고2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

ALTER TABLE PRODUCT
ADD "TAG" VARCHAR2(50) NULL; 

COMMIT;