--CREATE USER CARE identified by CARE;

--grant RESOURCE, CONNECT To CARE;

--rollback;
--COMMIT;

-- 요양보호사 프로필
CREATE TABLE caregiver_profile (
	care_no 	    NUMBER	        NOT NULL,
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

-- 시퀀스 생성
CREATE SEQUENCE SEQ_care_no;


COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_NO IS '요양사번호';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_LICENSE IS '자격증';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_YEARS IS '경력';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_HISTORY IS '경력사항 상세입력';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_PLUS IS '장점';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_TIME IS '희망근무시간';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_PLACE IS '희망근무위치';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_SAL IS '희망급여';
COMMENT ON COLUMN CAREGIVER_PROFILE.CARE_INTRO IS '자기소개';

-- 케어희망환자
CREATE TABLE patient_wanted (
	wanted_grade	NUMBER	        NOT NULL,
	care_no	        NUMBER	        NOT NULL,
	wanted_gen	    CHAR(9)	        NULL,
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

COMMENT ON COLUMN PATIENT_WANTED.WANTED_GRADE IS '등급';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_GEN IS '희망성별';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_AGE IS '희망나이';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_ILL IS '희망질환';

-- 요양보호사 이미지
CREATE TABLE care_image (
	img_no	       NUMBER	    NOT NULL,
	care_no    	   NUMBER	    NOT NULL,
	img_date	   DATE     	NULL,
	img_path	   VARCHAR(20)	NULL,
	img_name_org   VARCHAR(20)	NULL,
	img_name_sav   VARCHAR(20)	NULL
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


COMMENT ON COLUMN CARE_IMAGE.IMG_NO IS '파일번호';
COMMENT ON COLUMN CARE_IMAGE.IMG_DATE IS '등록일';
COMMENT ON COLUMN CARE_IMAGE.IMG_PATH IS '저장위치';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_ORG IS '원본파일이름';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_SAV IS '저장파일이름';


