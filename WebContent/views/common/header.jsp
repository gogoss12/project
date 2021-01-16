<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<style>
	* {
		border: 1px solid red;
		margin: 0;
		padding: 0%;
	}

	header {
		height: 200px;
		width: 100%;
	}

	#header_top {
		height: 120px;
		width: 100%;
		display: flex;
	}

	#header_buttom {
		height: 80px;
		width: 100%;
	}

	#header_top>.box {
		display: inline-block;
		height: 100%;
	}

	#logo {
		width: 15%;
		text-align: center; /*img 가운데 정렬*/
	}

	#title {
		width: 45%;
	}

	#title h1 {
		font-size: 5rem;
		text-align: right;
		vertical-align: middle;
		line-height: 120px;
	}

	#login {
		width: 40%;
		text-align: right;
		display: flex;
		justify-content: space-around;
		padding: 10px;
		overflow: hidden;
	}

	#login input[type=button] {
		width: 150px;
		height: 50px;
		margin: 30px;
	} 

	#main-menu li, #sub-menu li {
		width: 300px;
	}

	#main-menu {
		height: 100%;
		width: 900px;
		display: flex;
		justify-content: center;
	}

	#main-menu li a {
		padding: 0;
		line-height: 80px;
		font-size: 2rem;
	}

	#sub-menu li {
		padding: 0;
		height: 100%;
		text-align: center;
	}

	#sub-menu li a {
		padding: 0;
		font-size: 2rem;
		display: flex; /* a를 li 전체로 선택 */
		align-items: center;
		justify-content: center;
		text-decoration: none; /* 적용 안됨 */
		/* height: 100%;  */
		/* line-height: 80px; */
	}
</style>

<body>

	<header>
		<div id="header_top">
			<div class="box" id="logo">
				<img src="resource/image/케어풀 임시 아이콘.png" alt="" width="150px"
					height="100%">
			</div>

			<div class="box" id="title">
				<h1>CAREPOOL</h1>
			</div>
			
			<div class="box" id="login">
				<label><input type="button" id="loginbtn" value="로그인"
					onclick="location.href = '<%= request.getContextPath() %>/member/login';"></label>
				<label><input type="button" id="enrollbtn" value="회원가입"
					onclick="location.href = '<%= request.getContextPath() %>/member/enroll';"></label>
				<label><input type="button" id="authbtn" value="인증하기/확인하기"></label>
			</div>
		</div>

		<nav id="header_bottom">
			<ul id="main-menu">
				<li><a href="#">소개</a></li>
				<li><a href="#">매칭</a>
					<ul id="sub-menu">
						<li><a href="#">매칭검색</a></li>
					</ul></li>
				<li><a href="#">서비스</a>
					<ul id="sub-menu">
						<li><a href="#">쪽지</a></li>
						<li><a href="#">지도</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
