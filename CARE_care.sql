--CREATE USER CARE identified by CARE;

--grant RESOURCE, CONNECT To CARE;

--rollback;
--COMMIT;

-- ��纸ȣ�� ������
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

COMMENT ON COLUMN PATIENT_WANTED.WANTED_GRADE IS '���';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_GEN IS '�������';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_AGE IS '�������';
COMMENT ON COLUMN PATIENT_WANTED.WANTED_ILL IS '�����ȯ';

-- ��纸ȣ�� �̹���
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


COMMENT ON COLUMN CARE_IMAGE.IMG_NO IS '���Ϲ�ȣ';
COMMENT ON COLUMN CARE_IMAGE.IMG_DATE IS '�����';
COMMENT ON COLUMN CARE_IMAGE.IMG_PATH IS '������ġ';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_ORG IS '���������̸�';
COMMENT ON COLUMN CARE_IMAGE.IMG_NAME_SAV IS '���������̸�';


