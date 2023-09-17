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
    "QA_PERSON"  VARCHAR(300) DEFAULT '������Ʈ�� ������ ������ �Դϴ�.'        NOT NULL
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
    '��ũ/����'
);

INSERT INTO CATEGORY VALUES(
    2,
    '�м�/��ȭ'
);

INSERT INTO CATEGORY VALUES(
    3,
    'Ȩ/����'
);
INSERT INTO CATEGORY VALUES(
    4,
    '��Ƽ'
);

INSERT INTO CATEGORY VALUES(
    5,
    'Ǫ��'
);
INSERT INTO CATEGORY VALUES(
    6,
    '������'
);

ALTER TABLE PRODUCT
MODIFY DESCRIPTION VARCHAR2(500);
ALTER TABLE PRODUCT
MODIFY PRODUCT_TITLE VARCHAR2(500);
ALTER TABLE PAY_HISTORY
MODIFY PRODUCT_TITLE VARCHAR2(500);

DROP SEQUENCE SEQ_PNO; /* ���δ�Ʈ ������ */
DROP SEQUENCE SEQ_MNO; /* ��� ������ */
DROP SEQUENCE SEQ_FNO; /* ���ϳѹ� ������ */
DROP SEQUENCE SEQ_QNO; /* QA ������ */
DROP SEQUENCE SEQ_ANO; /* ��ƼŬ ������ */
DROP SEQUENCE SEQ_ONO; /* �ֹ���ȣ ������ */
DROP SEQUENCE SEQ_RNO; /* ����Ʈ ������ */


