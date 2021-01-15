-- MEMBER ���̺� ����

CREATE TABLE MEMBER (
	MEM_ID	VARCHAR2(20) NOT NULL UNIQUE,
	MEM_ROLE VARCHAR2(10) NULL,
	MEM_NAME VARCHAR2(10) NOT NULL,
	MEM_PWD	VARCHAR2(20)	NOT NULL,
	MEM_EMAIL VARCHAR2(50) NOT NULL,
	MEM_PHONE VARCHAR2(13) NOT NULL,
	MEM_ADDR VARCHAR2(100) NOT NULL,
	MEM_BIRTH VARCHAR2(20) NOT NULL,
	CREATE_DATE	DATE DEFAULT SYSDATE,
	MODIFY_DATE	DATE DEFAULT SYSDATE,
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

-- MEMBER ���̺� �ڸ�Ʈ
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.MEM_ROLE IS 'ȸ��Ÿ��';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '��й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.MEM_PHONE IS '�޴���ȭ';
COMMENT ON COLUMN MEMBER.MEM_ADDR IS 'ȸ���ּ�';
COMMENT ON COLUMN MEMBER.MEM_BIRTH IS '�������';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS '������¥';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '������¥';
COMMENT ON COLUMN MEMBER.STATUS IS '���°�(Y/N)';

-- ������ ���� ����
INSERT INTO MEMBER VALUES (
    'admin',
    'ROLE,ADMIN',
    '������',
    '1234',
    'CAREPOOL@NAVER.COM',
    '010-0000-0000',
    '�����',
    '1993/00/00',
    SYSDATE,
    SYSDATE,
    DEFAULT
);

-- ������ ȸ�� ����
INSERT INTO MEMBER VALUES (
    'asdf',
    'ROLE,USER',
    'ȫ�浿',
    '1234',
    'CARE@NAVER.COM',
    '010-1020-0000',
    '�����',
    '1999/10/20',
    SYSDATE,
    SYSDATE,
    DEFAULT
);

----------------------------------------------------------------------
-- ��ȣ�� ����
CREATE TABLE GUARDIAN_PROFILE (
	GUARD_NO NUMBER	NOT NULL,
	GUARD_GEN VARCHAR2(2) NOT NULL,
	GUARD_PAT VARCHAR2(10) NOT NULL,
	MEM_ID	VARCHAR2(20) NOT NULL
);
-- ������ ����
CREATE SEQUENCE SEQ_GUARD_NO;
-- ��ȣ�� ��ȣ PK���
ALTER TABLE GUARDIAN_PROFILE ADD CONSTRAINT PK_GUARDIAN_PROFILE PRIMARY KEY (
	GUARD_NO
);

--ALTER TABLE GUARDIAN_PROFILE MODIFY GUARD_GEN CHAR(3) CHECK(GUARD_GEN IN('��','��'));

-- ȸ�� ���̵� �ܷ�Ű ���
ALTER TABLE GUARDIAN_PROFILE ADD CONSTRAINT FK_member_TO_guardian_profile FOREIGN KEY (
	MEM_ID
)
REFERENCES member (
	MEM_ID
);
-- ��ȣ�������� �ڸ�Ʈ ���
COMMENT ON COLUMN GUARDIAN_PROFILE.GUARD_NO IS '��ȣ�ڹ�ȣ';
COMMENT ON COLUMN GUARDIAN_PROFILE.GUARD_GEN IS '����';
COMMENT ON COLUMN GUARDIAN_PROFILE.GUARD_PAT IS '(��ȣ��/ȯ��)';

-- ��ȣ�� ������ ����
INSERT INTO guardian_profile VALUES(
    SEQ_GUARD_NO.NEXTVAL,
    '��',
    'ȯ��',
    'asdf'
);
-- MEMBER �� �����ؼ� ���� Ȯ��
SELECT MEM_PHONE, GUARD_GEN
FROM MEMBER M
JOIN guardian_profile G ON(M.MEM_ID = G.MEM_ID);

CREATE TABLE patient_details (
	pat_no NUMBER NOT NULL,
	guard_no NUMBER	NOT NULL,
    pat_place VARCHAR2(200) NOT NULL,
    pat_period VARCHAR2(200) NOT NULL,
    pat_hop_time VARCHAR2(200) NOT NULL,
	pat_name VARCHAR2(20) NOT NULL,
	pat_age	NUMBER NOT NULL,
	pat_gen	CHAR(3) NOT NULL CHECK(pat_gen IN('��','��')),
	pat_kg	NUMBER NOT NULL,
    pat_infect VARCHAR2(50) NOT NULL,
	pat_grade VARCHAR2(20) NOT NULL,
	pat_sanit VARCHAR2(50) NOT NULL,
	pat_paral VARCHAR2(50) NOT NULL,
	pat_move VARCHAR2(50) NOT NULL,
	pat_bed	VARCHAR2(50) NOT NULL,
	pat_cogdis VARCHAR2(50) NOT NULL,
	pat_bathroom VARCHAR2(50) NOT NULL,
	pat_bowel_mn VARCHAR2(50) NOT NULL,
	pat_ostomy	VARCHAR2(50) NOT NULL,
	pat_help_eat VARCHAR2(50) NOT NULL,
	pat_suction VARCHAR2(50) NOT NULL,
	pat_guard_gen CHAR(3) CHECK(pat_guard_gen IN('��','��')) NOT NULL,
	pat_etc	VARCHAR2(1000) NULL
);
--DROP TABLE patient_details;

CREATE SEQUENCE SEQ_pat_no;


ALTER TABLE patient_details ADD CONSTRAINT PK_PATIENT_DETAILS PRIMARY KEY (
	pat_no
);
--�÷� �߰� ��
--ALTER TABLE patient_details ADD pat_hop_time DATE;
-- 2) �������� �߰�/����
--      2-1) �������� �߰�
--        PRIMARY KEY : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] PRIMARY KEY(�÷���);
--        FOREIGN KEY : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] FOREIGN KEY(�÷���) REFERENCES ���������̺�� [(�÷���)];
--        UNIQUE      : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] UNIQUE(�÷���)
--        CHECK       : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] CHECK(�÷������� ����)
--        NOT NULL    : ALTER TABLE ���̺�� MODIFY �÷��� [CONSTRAINT �������Ǹ�] NOT NULL;

