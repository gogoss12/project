<%@page import="com.care.mvc.GuardAndPatient.model.vo.Patient"%>
<%@page import="com.care.mvc.care.model.vo.Care"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Care caregiver = (Care)request.getAttribute("care");
	Patient patient = (Patient)request.getAttribute("patWnated");
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pro_line {
	width: 100%;
	height: auto;
	text-align: center;
}

#pro_con {
	font-size: 13px;
	background-color: #8B4513;
	width: 40%;
	text-align: center;
	margin-bottom: 5%;
	margin: auto;
	display: relative;
	border-radius: 5px;
}

#pro_main {
	text-align: center;
	max-width: 600px;
	border-style: ridge;
	margin: auto;
	display: relative;
}

#empty {
	font-size: 15px;
	font-weight: 600;
	padding-bottom: 10px;
	padding-top: 15px;
	background-color: #DEB887;
	height: 30px;
}

#pro_main table {
	width: 100%;
	text-align: center;
	padding-left: 0%;
	border: black;
	table-layout: fixed;
	word-break: break-all;
}

#pro_main th, td {
	border-bottom: 1px solid #444444;
	padding: 30px;
}

.pro_li {
	padding-top: 5px;
	width: 200px;
	height: 200px;
	margin: auto;
	display: relative;
	margin-bottom: 10%;
}

.pro_infor {
	cursor: pointer;
	margin-right: 300%;
	margin-top: 80%;
	line-height: 2.0;
	margin: auto;
}

#pro_btn button {
	border: 2px solid black;
	border-color: lightsteelblue;
	color: black;
	background-color: white;
	width: 100px;
	height: 40px;
	font-size: 1.0rem;
	font-weight: 700;
	margin: auto;
	display: relative;
}

#pro_btn button:hover {
	background-color: lightsteelblue;
	color: white;
}

.pro_Table {
	width: 40%;
}
</style>
</head>
<body>
<div id="pro_con">
        <h1>요양보호사 프로필 확인</h1>
    </div>
    <div class="pro_line">
        <div class="pro_li">
            <img src="./image/병아리당황.png">

            <div class="pro_infor">

                <div style="font-size: 20px; font-weight: 900;"></div>
                <div style="font-size:15px;"><%=caregiver.getCareGen() %></div>
                <div style="font-size:15px;">38세</div>
                <div style="font-size:15px;">경력N년</div>

            </div>
        </div>
        <div id="pro_main">
            <div id="empty">
                세부사항
            </div>
            <table>
                <tbody>
                    <tr>
                        <td class="pro_Table">자격증</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">세부사항</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">장점</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table" id="detail_">세부경력</td>
                        <td>내용</td>
                        
                    </tr>
                    <tr>
                        <td class="pro_Table">장점</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">희망근무시간</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">희망근무위치</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">희망급여</td>
                        <td>내용</td>
                    </tr>

                </tbody>
            </table>

            <table>
                <div id="empty">
                    케어가능환자
                </div>
                <thead>
                    <tr>
                        <td class="pro_Table">환자상태1:<br>성별 및 나이</td>
                        <td>내용</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="pro_Table">환자상태2:<br>질환</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">환자상태:<br>장기요양등급</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td class="pro_Table">환자상태:<br>장기요양등급</td>
                        <td>내용</td>
                    </tr>
                </tbody>

            </table>

            <h3>자기소개</h3>

            <iframe width="350px" height="200px" src="" frameborder="1"></iframe>
        </div>
        <div id="pro_btn">
            <button>쪽지보내기</button>
        </div>
    </div>
</body>
</html>