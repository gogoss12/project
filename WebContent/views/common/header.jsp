<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/carePro_style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header_1">
                <a href="#">
                    <img src="./image/케어풀로고실험1.png" id="home-logo" width="120px">
                </a>
            </div>
            <div id="header_2"></div>
            <div id="header_3">
                <div id="login_form" style="margin-top: 60px;">
                    <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
                    <form action="" id="login_form_input">
                        <!-- 3_1. ID/PWD input요소가 들어갈 div -->
                        <div id="login_input_id_pwd">
                            <!-- 아이디 input -->
                            <input type="text" name="userId" placeholder="아이디를 입력하시오" required>
                            <!-- 비밀번호 input -->
                            <input type="password" name="userPwd" placeholder="비밀번호를 입력하시오" required>
                        </div>
                        <!-- 3_2. 로그인 버튼이 들어갈 div -->
                        <div id="login_input_btn">
                            <!-- 로그인버튼 input -->
                            <input type="submit" value="로그인">
                        </div>
                    </form>

                    <!-- 2_2. 회원가입페이지, ID/PWD 찾기 페이지 이동용 a 가 들어갈 영역-->
                    
                </div>
                
                <div id="login_form_etc">
                    <a href="">회원가입</a> 
                </div>
            </div>
        </div>
        <div id="navigator">
            <ul id="navi">
                <li><a href="">소개</a></li>
                <li><a href="">매칭</a>
                    <ul>
                        <li><a href="">매칭검색</a></li>
                    </ul>
                </li>
                <li><a href="">서비스</a>
                    <ul>
                        <li><a href="">채팅</a></li>
                        <li><a href="">지도</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>