ALTER TABLE patient_details ADD CONSTRAINT FK_GUARD_TO_PAT_DETAIL FOREIGN KEY (
	guard_no
)
REFERENCES guardian_profile(
	guard_no
);

COMMENT ON COLUMN PATIENT_DETAILS.PAT_NO IS 'ȯ�ڹ�ȣ';
COMMENT ON COLUMN PATIENT_DETAILS.guard_no IS '��ȣ�ڹ�ȣ';
COMMENT ON COLUMN PATIENT_DETAILS.pat_name IS '�̸�';
COMMENT ON COLUMN PATIENT_DETAILS.pat_age IS '����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_gen IS '����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_kg IS '������';
COMMENT ON COLUMN PATIENT_DETAILS.pat_place IS '�������(����/����)';
COMMENT ON COLUMN PATIENT_DETAILS.pat_period IS '�����Ⱓ';
COMMENT ON COLUMN PATIENT_DETAILS.pat_hop_time IS '����ð�';
COMMENT ON COLUMN PATIENT_DETAILS.pat_grade IS '�����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_infect IS '��������ȯ';
COMMENT ON COLUMN PATIENT_DETAILS.pat_sanit IS '��������';
COMMENT ON COLUMN PATIENT_DETAILS.pat_paral IS '�������';
COMMENT ON COLUMN PATIENT_DETAILS.pat_move IS '�ŵ�����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_bed IS '��âȯ�ڿ���(��/�ƴϿ�)';
COMMENT ON COLUMN PATIENT_DETAILS.pat_cogdis IS '������ֿ���';
COMMENT ON COLUMN PATIENT_DETAILS.pat_bathroom IS 'ȭ����̵�';
COMMENT ON COLUMN PATIENT_DETAILS.pat_bowel_mn IS '�躯����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_ostomy IS '��缳ġ����';
COMMENT ON COLUMN PATIENT_DETAILS.pat_help_eat IS '�Ļ絵�򿩺�';
COMMENT ON COLUMN PATIENT_DETAILS.pat_suction IS '���ǻ�뿩��';
COMMENT ON COLUMN PATIENT_DETAILS.pat_guard_gen IS '��뼺��';
COMMENT ON COLUMN PATIENT_DETAILS.pat_etc IS '��Ÿ����';