CREATE SEQUENCE SEQ_PNO; /* ���δ�Ʈ ������ */
CREATE SEQUENCE SEQ_MNO; /* ��� ������ */
CREATE SEQUENCE SEQ_FNO; /* ���ϳѹ� ������ */
CREATE SEQUENCE SEQ_QNO; /* QA ������ */
CREATE SEQUENCE SEQ_ANO; /* ��ƼŬ ������ */
CREATE SEQUENCE SEQ_ONO; /* �ֹ���ȣ ������ */
CREATE SEQUENCE SEQ_RNO; /* ����Ʈ ������ */
INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '������ ���� ������ �� �ִ� �����̾� ���̳��� ����ũ! ���� ���� �۷ι� �귣�� Fifine�� ��Ʃ����� ������ �����帳�ϴ� KC�������� ���� ǰ������ ����ũ�� ����������',
    '���� ���̳��� ����ũ, ũ�������ͺ��� ���̸ӱ���������ũ �ϳ��� ��Ʃ�����',
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
    '��Ƽ��� ���� �귣�� basix�� 3���� �÷�, ������ �ְ� 6in1 USB-CŸ�� ��Ƽ���! �Ƚẻ ����� �־ �ѹ��� �� ����� ���ٴ� ��Ƽ��� ������',
    '[����] ���� �÷� �ȹ���� ��Ƽ��� 6in1 HDMI+CŸ��+��+USB',
    33800,
    500,
    16900000,
    SYSDATE,
    '2023/07/23',
    '2023/08/23',
    '��Ƽ���',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '���ù����� Ȱ�뼺 �ʿ��� ��ɸ� ��Ҵ�! ķ�� �� �� ������ �ϳ��� �غ� ��! �����,������, ����� ���� ��� ����� �ѹ��� 3in1 ��Ƽ �ķ���',
    '[����]��������! ����; �������ϴ� ������! ���̽����̽� ��Ƽ �ķ���',
    34000,
    500,
    17000000,
    SYSDATE,
    '2023/07/24',
    '2023/08/24',
    '��Ƽ�ķ���',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '�˷�̴� ���� / ��ũ��ġ �� �и� ������ ���� �ٴ� �κ� ��ġ�� �κ� �Ǹ��� �е带 �����߽��ϴ�. 360�� ȸ�� �����ϸ�, ���� ���ϴ� ���̷� ���� ������ ��Ʈ�� ȸ�� ��ġ��',
    '[3������] 360�� ȸ�� �� ���� ���� ������ �˷�̴� ��Ʈ�� ��ġ��',
    31500,
    500,
    15750000,
    SYSDATE,
    '2023/07/25',
    '2023/08/25',
    '��ģ��ġ��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '��~ ��~ ��! ���� ����� ���κ������ �׸�! ������, ����Ʈ�� �̴� �ڵ� ���ο����� ���̳ʿ� �Բ� ���� �����ϰ� ���� �ڸ�ũ������ �������!',
    '[���� �ʼ�ǰ]�� 6�ʷ� ������ ���� ����! �ڵ� ���ο�����',
    29800,
    499,
    14900000,
    SYSDATE,
    '2023/07/10',
    '2023/08/10',
    '����������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '���ϴ� �� ����! ���� ķ�η��鿡�� ���ϴ� ����Ʃ�׿�ǰ! �ʺ��ڵ� �� �� �ִ� �ʰ��� DIY ����� LED�� �Ļ��� �ֻ��� ǰ���� �������� �����ϴ� �÷��ú� ��߱� LED 5M',
    '���� ���� Ʈ��ũ�� LED�� ��߱� �Ļ��� DIY ��Ʈ 5M',
    12900,
    500,
    6450000,
    SYSDATE,
    '2023/07/11',
    '2023/08/11',
    '��������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '�͵��� ������ 1�� �ݵ� 3.4�� �ݵ� ����! �۳� 10���븦 �ǸŸ� ����ߴ� ������ ��ǳ�Ⱑ �� ���׷��̵�Ǿ� ���ƿԽ��ϴ�. ������ �ð��Ǵ� �е�� �������� ��������!',
    '[3.4�� ����] ������ ��ǳ��� ó���̽���?���е��� �ﰢ���� �ÿ���!',
    27900,
    500,
    13950000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5',
    '�ɸ��� ��������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    1,
    '�̰� ��¥ ��ǰ�� �ƴ϶��!? ���� ���� �ڼ� Ż���� ���� ����� ������ ������ ����°� �̴ϸָ����� ������ ������ ź���� [�Ƽ����� �Ǽ����� ���� ������]',
    '�Ƽ����� �Ǽ����� ���� ������ �̴ϸ� ������ �������͸� and �Ƽ�������',
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
    '�׵���! ĳ���� �߽ɿ� �ִ� �ڵ� ������ ��������! �� �α� �����ϼ���? ������ ���̵� �ڵ�� �ܰ��� ���! ������ �Ϻ��ϰ�! �ڷ� ĳ����� �Բ��ϼ���!',
    'ĳ������ ���� �������� ã�Ҵ�! ���� �ִ� �뷮! ���̵� �ڵ� ĳ����',
    125000,
    500,
    62500000,
    SYSDATE,
    '2023/07/30',
    '2023/08/30',
    '�ڷ� ĳ����',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '���� 5.0 / 4�� �־� ����Ŀ�� [1%�� ������ ����] ������ ��!, 6������� ������ 6ĳ�� ���� õ������ 14k �����',
    '[1%�� ������ ����] 6������� ������ 6ĳ�� õ������ 14k �����',
    68800,
    500,
    34400000,
    SYSDATE,
    '2023/07/31',
    '2023/08/31',
    '�����־�',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '�ϻ�� ���࿡ ����������� ���غ�����. ��û�� �����°� ưư�� ���������� 10���� �Ŷ��� ���� ĵ�������Դϴ�.',
    '[�帶�� �ߵ��� ���λ��]40�� ������ ����� 16kg ���Ե� �Ŷ��ؿ�!',
    129800,
    500,
    64900000,
    SYSDATE,
    '2023/08/1',
    '2023/09/1',
    'ĵ���� ���긮����',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '��ũ��ũ TERA �α���� 30,000�� �Ǹű�� �ݴٺ� ������ ���� ��ŷ �ݵ�!(43% SALE)',
    '[4������]���� 3���� �Ǹ�! ���������� �ְ���, �������� �ǼŸ� #�׶�',
    52900,
    500,
    26450000,
    SYSDATE,
    '2023/08/2',
    '2023/09/2',
    '�׶�',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '��¥ �ڽŰ��� �ӿʿ��� ������. �̳ʿ��� �� ��ü��, ����ö ���� �м� ����������, Ȱ������ ��� �� �� �� ��𼭵� ����� ����Ʈ�ص帱�Կ�.',
    '���� ����� �е����� ����ԤӾ�𼭵� ���� �� �ִ� ��Ƽ �̳ʿ���',
    295000,
    500,
    147500000,
    SYSDATE,
    '2023/07/3',
    '2023/08/3',
    '�̳��ǽ�',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '���� ���� [�м� + IT ���]�� ������� �޷��� �����̳� �귣�� ���̺����� �ΰ������� ������ ������ ����� ������ Ƽ������ ������ Ŀ���͸���¡�� �� �� �ֵ��� �غ��߽��ϴ�.',
    '[2������] êGPT�� ����� ������ �ʰ� ����������� �۷� �������',
    295000,
    500,
    147500000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4',
    'ai��',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '[��������] �Ϲ� ���� �ƴ� �޸���� 100% ��� ����, 10�Ⱓ �������� ����� �� ����Ŀ�� 30�� ��� ���� ������ ���� ��ǰ ������ �� 10�����뿡 ����������.',
    '��ǰ ������ �� ���ݿ� ? 10���� �뿡 �������� 100% �޸���� ����',
    158000,
    500,
    79000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5',
    '�Ѽ�����',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    2,
    '���� �ݴٺ��� ������ �ݴ� ������ ��Ȯ�� ���� ���� ���� ���� ���� ����� ��� �ùٸ� �������� ����� ����� ����� ���밨�� ���� ���� ���� �Ȱ� �ݴ޿����� �Ұ��� �帳�ϴ�.',
    '�����ʹԸ��� ������ ��Ÿ���� ���� �پ��� �÷��� 2�����뿡 �����¸�ǰ�Ȱ�',
    29000,
    500,
    14500000,
    SYSDATE,
    '2023/07/6',
    '2023/08/6',
    'Ŭ�������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '���̺��� ������, �׷��� ������ ���� ���ε��� ���� �����غ�����. ���Ḹ ������ ���� ���ٴ��� �� �� �ִ� �����̽� ��Ÿ�� ŶƮ�� �Ұ��մϴ�!',
    '[8��]ī���� �ʿ����, Ȩ�� and Ȩ�� �ʼ���. �����ʴ� �����̽��� ��ȯ',
    99000,
    500,
    49500000,
    SYSDATE,
    '2023/08/7',
    '2023/09/7',
    'ȨŶ�帵ũ',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '���� ����� ������������ �Ѹ��⸸ �ϼ���! �Ѹ��⸸ �ϸ� ������, ����, ��綧�� ������ ������� �ʰ��� ������������',
    '�������� �Ѹ��� ������� �ʰ��� ������������',
    7800,
    500,
    3900000,
    SYSDATE,
    '2023/08/8',
    '2023/09/8','ssg��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '�帳�� ��ġ�� ����ε� �� ���̼���! ��� �Ѽտ� ��! �β� 3mm !! ���̽� �帳�� ��ġ�� Ŀ������ [���̽� �帳�� ��ġ��] �Ұ��մϴ�',
    '��� �Ѽտ� ��! Ŀ���� ���̽� �帳�� ��ġ��',
    21900,
    500,
    10950000,
    SYSDATE,
    '2023/08/9',
    '2023/09/10','���ǽ��� Ŀ��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '[������ �����] ���� �����ִ� �ڿ����� �� ����, ���� �Ǳ׸�Ʈ �̺ҷ� ����� ��ħ���� �����ϰ�! �������� ���� �����ϰ� �� ���� �����. �� �Ǽ��ϰ� �ÿ��ϰ� ��弼��~',
    '������ۤ�2������ ���� �� �Ǳ׸�Ʈ �̺ҷ� �ÿ��� ������! 3�� ����',
    29000,
    500,
    14500000,
    SYSDATE,
    '2023/08/10',
    '2023/09/10','��������',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '�����ϰ� �ε巯�� �̵弾�� �������� �����θ��� ö�� ������. ������ �������� ���������غ�����! 30-40�� ������ ���� ���� ���� �ַ��. ������ ���� ���õǰ� �����ϼ���',
    '[JVR] �̵弾�� ���������! ������ ������ �����θ��� ö�� ������',
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
    '����?����?��ġ�� �ϸ� ��� ��!! �ڵ�����ý����� �̿��� �ϼ���Ʈ������ �ڵ����� ������ ���� �������� �ߴ� ����� �������� �ع�Ǽ���!',
    '[����N������4.8]���� �� ����,���� �̰� �ϳ��� ���� ��!',
    19900,
    500,
    9950000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4','����Ʈ��',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '��Ʈ��������, �߸��� �ڼ����� �ް� ���� ���� �ʹ����� ����? �Ϸ� 20��, ������� �� ���� ��- Ǯ���ִ� ��Ʈ��Ī ��ɵ� ���ڶ� EMS ������ ������ ��ɱ���!',
    '�� �� ��� ����� EMS�� ��Ʈ��Ī�� ���ÿ�! ������ ���� �񸶻�����',
    236000,
    500,
    118000000,
    SYSDATE,
    '2023/06/29',
    '2023/07/29','�츮�� ������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    3,
    '����Ʈ�� ������� ��𼭳� �ǿ������� ����� ������ ��ǰ�Դϴ�. ���̴�, LP �÷��̾ ����ȭ�� ������� �ϴ� ���� ���� ������ �����ϰ� ����� �� �ֽ��ϴ�.',
    '���� ������-���� �� ����,Ȱ������ ���� ����,���Ͱ������ #�ӹ��ͼ�����',
    329700,
    500,
    164850000,
    SYSDATE,
    '2023/06/28',
    '2023/07/28','���� ���',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '�ܰ� ���뼭 ���ִ� �ʸ� �ɾ�� �׸�!���,����,�� �ӻ� Ȯ��!5.0 �ǻ�� �����ı�! ���� ��� ����� ���������� �� ��ü���� ��� �� ���� �� ���� ��!�Ʊ��� ������ �Ĺ�!',
    '[6�� ����Ŀ]����� �������!������ ��������STOP-���ƿ� �Ʊ�����!',
    20000,
    499,
    10000000,
    SYSDATE,
    '2023/07/22',
    '2023/08/22','���̺�Ų��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '���� ������ ���� ��ŭ, ���� ������ Ź���� �����Ǹ� ������ �Ǻ� ������ ��� ���� �ٴ��ͼ��̾�� �ϴϱ�. ���п� �� ���� ��� �����̶�� ��¦ ��� ������� ������ ���� �ſ���.',
    '2�� ���� �ʹ����� �� �� ���� ��� ���� �ָ�, ���� ���� ���� ���ô�',
    50000,
    500,
    25000000,
    SYSDATE,
    '2023/07/23',
    '2023/08/23','��������',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '������ ��Ÿ�� ���ð� �񱳸� �ź��մϴ�. �ܼ��ϰ� ���Է����� �پ���� , �ñ��� ħ���� ���ۺ�Ÿ�� ĸ��. 2-3�� �ĸ� �Ǻΰ� Ȯ���� �޶����ϴ�. �Ǻ��ھ ��ȭ ��Ű�� �̹� ����',
    '��? ��ΰ� ���並 �̷��� ���, �� Ȯ���غ�����! 31%������Ÿ��C����',
    40000,
    500,
    20000000,
    SYSDATE,
    '2023/07/24',
    '2023/08/24','���̿� ĳ��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '[1�����Ŀ]3�ʸ� �˴ϴ� !�Ӱ��� ��� �˸����������� ����� ���� �̽�Ʈ!!!�ð��� ������ ���������� �ʴ� ��ȿ����98%�� ���� �Ǻοϼ�!',
    '[1�� �˸���] 3�ʸ� �˴ϴ�.��ȿ����98%�� ���� ��,��,��,��!',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/25',
    '2023/08/25','���� ���',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    ' �� �� �� ����! �ΰ��� �Ǻθ� ���� �����ͺе��� �Ǻ� ������ <���ذ�> 1�⸸�� �ٽ� ���� �Խ��ϴ�. �Ǻ� ������ �ذ��� ���� ���� �׸��� �ÿ��� �𸵱���!',
    '[���ؼұ�ȭ��ǰ]1�⸸�� ���ƿ� �Ǻ����� �ʼ��ۤ�Ǯ/�޺�/�޼����� ���ذ�',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/10',
    '2023/08/10','���ذ�',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '������ ��û���� ����� �� ������ ���� ������������� ��Ǫ ���̽����� �� ���и� ���� ���׷��̵��� ��Ǫ�Դϴ�.',
    '������������� ��Ǫ ���̽�. ��! �ѹ� 1,000ml + 1,000ml',
    15000,
    499,
    7500000,
    SYSDATE,
    '2023/07/11',
    '2023/08/11','���� ���� ���',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '�ѱ� ���� �Ǻΰ�� TOP 3 ź������/�ָ�/������ ��� ������ �ݶ�� ��ȭ! ���ټ����� ����ִ� �׻�ȭ ��Ÿ�� �������� �� ����, �ս� ������ �������� �� �ᰡ�帱�Կ�.',
    '[�����Ǻΰ����ʼ�ǰ] �Ӱ���+ź���ɾ ���������� �Ϻ����� ����',
    30000,
    500,
    15000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5','�Ƹ���Ƽ',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    4,
    '[�Ű��� ���� Ʈ��Ʈ��Ʈ] K-POP ���̵��� ��� ��Ȥ�縦 �� ������ �ذ��ϴ� ���� ������ ��� ��Ÿ�ϸ���Ʈ �ڳ����� ���� ���.',
    '���̵� �Ӹ��� ��� | 20���� ��Ÿ�ϸ���Ʈ�� ���� Ʈ��Ʈ��Ʈ',
    20000,
    500,
    10000000,
    SYSDATE,
    '2023/07/13',
    '2023/08/13','����',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '���ڸ� �ν��� ���ְ��� ���ָ� ���ּ��� ��ȭ���� �� �����ϰ� Ư���� ���� ���� �����մϴ�. �Ű��� ���ּ��� ���迡 ������� ���� �ް��� ���� Ư���ϰ� ��������.',
    '[���ڸ� �ν���] �����ް��� ���ο� ����, ���ְ��� �Բ� Ư���� ����',
    10000,
    500,
    5000000,
    SYSDATE,
    '2023/07/31',
    '2023/08/31','�����̽� ��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '�ܹ��� ������, �� �̻� ������ �������� ������! �÷���/����/����/��Ű��ũ�� ���� �� ����� ��� ���� ������ �ܹ��� ������ Ŀ��ƾ�� ����������',
    '[4���� �� n���� ����] �� ����� ��� �Դ� Ŀ���� �ܹ��� ������',
    25000,
    500,
    12500000,
    SYSDATE,
    '2023/08/1',
    '2023/09/1','Ǫ�� �ӽ�',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '�� �˿� ���� 70��! ���� �ݵ� 2,136% �޼�! ����� �������� Ư����� ��������� ���� �� ���ͱհ� ���ر��� �����ִ� ȯ���� �����, �Գ����� �ٺ� ������ �ɾ����ݴϴ�.',
    '[�Ѿ˿� 70��]�Գ����� �ٺ�, �Ӻ��� �ɾ��ϴ� �е��� �Է�! ���������',
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
    '�ض����� ��������¡��� 3,188% �ϳ´� �����¡�� �̹��� �ذ��� ���������� ���ƿԽ��ϴ� �츮�� ���а� ���� �ȹ����°� �ƽ���? �� ����� �� �Ʒ��� Ȯ���غ�����!',
    '[��������] ���� ��¡� �̷��Ա��� �����ؿ�... �ض����� ��¡�� 2ź',
    15000,
    500,
    7500000,
    SYSDATE,
    '2023/08/3',
    '2023/09/3','��¡��',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '������ ��ä������ �׸�! �����ϰ� �����Բ� ������ �� �ִ� ��ä����ABC�� �Բ� ���ο� ��ä������ ��������~!',
    '[�Ϸ��ä] 2�˷� ����ϰ� �����ϰ� �����ϼ���!',
    3000,
    500,
    1500000,
    SYSDATE,
    '2023/07/4',
    '2023/08/4','�Ϸ��ä',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '���� ũ��, ���� �޴�!! ���ֿ��� �޴�~�ϰ� �ڶ� ���� �ո��� ����������. ����Ʈ ���� ǰ������ �ؿܿ��� �����Ҵ� �̱����� ���� ���� �״��~ �Ÿ��� ���� �޴����� ���޶��.',
    '[����Ʈ����] ���ֿ��� �� ���� ��ū���� �̱����� ��!ū! �����̾� ����',
    70000,
    500,
    35000000,
    SYSDATE,
    '2023/07/5',
    '2023/08/5','����Ʈ����',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '�پ��� ǰ������ ����ϰ� ��� �е��� ���� ǰ�� �� ������ �����Ƹ� ���Ծ��. �ƻ� ���� ��~�� �پ��� �İ��� ��� �� �ִ� ������ 3���� ���������� !',
    '�����Ƴ��ǿ� 3���Ӿƻ�,��-��,����! ǰ�� �� �ְ��� �����Ƹ� ��Ҿ��.',
    40000,
    500,
    25000000,
    SYSDATE,
    '2023/07/6',
    '2023/08/6','��������',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    5,
    '[Ȩ���� ���� ��!] ���� õ�� ���β��� ������ �ǰ��� ���� �ƴ� �������� ��� ���� �� ��ǰ ���β� [�ξ�� ���β�] �ݴٺ� Ư�� ���θ������ ����������!',
    '[Ȩ���� ���ǲ�] �ξ�� ���� õ�� ���β� ����ö 75% �͵��� Ư����!',
    50000,
    500,
    20000000,
    SYSDATE,
    '2023/07/7',
    '2023/08/7','���ȥ',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '���� ���� �귣�� ����ä���� ������ ���ǿ� ��뽺ƽ ���͸� ����մϴ�. ���μ������� ���� ������ ������ Ʈ����� �������� ��뽺ƽ���͸� �ݴٺ��� ���� ���� ���� �ϼ���.',
    '[��뽺ƽ ����] �ΰ��� �׸����� �Ϻ��� �ո� ����, ������ ���ǿ�!',
    300000,
    500,
    150000000,
    SYSDATE,
    '2023/08/10',
    '2023/09/10', '����ä',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '���� ���ϴ� ������ ��� ������ �ϸ� ������ ���� Ǯ���ݾ�! �������� ���� �ε巯�� �Ǹ��� ����� ���ϴ� ������ ������ �غ�����! �ٵ�Ŭ���� �Ǹ��� ���������� ����������~!',
    '[N������4.9��] ��ģ������ �Ƿθ� Ǯ���ִ� �ٵ�Ŭ���� �Ǹ��� ��������',
    25000,
    500,
    12500000,
    SYSDATE,
    '2023/08/9',
    '2023/09/9','����Ʈ �ɾ� ����',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '��Ī�� ��� ���� ��Ƽ���ϰ� ��̰� �� �� �ְ� ����Ÿ�� ������ �������� Ÿ�ݵ����� ���÷��̸� ���߸鼭�� ��� Ÿ�ݵ� �ߵ� �� �ִ� �߰��� ������ ���� ���ĵ� ��Ī��',
    '�� Ÿ�ݿ� �����ϴ� ����Ʈ ��Ī��',
    250000,
    490,
    125000000,
    SYSDATE,
    '2023/08/8',
    '2023/09/8','���� ������',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '�̲������� �ʴ� ��¥ ���� �׸�! ���ھ �ٿ��ִ� �ùٸ� �׸�����! �ְ�� ��Ÿ�� ���ǿ� Ư������ �Ǹ����� �������� �������� ��밡���� �����̴� �׸� �����尩!',
    '[ 2515%�޼� ����] ���� ������ �ű� ���!�����̴� �׸� �����尩!',
    10000,
    45,
    5000000,
    SYSDATE,
    '2023/08/6',
    '2023/09/6','����ȣ',
    'N'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '������� ���� ����~�ϰ�, �ռ�����ŭ �������� ���� �׸����� ����! ���δԵ鲲���� �ѹ� ����ϴ� ���� �ٸ� �׸� ��� �� �Ѵٰ� �Ͻó׿�~^^',
    'fundable ù ���� [100% ���߷� ���ؽ�] �Ƹӽ�Ų ������ ���� �׸�',
    25000,
    120,
    12500000,
    SYSDATE,
    '2023/06/28',
    '2023/07/28','����ȣ',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '�������� �ɸ� <����ȯ��>�� ���� ���������� ������ī���� *Ǯ�÷� ���ο� ����Ƽ* ��Ÿ�/���⼺/���̹�/������/�־߰�� �ű⿡ ����Ŀ ���ö��̱���!! ī��������Ƽ �ϳ��� ���ν�',
    '��Ÿ� and ���⼺ ����Ÿ��! ������ ���� ��ģ ����� ���� <ī���� ����Ƽ>',
    30000,
    50,
    15000000,
    SYSDATE,
    '2023/06/30',
    '2023/07/30','����ȣ',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '�ݴٺ����� �Ϻ��� ��Ʈ��Ī�� ���� �ݿ��� ������ �ڷ��� �մϴ� ��𿡵� ���� Ư������ ���� TPE �ٿ뵵 ��Ʈ�� �Բ� �޾� ���Ǽ� �ֽ��ϴ�',
    '�� ���� ��Ʈ��Ī�� ����� �� �� �ֵ��ϤӾе��� �ÿ��� ������ �ڷ���',
    50000,
    300,
    25000000,
    SYSDATE,
    '2023/07/9',
    '2023/08/9','����ȣ',
    'Y'
);

