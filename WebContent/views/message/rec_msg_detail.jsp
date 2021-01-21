<%@page import="com.care.mvc.message.model.vo.ReceiveMessageImg"%>
<%@page import="com.care.mvc.message.model.vo.SendMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.care.mvc.message.model.vo.ReceiveMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="../../css/style.css">
<%
	ReceiveMessage receivemessage = (ReceiveMessage)request.getAttribute("recmessage");
	ReceiveMessageImg imgR	= (ReceiveMessageImg)request.getAttribute("imgR");
%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<div id="msg_container">
		<form action="<%= request.getContextPath()%>/msg/get" method="POST">
			<div id="msg_1">
				<h1>CAREPOOL 쪽지</h1>
			</div>
			<div id="msg_2">
				<div id="msg_2-1">
					<div id="write_msg">
                        <a href="<%= request.getContextPath()%>/msg/write">쪽지쓰기</a>
                    </div>
					<div>
						<a href="<%= request.getContextPath()%>/msg/get"> 받은쪽지함 </a>
					</div>
					<div>
						<a href="<%= request.getContextPath()%>/msg/send"> 보낸쪽지함 </a>
					</div>
				</div>
				<div id="msg_2-2">
					<div id="msg_2-2-body">
                        <div id="msg_contents1">             <!-- 여기 a태그 없앨지 있을지 여부 -->
                            <b>보낸사람 : &nbsp;</b> <a href="#"></a><b><%=receivemessage.getSend_id()%></b></a>
                        </div>
                        <div id="msg_contents1">
                            <b>받은파일 : &nbsp;</b> 
                            		<% if(imgR.getRec_img_name_org() != null) { %>
                            	<a href="#">
                            		<b><%=imgR.getRec_img_name_org()%></b>
                            		<% } else { %>
                            			<b>파일 없음</b>
                            		<% } %>
                            	</a>
                        </div>
                        <div id="msg_contents1">
                            <b>받은날짜 : &nbsp;</b> <b><%=receivemessage.getRec_date()%></b>
                        </div>
					</div>
                            
                    <!-- 이게 보낸 내용 -->
                    <div id="msg_contents2">
                        <b><%=receivemessage.getRec_body()%></b>
                    </div>
				</div>
			</div>
		</form>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%></>