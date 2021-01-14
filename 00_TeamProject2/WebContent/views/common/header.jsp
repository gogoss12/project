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
    <h1>케어풀</h1>
    
    <form id="loginFrm" action="<%= request.getContextPath()%>/member/login" method="post">
				<table>
				  <tr>
						<td>
							<input type="submit" value="로그인" onclick="location.href = '<%= request.getContextPath() %>/member/login';">						
						</td>
					<tr>
						<td colspan="2">
							<input type="button" value="회원가입"> 
						</td>
					</tr>
				</table>
			</form>
</body>
</html>