INSERT INTO PRODUCT VALUES(
    SEQ_PNO.NEXTVAL,
    6,
    '�������� ��ɼ� ������ ����� �йڷ� ���� ������ȣ��',
    '[��������]������� ��ɼ� �������� ������ ���� ������ȣ��',
    30000,
    10,
    15000000,
    SYSDATE,
    '2023/07/8',
    '2023/08/8','����ȣ',
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
    '������',
    '������',
    '999999-999999',
    '�������̸���',
    '�������ּ�',
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
          '�ΰ��',
          '�ΰ��',
          '111111-1111111',
          'rudals@naver.com',
          '06234,���� ������ �������14�� 6,2�� C������',
          '010-1234-1234',
          SYSDATE,
          'Ǫ��',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wnsgh',
          'wnsgh',
          '����ȣ',
          '����ȣ',
          '222222-2222222',
          'wnsgh@naver.com',
          '06234,���� �߱� 5414��-6 6,2�� C������',
          '010-2222-2222',
          SYSDATE,
          'Ȩ/����',
          DEFAULT,
         'Y'
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjddhks',
          'wjddhks',
          '������',
          '������',
          '333333-3333333',
          'wjddhks@naver.com',
          '06234,���� �ϱ� 5414��-6 6,2�� C������',
          '010-3333-3333',
          SYSDATE,
          'Ȩ/����',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wogus',
          'wogus',
          '������',
          '������',
          '444444-4444444',
          'wogus@naver.com',
          '06234,���� ���۱� 5414��-6 6,2�� C������',
          '010-4444-4444',
          SYSDATE,
          'Ǫ��',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjdwns',
          'wjdwns',
          '������',
          '������',
          '555555-5555555',
          'wjdwns@naver.com',
          '06234,���� ������ 5414��-6 6,2�� C������',
          '010-5555-5555',
          SYSDATE,
          'Ǫ��',
          DEFAULT,
          DEFAULT
);


INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'dydtn',
          'dydtn',
          '�ſ��',
          '�ſ��',
          '666666-6666666',
          'wjdwns@naver.com',
          '06234,���� ���۱� ��絿 5414��-6 6,2�� C������',
          '010-6666-6666',
          SYSDATE,
          '������',
          DEFAULT,
          DEFAULT
);



INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    1,
    2,
    '��ũ1.jpg',
    '��ũ1.jpg',
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
    '��ũ2.jpg',
    '��ũ2.jpg',
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
    '��ũ3.jpg',
    '��ũ3.jpg',
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
    '��ũ4.jpg',
    '��ũ4.jpg',
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
    '��ũ5.jpg',
    '��ũ5.jpg',
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
    '��ũ6.jpg',
    '��ũ6.jpg',
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
    '��ũ7.jpg',
    '��ũ7.jpg',
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
    '��ũ8.jpg',
    '��ũ8.jpg',
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
    '�м�9.jpg',
    '�м�9.jpg',
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
    '�м�10.jpg',
    '�м�10.jpg',
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
    '�м�11.jpg',
    '�м�11.jpg',
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
    '�м�12.jpg',
    '�м�12.jpg',
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
    '�м�13.jpg',
    '�м�13.jpg',
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
    '�м�14.jpg',
    '�м�14.jpg',
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
    '�м�15.jpg',
    '�м�15.jpg',
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
    '�м�16.jpg',
    '�м�16.jpg',
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
    'Ȩ17.jpg',
    'Ȩ17.jpg',
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
    'Ȩ18.jpg',
    'Ȩ18.jpg',
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
    'Ȩ19.jpg',
    'Ȩ19.jpg',
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
    'Ȩ20.jpg',
    'Ȩ20.jpg',
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
    'Ȩ21.jpg',
    'Ȩ21.jpg',
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
    'Ȩ22.jpg',
    'Ȩ22.jpg',
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
    'Ȩ23.jpg',
    'Ȩ23.jpg',
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
    'Ȩ24.jpg',
    'Ȩ24.jpg',
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
    '��Ƽ25.jpg',
    '��Ƽ25.jpg',
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
    '��Ƽ26.jpg',
    '��Ƽ26.jpg',
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
    '��Ƽ26.jpg',
    '��Ƽ26.jpg',
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
    '��Ƽ27.jpg',
    '��Ƽ27.jpg',
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
    '��Ƽ28.jpg',
    '��Ƽ28.jpg',
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
    '��Ƽ29.jpg',
    '��Ƽ29.jpg',
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
    '��Ƽ30.jpg',
    '��Ƽ30.jpg',
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
    '��Ƽ31.jpg',
    '��Ƽ31.jpg',
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
    '��Ƽ32.jpg',
    '��Ƽ32.jpg',
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
    'Ǫ��33.jpg',
    'Ǫ��33.jpg',
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
    'Ǫ��34.jpg',
    'Ǫ��34.jpg',
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
    'Ǫ��35.jpg',
    'Ǫ��35.jpg',
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
    'Ǫ��36.jpg',
    'Ǫ��36.jpg',
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
    'Ǫ��37.jpg',
    'Ǫ��37.jpg',
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
    'Ǫ��38.jpg',
    'Ǫ��38.jpg',
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
    'Ǫ��39.jpg',
    'Ǫ��39.jpg',
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
    'Ǫ��40.jpg',
    'Ǫ��40.jpg',
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
    '������41.jpg',
    '������41.jpg',
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
    '������42.jpg',
    '������42.jpg',
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
    '������43.jpg',
    '������43.jpg',
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
    '������44.jpg',
    '������44.jpg',
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
    '������45.jpg',
    '������45.jpg',
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
    '������46.jpg',
    '������46.jpg',
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
    '������47.jpg',
    '������47.jpg',
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
    '������48.jpg',
    '������48.jpg',
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
    '��ũ1.jpg',
    '��ũ1.jpg',
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
    '��ũ2.jpg',
    '��ũ2.jpg',
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
    '��ũ3.jpg',
    '��ũ3.jpg',
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
    '��ũ4.jpg',
    '��ũ4.jpg',
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
    '��ũ5.jpg',
    '��ũ5.jpg',
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
    '��ũ6.jpg',
    '��ũ6.jpg',
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
    '��ũ7.jpg',
    '��ũ7.jpg',
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
    '��ũ8.jpg',
    '��ũ8.jpg',
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
    '�м�9.jpg',
    '�м�9.jpg',
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
    '�м�10.jpg',
    '�м�10.jpg',
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
    '�м�11.jpg',
    '�м�11.jpg',
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
    '�м�12.jpg',
    '�м�12.jpg',
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
    '�м�13.jpg',
    '�м�13.jpg',
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
    '�м�14.jpg',
    '�м�14.jpg',
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
    '�м�15.jpg',
    '�м�15.jpg',
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
    '�м�16.jpg',
    '�м�16.jpg',
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
    'Ȩ17.jpg',
    'Ȩ17.jpg',
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
    'Ȩ18.jpg',
    'Ȩ18.jpg',
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
    'Ȩ19.jpg',
    'Ȩ19.jpg',
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
    'Ȩ20.jpg',
    'Ȩ20.jpg',
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
    'Ȩ21.jpg',
    'Ȩ21.jpg',
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
    'Ȩ22.jpg',
    'Ȩ22.jpg',
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
    'Ȩ23.jpg',
    'Ȩ23.jpg',
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
    'Ȩ24.jpg',
    'Ȩ24.jpg',
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
    '��Ƽ25.jpg',
    '��Ƽ25.jpg',
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
    '��Ƽ26.jpg',
    '��Ƽ26.jpg',
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
    '��Ƽ27.jpg',
    '��Ƽ27.jpg',
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
    '��Ƽ28.jpg',
    '��Ƽ28.jpg',
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
    '��Ƽ29.jpg',
    '��Ƽ29.jpg',
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
    '��Ƽ30.jpg',
    '��Ƽ30.jpg',
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
    '��Ƽ31.jpg',
    '��Ƽ31.jpg',
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
    '��Ƽ32.jpg',
    '��Ƽ32.jpg',
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
    'Ǫ��33.jpg',
    'Ǫ��33.jpg',
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
    'Ǫ��34.jpg',
    'Ǫ��34.jpg',
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
    'Ǫ��35.jpg',
    'Ǫ��35.jpg',
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
    'Ǫ��36.jpg',
    'Ǫ��36.jpg',
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
    'Ǫ��37.jpg',
    'Ǫ��37.jpg',
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
    'Ǫ��38.jpg',
    'Ǫ��38.jpg',
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
    'Ǫ��39.jpg',
    'Ǫ��39.jpg',
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
    'Ǫ��40.jpg',
    'Ǫ��40.jpg',
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
    '������41.jpg',
    '������41.jpg',
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
    '������42.jpg',
    '������42.jpg',
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
    '������43.jpg',
    '������43.jpg',
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
    '������44��.jpg',
    '������44��.jpg',
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
    '������45��.jpg',
    '������45��.jpg',
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
    '������46��.jpg',
    '������46��.jpg',
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
    '������47��.jpg',
    '������47��.jpg',
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
    '������48��.jpg',
    '������48��.jpg',
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
    '���� ���̳��� ����ũ, ũ�������ͺ��� ���̸ӱ���������ũ �ϳ��� ��Ʃ�����',
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
    '[6�� ����Ŀ]����� �������!������ ��������STOP-���ƿ� �Ʊ�����!',
    1,
    20000,
    1,
    '20230720',
    DEFAULT,
    '����̿�',
    'C',
    'Y'
);




