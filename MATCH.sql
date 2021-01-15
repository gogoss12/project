CREATE USER CARE IDENTIFIED BY CARE;
GRANT RESOURCE, CONNECT TO CARE;

-- MATCH 테이블 생성
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

COMMENT ON COLUMN MATCH.mat_no IS '매칭번호';
COMMENT ON COLUMN MATCH.mat_place IS '돌봄위치';
COMMENT ON COLUMN MATCH.mat_date_sta IS '시작날짜';
COMMENT ON COLUMN MATCH.mat_date_end IS '종료날짜';
COMMENT ON COLUMN MATCH.mat_rq IS '요구사항';
COMMENT ON COLUMN MATCH.care_no IS '요양사번호';
COMMENT ON COLUMN MATCH.guard_no IS '보호자번호';

--------------------------------------------------------------------------------

-- MATCH_DETAILS 테이블 생성
CREATE TABLE MATCH_DETAILS (
	det_no varchar2(100) NOT NULL,
	det_date_fix date DEFAULT SYSDATE,
	mat_no number NOT NULL,
    CONSTRAINT PK_MATCH_DETAILS PRIMARY KEY(det_no)
);

COMMENT ON COLUMN MATCH_DETAILS.det_no IS '매칭내역번호';
COMMENT ON COLUMN MATCH_DETAILS.det_date_fix IS '매칭확정날짜';
COMMENT ON COLUMN MATCH_DETAILS.mat_no IS '매칭번호';

CREATE SEQUENCE SEQ_DET_NO;

--------------------------------------------------------------------------------

-- CERTIFICATION 테이블 생성
CREATE TABLE CERTIFICATION (
	cert_no number NOT NULL,
	cert_file varchar2(20) NULL,
	cert_text varchar2(100) NULL,
	cert_time date DEFAULT SYSDATE,
	mat_no number NOT NULL,
    CONSTRAINT PK_CERTIFICATION PRIMARY KEY(cert_no)
);

COMMENT ON COLUMN CERTIFICATION.cert_no IS '인증번호';
COMMENT ON COLUMN CERTIFICATION.cert_file IS '첨부파일';
COMMENT ON COLUMN CERTIFICATION.cert_text IS '텍스트';
COMMENT ON COLUMN CERTIFICATION.cert_time IS '보낸시간';
COMMENT ON COLUMN CERTIFICATION.mat_no IS '매칭번호';

CREATE SEQUENCE SEQ_CERT_NO;

--------------------------------------------------------------------------------

--FOREIGN KEY 추가
ALTER TABLE MATCH_DETAILS ADD FOREIGN KEY(mat_no) REFERENCES MATCH;

ALTER TABLE CERTIFICATION ADD FOREIGN KEY(mat_no) REFERENCES MATCH;



ALTER TABLE MATCH ADD FOREIGN KEY(care_no) REFERENCES GUARDIAN_PROFILE;

-- 파일 병합 후 실행
--ALTER TABLE MATCH ADD FOREIGN KEY(guard_no) REFERENCES CAREGIVER_PROFILE;

--------------------------------------------------------------------------------
