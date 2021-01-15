CREATE USER CARE IDENTIFIED BY CARE;
GRANT RESOURCE, CONNECT TO CARE;

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