INSERT INTO P_OPTION VALUES(
    1,
    1,
    '��',
    79000,
    '�ɼǼ���'
);

INSERT INTO P_OPTION
VALUES (2,1,'ȭ��Ʈ',33800,'����');

INSERT INTO P_OPTION
VALUES (3,1,'��',34000,'����');

INSERT INTO P_OPTION
VALUES (4,1,'���̺�',31500,'����');

INSERT INTO P_OPTION
VALUES (5,1, '��',29800, 'ũ��');

INSERT INTO P_OPTION
VALUES (6,1, '3', 12900, '����');

INSERT INTO P_OPTION
VALUES (7,1, '1+1', 27900, '��Ű��');

INSERT INTO P_OPTION
VALUES (8,1, '������', 52900, '��Ű��');

INSERT INTO P_OPTION
VALUES (9,1, '����', 125000, '�߰���ǰ');

INSERT INTO P_OPTION
VALUES (10,1, '��', 68800, '����');

INSERT INTO P_OPTION
VALUES (11,1, '�׸�', 129800, '����');

INSERT INTO P_OPTION
VALUES (12,1, '270', 52900, '������');

INSERT INTO P_OPTION
VALUES (13,1, 'M' , 295000, '������');

INSERT INTO P_OPTION
VALUES (14,1, '������+����', 295000, '����');