INSERT INTO PATIENT_DETAILS VALUES (
     SEQ_PAT_NO.NEXTVAL,
     1,
     '����-����� ���ı� ��ǵ� xx���� 307ȣ',
     '2021-01-10~2021-11-27',
     '����-11��-15��',
     '���Ŀ�',
     77,
     '��',
     45,
     'VRE, ����, �ƹ��ų� �����ּ���',
     '��޽�û��',
     'ħ�뿡�� ���� �ʿ�',
     '����',
     'Ȧ�� ����',
     '�ƴϿ�',
     '����',
     '������ �̵�����',
     '����',
     '�ƴϿ�',
     '���� �ʿ�',
     '������',
     '��',
     '�ȳ��ϼ��� �ߺ�Ź�帳�ϴ�'
);

-- ��ȣ�� ������ ��� ������

--CREATE USER CARE identified by CARE;

--grant RESOURCE, CONNECT To CARE;

--rollback;
--COMMIT;

-- ��纸ȣ�� ������
CREATE TABLE caregiver_profile (
	care_no 	    NUMBER	        NOT NULL,
    care_gen        CHAR(3) NOT NULL CHECK (CARE_GEN IN('��','��')),
	care_license	VARCHAR(100)	NULL,
	care_years	    VARCHAR(100)	NULL,
	care_history	VARCHAR(100)	NULL,
	care_plus	    VARCHAR(100)	NULL,
	care_time	    VARCHAR(100)	NULL,
	care_place	    VARCHAR2(100)	NULL,
	care_sal	    NUMBER	        NULL,
	care_intro	    VARCHAR2(200)	NULL,
	mem_id	        VARCHAR2(20)	NOT NULL
);

ALTER TABLE caregiver_profile ADD CONSTRAINT PK_CAREGIVER_PROFILE PRIMARY KEY (
	care_no
);

ALTER TABLE caregiver_profile ADD CONSTRAINT FK_member_TO_caregiver_profile FOREIGN KEY (
	MEM_ID
) 
REFERENCES MEMBER (
	MEM_ID
);

-- ������ ����
CREATE SEQUENCE SEQ_care_no;


COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_NO IS '�����ȣ';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_LICENSE IS '�ڰ���';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_YEARS IS '���';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_HISTORY IS '��»��� ���Է�';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_PLUS IS '����';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_TIME IS '����ٹ��ð�';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_PLACE IS '����ٹ���ġ';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_SAL IS '����޿�';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_INTRO IS '�ڱ�Ұ�';

-- �ɾ����ȯ��
CREATE TABLE patient_wanted (
	wanted_grade	NUMBER	        NOT NULL,
	care_no	        NUMBER	        NOT NULL,
	wanted_gen	    CHAR(3) NULL CHECK (WANTED_GEN IN('��','��')),
	wanted_age	    NUMBER	        NULL,
	wanted_ill	    VARCHAR(100)	NULL
);

ALTER TABLE patient_wanted ADD CONSTRAINT PK_PATIENT_WANTED PRIMARY KEY (
	wanted_grade,
	care_no
);

