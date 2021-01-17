<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.care.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%
	String saveId = null;
	Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	
	// 쿠키값 받아오기
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("saveId")) {
				saveId = c.getValue();
				
				break;
			}
		}
	}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>

</head>
<body>
	<header>

		<div id="wrapper">
            <div id="logo">
               	 <a href="<%=request.getContextPath()%>" >
                     <img src="./image/케어풀 임시 아이콘.png" alt="" >
                </a>
            </div>
			<div id="page">

				<h1>Carepool</h1>
			</div>
			<div id="login">
			<% if (loginMember == null) { %>	
				<input type="button" id="loginbtn" value="로그인"
					onclick="location.href = '<%=request.getContextPath()%>/member/login';">
				<input type="button" id="enrollbtn" value="회원가입"
					onclick="location.href = '<%=request.getContextPath()%>/member/enroll';">

			<% } else { %>						
				<input type="button" value="마이페이지"
					onclick="location.href = '<%= request.getContextPath() %>/member/view?userId=<%= loginMember.getMemId()%>';">
				
				<!-- 드롭박스는 마이페이지에서 보일 예정 -->
				<!-- <select name="myPage">
					<option selected>마이페이지</option>
					<option value="editInfo">개인정보 수정</option>
					<option value="certList">인증내역</option>
					<option value="message">쪽지기록</option>
					<option value="matchList">매칭내역</option>
					<option value="delAcct">회원탈퇴</option>
				</select> -->
				
				<input type="button" id="authbtn" value="인증/확인">					
				<input type="button" id="logoutbtn" value="로그아웃" 
					onclick="location.replace('<%= request.getContextPath() %>/logout');">
			<% } %>

			</div>
		</div>
		<nav>

			<ul id="main-menu">
				<li><a href="<%=request.getContextPath()%>/intro" >소개</a></li>
				<li><a href="#">매칭</a>
					<ul id="sub-menu">
						<li><a href="#">매칭검색</a></li>
					</ul>
				</li>
				<li><a href="#">서비스</a>
					<ul id="sub-menu">
						<li><a href="#">쪽지</a></li>
						<li><a href="#">지도</a></li>
					</ul>
				</li>
			</ul>
		</nav>

	</header>