INSERT INTO P_OPTION
VALUES (15,1, '����', 158000, '����');

INSERT INTO P_OPTION
VALUES (16,1, '����', 29000, '��Ÿ��');

INSERT INTO P_OPTION
VALUES (17,1, '��', 99000, '��Ű��');

INSERT INTO P_OPTION
VALUES (18,1, '��', 7800, '��Ű��');

INSERT INTO P_OPTION
VALUES (19,1, '�Ŀ�ġ', 21900, '��Ű��');

INSERT INTO P_OPTION
VALUES (20,1, '����', 29000, '��Ű��');

INSERT INTO P_OPTION
VALUES (21,1, '����', 158000, '������');

INSERT INTO P_OPTION
VALUES (22,1, '1+1', 19900, '��Ű��');

INSERT INTO P_OPTION
VALUES (23,1, '1+1', 236000, '��Ű��');

INSERT INTO P_OPTION
VALUES (24,1, '����', 329700, '������');

INSERT INTO P_OPTION
VALUES (25,1, '������', 20000, '��Ű��');

INSERT INTO P_OPTION
VALUES (26,1, 'ũ��', 50000, '��Ű��');

INSERT INTO P_OPTION
VALUES (27,1, '1+1', 40000, '��Ű��');

INSERT INTO P_OPTION
VALUES (28,1, '����', 20000, '��Ű��');

INSERT INTO P_OPTION
VALUES (29,1, '��', 40000, '��Ű��');

INSERT INTO P_OPTION
VALUES (30,1, '����ų�', 15000, '��Ű��');

INSERT INTO P_OPTION
VALUES (31,1, '��', 30000, '��Ű��');

INSERT INTO P_OPTION
VALUES (32,1, '����ų�', 20000, '��Ű��');

INSERT INTO P_OPTION
VALUES (33,1, '�����ؼ���', 10000, '��Ű��');

INSERT INTO P_OPTION
VALUES (34,1, '����', 25000, '��');

INSERT INTO P_OPTION
VALUES (35,1, '��Ʈ', 50000, '��');

INSERT INTO P_OPTION
VALUES (36,1, '1+1', 15000, '��Ű��');

INSERT INTO P_OPTION
VALUES (37,1, '��Ÿ��', 3000, '��Ű��');

INSERT INTO P_OPTION
VALUES (38,1, '300g', 70000, '�߷�');

INSERT INTO P_OPTION
VALUES (39,1, '��������', 40000, '����');

INSERT INTO P_OPTION
VALUES (40,1, '��ī�þ�', 50000, '��');

INSERT INTO P_OPTION
VALUES (41,1, '�ո�ȣ��', 300000, '��Ű��');

INSERT INTO P_OPTION
VALUES (42,1, '���ѷ�', 25000, '��Ű��');