--ALTER TABLE patient_wanted ADD CONSTRAINT FK_caregiver_profile_TO_patient_wanted FOREIGN KEY (
--	care_no
--)
--REFERENCES caregiver_profile (
--	care_no
--);

COMMENT ON COLUMN PATIENT_WANTED.WANTED_GRADE IS '���';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_GEN IS '�������';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_AGE IS '�������';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_ILL IS '�����ȯ';

-- ��纸ȣ�� �̹���
CREATE TABLE care_image (
	img_no	       NUMBER	    NOT NULL,
	care_no    	   NUMBER	    NOT NULL,
	img_date	   DATE     	DEFAULT SYSDATE,
	img_path	   VARCHAR(100)	NULL,
	img_name_org   VARCHAR(100)	NULL,
	img_name_sav   VARCHAR(100)	NULL
);

ALTER TABLE care_image ADD CONSTRAINT PK_CARE_IMAGE PRIMARY KEY (
	img_no,
	care_no
);

--ALTER TABLE care_image ADD CONSTRAINT FK_caregiver_profile_TO_care_image FOREIGN KEY (
--	care_no
--)
--REFERENCES caregiver_profile (
--	care_no
--);


COMMENT ON COLUMN CARE_IMAGE.IMG_NO IS '���Ϲ�ȣ';
COMMENT ON COLUMN CARE_IMAGE.IMG_DATE IS '�����';
COMMENT ON COLUMN CARE_IMAGE.IMG_PATH IS '������ġ';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_ORG IS '���������̸�';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_SAV IS '���������̸�';


-- ��ġ ������ --

-- MATCH ���̺� ����
CREATE TABLE MATCH (
	mat_no number NOT NULL,
	mat_place varchar2(100)	NOT NULL,
    mat_date_sta date DEFAULT SYSDATE,
	mat_date_end date DEFAULT SYSDATE,
	mat_rq varchar2(100) NULL,
	care_no number NOT NULL,
	guard_no number	NOT NULL,    
    CONSTRAINT PK_MATCH PRIMARY KEY(mat_no)
);

CREATE SEQUENCE SEQ_MAT_NO;

COMMENT ON COLUMN MATCH.mat_no IS '��Ī��ȣ';
COMMENT ON COLUMN MATCH.mat_place IS '������ġ';
COMMENT ON COLUMN MATCH.mat_date_sta IS '���۳�¥';
COMMENT ON COLUMN MATCH.mat_date_end IS '���ᳯ¥';
COMMENT ON COLUMN MATCH.mat_rq IS '�䱸����';
COMMENT ON COLUMN MATCH.care_no IS '�����ȣ';
COMMENT ON COLUMN MATCH.guard_no IS '��ȣ�ڹ�ȣ';

--------------------------------------------------------------------------------

-- MATCH_DETAILS ���̺� ����
CREATE TABLE MATCH_DETAILS (
	det_no varchar2(100) NOT NULL,
	det_date_fix date DEFAULT SYSDATE,
	mat_no number NOT NULL,
    CONSTRAINT PK_MATCH_DETAILS PRIMARY KEY(det_no)
);

COMMENT ON COLUMN MATCH_DETAILS.det_no IS '��Ī������ȣ';
COMMENT ON COLUMN MATCH_DETAILS.det_date_fix IS '��ĪȮ����¥';
COMMENT ON COLUMN MATCH_DETAILS.mat_no IS '��Ī��ȣ';

CREATE SEQUENCE SEQ_DET_NO;

--------------------------------------------------------------------------------

-- CERTIFICATION ���̺� ����
CREATE TABLE CERTIFICATION (
	cert_no number NOT NULL,
	cert_file varchar2(20) NULL,
	cert_text varchar2(100) NULL,
	cert_time date DEFAULT SYSDATE,
	mat_no number NOT NULL,
    CONSTRAINT PK_CERTIFICATION PRIMARY KEY(cert_no)
);

