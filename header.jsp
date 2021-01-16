<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
</head>
<body>

<div id="wapper">
 <header>   
<h1>Care pool</h1>
<div id="logo">
<img src="resource/image/케어풀 임시 아이콘.png" alt="" width="150px" height="100%"></div>
<div id="login">
   <label><input type="button" id="loginbtn"   value="로그인" onclick="location.href = '<%= request.getContextPath() %>/member/login';"></label> 
   <label><input type="button" id="enrollbtn" value="회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/enroll';"></label>
   <label><input type="button" id="authbtn"  value="인증하기/확인하기"     style="float: right;"></label>
</div>
</header>
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


   <section>
      <div id="btngroup">
      <label><input type="button" id="carbtn" value="요양보호사" ></label>
      <label><input type="button" id="guabtn" value="보호자" ></label>
      </div>   
      <img src="resource/image/old-age-957492_1920.jpg" alt=""  width="600px" height="800px" style="float: right">

     </section>