INSERT INTO P_OPTION
VALUES (43,1, '�۷���', 250000, '��Ű��');

INSERT INTO P_OPTION
VALUES (44,1, '��', 10000,'������');

INSERT INTO P_OPTION
VALUES (45,1, '��Ʈ��',25000,'��Ű��');

INSERT INTO P_OPTION
VALUES (46,1, '������',30000,'��Ű��');

INSERT INTO P_OPTION
VALUES (47,1, '��Ʈ',50000,'��Ű��');

INSERT INTO P_OPTION
VALUES (48,1, '������',30000,'��Ű��');

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    5,
    '[���� �ʼ�ǰ]�� 6�ʷ� ������ ���� ����! �ڵ� ���ο�����',
    1,
    29800,
    1,
    '20230718',
    DEFAULT,
    '����������',
    'N',
    'Y'
);

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    30,
    '������������� ��Ǫ ���̽�. ��! �ѹ� 1,000ml + 1,000ml',
    1,
    15000,
    1,
    '20230719',
    DEFAULT,
    '��Ǫ����',
    'N',
    'Y'
);



INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    2,
    48,
    '[��������]������� ��ɼ� �������� ������ ���� ������ȣ��',
    1,
    30000,
    1,
    '20230721',
    DEFAULT,
    '����ȣ',
    'C',
    'Y'
);

INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    4,
    47,
    '�� ���� ��Ʈ��Ī�� ����� �� �� �ֵ��ϤӾе��� �ÿ��� ������ �ڷ���',
    1,
    50000,
    1,
    '20230721',
    DEFAULT,
    '����ȣ',
    'N',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    5,
    46,
    '��Ÿ� and ���⼺ ����Ÿ��! ������ ���� ��ģ ����� ���� <ī���� ����Ƽ>',
    1,
    30000,
    1,
    '20230721',
    DEFAULT,
    '����ȣ',
    'Y',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    6,
    45,
    'fundable ù ���� [100% ���߷� ���ؽ�] �Ƹӽ�Ų ������ ���� �׸�',
    1,
    25000,
    1,
    '20230721',
    DEFAULT,
    '����ȣ',
    'C',
    'Y'
);
INSERT INTO PAY_HISTORY VALUES(
    SEQ_ONO.NEXTVAL,
    7,
    44,
    '[ 2515%�޼� ����] ���� ������ �ű� ���!�����̴� �׸� �����尩!',
    1,
    10000,
    1,
    '20230721',
    DEFAULT,
    '����ȣ',
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
    '��۽��� 2��° �ȿͿ�',
    '��۽��� 2��° �ȿͿ�',
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
    '���1.jpg',
    '���1.jpg',
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
    '���2.jpg',
    '���2.jpg',
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
    '���3.jpg',
    '���3.jpg',
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
    '���4.jpg',
    '���4.jpg',
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
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);
INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);INSERT INTO NOTICE 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺿� ����Ʈ ��å ����',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    ���� �����ϴ� ������Ʈ�� �����ϸ鼭 ����Ŀ�� ���� �̾߱⸦ ���� �˸� �� �ִ� ��FUNDABLE �������� ���񽺰� ����Ǿ����ϴ�.

    ���̽��ϰ� FUNDABLE ���� ���� �� �����ߴ� ��������,
    
    ������ ���� �����ϴ� ������Ʈ�� �ٷ� �������� �ϰ� FUNDABLE �ǵ忡�� ���� �ȷο��� ģ���鿡�� �ٷ� ������ �� �ֽ��ϴ�.  ��, īī����� ���̽������� �� ���������� �����Ӱ� ������ �� �ֽ��ϴ�.
    
    ���������� ����� ���������� ���� ���޵Ǵ� ����Ʈ ��å�� ���� ������ ���� Ȯ���غ�����.

    ���� �����ϴ� ������Ʈ�� ���������غ�����.
    ��2023�� 1�� 26�� ����, ���� ������Ʈ���� �������� ���񽺴� ����Ǿ����ϴ�.
    
    1. ���¿���, �ݵ�, �������� �� �������� �������� ������ �Ǵ� ��ư�� Ŭ�����ּ���.
    
    2. �������� ȭ���� �߸� �������ϴ� ������ �˷��ּ��䡯 �ϴ��� Ű���带 �������ּ���. (�ּ� 1�� �̻�, �ߺ� ���� ����)
    
    3. Ű���带 �����ϰ� �����ϴ� ������ �ּ� 10�� �̻� �ۼ��� �� [���������ϱ�] ��ư�� �����ּ���. (�ּ� 10�� �̻� / �ִ� 1,000�� ����)
    
    4. ���������� �Ϸ�Ǿ����. ���� ���������� ģ���鿡�� īī���� �Ǵ� ���̽������� �������ּ���. ģ���鿡�� ���� �����Ҽ��� ģ���� ������ �ؼ� ���� ����Ʈ�� ���� Ȯ���� ���� ��������.
    
    5. �Ϸ�� ���������� �ǵ�-�� Ȱ�� �Ǵ� ���������� ������Ʈ���� �ٽ� �������� ��ư�� ������ Ȯ���� �� �־��.
    
    �� ���������� �ֺ��� �����ϰ� ����Ʈ�� ��������!
    ���������� �ϰ� ���� �� �ִ� ����Ʈ ��å�� �ٲ�����.
    
    �ر��� �������� �� �ݵ� ���� �� ���� �� �ִ� 1000p�� 2023�� 1�� 26�� ����(�ű� �������� ���� ��)���� �Ϸ��� �������� ���Ͽ�, �ݵ� �Ǵ� ���������� ������ ��� ���޵� �����Դϴ�. 
    
    �ڼ��� ������ �������� ����Ʈ ���� ��å �� ���� Ȯ�����ּ���.
    
    ���� �������� ���� ���ǻ����� FUNDABLE ������ ä�� ����� ���� ������ �ּ���. 
    
    �����ε� �����Ϳ� ����Ŀ���� ���� �ǹ��ִ� ���񽺸� �����ϱ� ���� �׻� ����ϰ� ����ϰڽ��ϴ�.
    �����ϴ�.
    
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] �������� ���񽺰� ������˴ϴ�.',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE���� ������ ������ �� �ֵ��� �������� ���񽺰� ������˴ϴ�.

    �ؿܿ��� ��Ī�� �����带 �������� ���������� ������ �� �ִ� �۷ι� ������Ʈ��
    ���� �����ʹԵ��� ������ �޾� ������ ������Ʈ�� ���� �����带 �ٽ� ������ �� �ִ� ���� ������Ʈ���� Ȯ����
    
    ��� ī�װ����� ������ ��õ� ��ǰ���� �������� ���� Ư���� ������ ���� �����ϴ� �������� ������Ʈ�� �������� �� �ֽ��ϴ�.

    ��������(PRE-ORDER) ���񽺶�?

    �������� ���񽺶� Ư���� ������ �ִ� �����带 ���� �����ϴ� �����Դϴ�.

    �͵��� ���񽺸� �ѷ����� ���౸�� ���̺�� �� ���� �������� ������Ʈ�� �����ϰ�, ������ ���� ������Ʈ�� �� ���� �����ϰ� �ִ��� ���� Ȯ���� �� �ֽ��ϴ�.

    ������� �������� ������Ʈ�� �������� Ȩ ���� ��� ���� �� �־��.
    �������� Ȩ�� �߰��� ī�װ� ���ͷ� �����ִ� �о��� ������Ʈ�� ������ ���� ���ϰ� ������Ʈ�� Ž���� �� �ֽ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    10,
    '[���� �ȳ�] FUNDABLE SNS ���� ������ ���� �� ��å �ȳ�',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.

    FUNDABLE�� �������� ������ �� �ִ� ������ ����ϴ�. ��� ������ ��������, �����Ӱ� �����ϸ� �����ϴ� ������ �������� �ֽ��ϴ�.
    
    FUNDBALE������ ����Ŀ�Ե��� ������Ʈ�� �� ���� �����Ϳ��� �˸� �� �ֵ��� SNS ���� �����ϰ� ������ ����� ���� �����ϰ� ����Ǿ� ����Ŀ�鲲 �������� �־����ϴ�.
    �̸� �����Ͽ� ��� ����Ŀ�Ե��� ������ �������� ���� � �� �� �ֵ��� ���� ������ ���� �� ��å�� ������� �ȳ��帳�ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO NOTICE 
 
