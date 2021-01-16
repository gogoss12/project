<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
  <title>Document</title>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
    	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img src="./image/케어풀 임시 아이콘.png" alt="" width="150px" height="100%">
        </a>
=======
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>
>>>>>>> 335da996538bc75f40c94f97382e29b51ab9696f

 <header>
		<div id="wrapper">
            <div id="logo">
                <a href="">
                     <img src="./image/케어풀 임시 아이콘.png" alt="" >
                </a>
            </div>
			<div id="page">
				<h1>Care pool</h1>
			</div>
			<div id="login">
			    <input type="button" id="loginbtn" value="로그인" onclick="location.href = '<%=request.getContextPath()%>/member/login';">
                <input type="button" id="enrollbtn" value="회원가입" onclick="location.href = '<%=request.getContextPath()%>/member/enroll';">
                <input type="button" id="authbtn" value="인증/확인">
            </div>
        </div>
        <nav>
			<ul id="main-menu">
				<li><a href="#">소개</a></li>
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
    
    