COMMENT ON COLUMN CERTIFICATION.cert_no IS '������ȣ';
COMMENT ON COLUMN CERTIFICATION.cert_file IS '÷������';
COMMENT ON COLUMN CERTIFICATION.cert_text IS '�ؽ�Ʈ';
COMMENT ON COLUMN CERTIFICATION.cert_time IS '�����ð�';
COMMENT ON COLUMN CERTIFICATION.mat_no IS '��Ī��ȣ';

CREATE SEQUENCE SEQ_CERT_NO;

--------------------------------------------------------------------------------

--FOREIGN KEY �߰�
ALTER TABLE MATCH_DETAILS ADD FOREIGN KEY(mat_no) REFERENCES MATCH;

ALTER TABLE CERTIFICATION ADD FOREIGN KEY(mat_no) REFERENCES MATCH;



ALTER TABLE MATCH ADD FOREIGN KEY(care_no) REFERENCES GUARDIAN_PROFILE;

-- ���� ���� �� ����
--ALTER TABLE MATCH ADD FOREIGN KEY(guard_no) REFERENCES CAREGIVER_PROFILE;

--------------------------------------------------------------------------------

-- ��Ī �˻� ������ -----

--��Ī�����˻�
--DROP TABLE IF EXISTS match_seek;

CREATE TABLE MATCH_SEEK (
	SEEK_NO	NUMBER	NOT NULL,
    SEEK_TIME DATE,
	SEEK_GEN CHAR(3) NULL  CHECK(SEEK_GEN IN('��','��')),
	SEEK_LICENSE VARCHAR2(10) NULL,
	SEEK_YEARS VARCHAR2(10) NULL,
    SEEK_AREA VARCHAR2(10) NULL,
	SEEK_SAL NUMBER NULL,
	SEEK_GUARD_NO NUMBER NOT NULL
);



--DROP TABLE MATCH_SEEK;

COMMENT ON COLUMN  MATCH_SEEK.SEEK_NO IS '�˻���ȣ';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_TIME IS '�����ð�';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_GEN IS '��纸ȣ�缺��';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_LICENSE IS '�ڰ�������';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_YEARS IS '��»���';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_AREA IS '����ٹ�����';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_SAL IS '�޿�����';
COMMENT ON COLUMN  MATCH_SEEK.SEEK_GUARD_NO IS '�˻���ȣ�ڹ�ȣ';


--COMMENT ON TABLE MATCH_SEEK.SEEK_YEARS IS ''; 

ALTER TABLE MATCH_SEEK ADD CONSTRAINT PK_MATCH_SEEK PRIMARY KEY (
    SEEK_NO
);

ALTER TABLE match_seek ADD CONSTRAINT FK_GUARD_PRF_TO_MAT_SEEK FOREIGN KEY (
     SEEK_GUARD_NO
)
REFERENCES GUARDIAN_PROFILE(
   GUARD_NO
);

-- ����������

--DROP TABLE IF EXISTS profile_qs;

CREATE TABLE PROFILE_QS(
	QS_NO	NUMBER	NOT NULL,
	CARE_NO	NUMBER	NOT NULL,
    SEEK_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN PROFILE_QS.QS_NO IS '���ǹ�ȣ';
COMMENT ON COLUMN PROFILE_QS.CARE_NO IS '�����ȣ';
COMMENT ON COLUMN PROFILE_QS.SEEK_NO IS '�˻���ȣ';

ALTER TABLE PROFILE_QS ADD CONSTRAINT PK_PROFILE_QS PRIMARY KEY (
	QS_NO
);

ALTER TABLE PROFILE_QS ADD CONSTRAINT FK_CAR_PRF_PROFILE_QS FOREIGN KEY (
	CARE_NO
)
REFERENCES CAREGIVER_PROFILE (
   CARE_NO
);

ALTER TABLE PROFILE_QS ADD CONSTRAINT FK_MATCH_SEEK_TO_PROFILE_QS_1 FOREIGN KEY (
   SEEK_NO
)
REFERENCES MATCH_SEEK (
   SEEK_NO
);