VALUES(
    SEQ_ANO.NEXTVAL,
    210,
    '[���� �ȳ�] �Ŀ� �ݵ� ���� �ȳ�(22.08.30)',
    '�ȳ��ϼ���, FUNDABLE�Դϴ�.
    
    FUNDABLE������ �������� ������ �� �ִ� ������ ����� ����, �� ���� ���� ����Ŀ�Ե鲲�� ���� ���ϰ� �͵��� ���񽺸� �̿��Ͻ� �� �ֵ���
    �Ŀ� �ݵ� ��å�� �����Ͽ����ϴ�. ����� �Ŀ� �ݵ� ��å�� 2022�� 8�� 30�Ϻ��� ����Ǹ�, �ڼ��� ������ �Ʒ� ������ ������ �ֽñ� �ٶ��ϴ�.
    
    �����մϴ�.
    FUNDABLE �帲',
    SYSDATE
);

INSERT INTO REPORT 
 
VALUES(
        SEQ_RNO.NEXTVAL,
        2,
        'user01',
        'rudals@naver.com22',
        '�ſ��',
        'seller',
        '��ȣ�� servlet ���׾�',
        '23/07/17',
        '��ȣ�� ���̳� ȭ����',
        'N'
);





INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wjdcks',
          'wjdcks',
          '������',
          '������',
          '777777-7777777',
          'wjdcks@naver.com',
          '06234,���� ���빮�� õȣ��� 107�� 8 6,2�� C������',
          '010-7777-7777',
          SYSDATE,
          '������',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'wornr',
          'wornr',
          '���籹',
          '���籹',
          '888888-8888888',
          'wornr@naver.com',
          '06234,���� ���۱� �Ŵ��1�� 70-8,2�� C������',
          '010-8888-8888',
          SYSDATE,
          '�м�/��ȭ',
          DEFAULT,
          DEFAULT
);

INSERT INTO MEMBER VALUES(
          SEQ_MNO.NEXTVAL,
          'hani',
          'hani',
          '���ϴ�',
          '���ϴ�',
          '041006-9999999',
          'hani@naver.com',
          '06234,���� ��걸 �Ѱ���� 42,2�� C������',
          '010-9999-9999',
          SYSDATE,
          '�м�/��ȭ',
          DEFAULT,
          DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    3,
    '�ݵ� ��û�� �ϰ� ������',
    '������Ʈ ��û�� �ϰ� ������ �ȳѾ�׿�',
    'wnsgh@naver.com',
    '010-2222-2222',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    4,
    '��� ��ȸ�� ���� �ʾƿ�',
    '�ֹ� ��ȣ 3 �ε� ��ȸ�� �ȵǳ׿�',
    'wjdghks@naver.com',
    '010-3333-3333',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    5,
    '����� �ȸ¾Ƽ�',
    'ȯ���ϰ� ������ ����� �𸣰ھ��',
    'wogus@naver.com',
    '010-4444-4444',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    6,
    '�ּ����� ����Ǿ��µ�',
    '����� ���۵Ǿ����',
    'wjdwns@naver.com',
    '010-5555-5555',
    SYSDATE,
    DEFAULT,
    DEFAULT
);

INSERT INTO QA VALUES(
    SEQ_QNO.NEXTVAL,
    7,
    '��й�ȣ�� �ٲٰ� �;��',
    '��� �ٲ���?',
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
        '�����ε� �߱�����ô�ϰ� �Ǹ�',
        '23/07/18',
        '����Ҹű�� �Ű�',
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
        '����� ����� �����Ű�',
        '23/07/16',
        '���� �Ű� ������',
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
        '���� �Ű�',
        '23/07/16',
        '�ܰ�! �Ű� �մϴ�. ���� �������� 2023�� 3�� 5�Ϻη� ������ �� �޾ҽ��ϴ�. �̿� �Ű��մϴ�.',
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
        '��ø �Ű�',
        '23/07/16',
        '���� ���ۿ� ����� ����',
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
        '�׳� �Ű�',
        '23/07/16',
        '�ǳ� �������� �ܺ��µ� ���� �ȵ�',
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
        '���� �Ȱ���',
        '23/07/16',
        '���� ���� �����̶� �����',
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
        'ȥ�� �Ű�',
        '23/07/16',
        '�ϰ�ʹ�',
        'N'
);


INSERT INTO IMAGE VALUES(
    SEQ_FNO.NEXTVAL,
    48,
    3,
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
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
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
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
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
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
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
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
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
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
    '�Ű�.jpg',
    '�Ű�.jpg',
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
    '�Ű�2.jpg',
    '�Ű�2.jpg',
    '100',
    8,
    '23/07/16',
    'views/img/uproadfiles/',
    DEFAULT
);

ALTER TABLE PRODUCT
ADD "TAG" VARCHAR2(50) NULL; 

COMMIT;