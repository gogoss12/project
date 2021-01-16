<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String confirm = (String)request.getAttribute("confirm");
	String role = (String)request.getAttribute("role");
	boolean is = role.contains("guardian");
	System.out.println(role);
	System.out.println(is);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
</head>
<body>
	<script>
	
     if(confirm("<%= confirm %>")){
    	 if(<%= role.contains("caregiver")%>){
    		 location.replace("<%=request.getContextPath()%>");
    		 
    	 }else if(<%= role.contains("guardian")%>){
    		 location.replace("<%=request.getContextPath()%>/enroll/profile/guardian");
    	 }
     }else {
    	 location.replace("<%=request.getContextPath()%>");
     }
     
     </script>
</body>
</html>