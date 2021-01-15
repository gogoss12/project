<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="loginForm" action="<%= request.getContextPath()%>/member/login" method="post">
    <h2>로그인</h2>
    <div id="idForm">
      <input type="text" id="userId" name="userId" placeholder="아이디">
    </div>
    <div id="passForm">
      <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
    </div>
    <button type="submit" id="btn">
     로그인
    </button>
  </form>
</body>
</html>