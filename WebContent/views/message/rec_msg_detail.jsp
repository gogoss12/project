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
						<a href="<%= request.getContextPath()%>/msg/get?loginMember=<%= loginMember.getMemId() %>"> 받은쪽지함 </a>
					</div>
					<div>
						<a href="<%= request.getContextPath()%>/msg/send?loginMember=<%= loginMember.getMemId() %>"> 보낸쪽지함 </a>
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
                            	<a href="javascript:fileDownload('<%= imgR.getRec_img_name_org() %>','<%= imgR.getRec_img_name_sav() %>');">
                            		<b><%=imgR.getRec_img_name_org()%></b>
					 			<script>
							 		function fileDownload(oriname, rename) {
							 			const url = "<%=request.getContextPath() %>/board/fileDown";
							 			
							 			// 인코딩하는 이 부분이 중요하다.
							 			// 크롬은 자동으로 인코딩해주나(맞나??) IE는 encodeURIComponent을 사용해서 한글을 인코딩을 해줘야한다
							 			// post는 인코딩을 해주나, get은 안해줘서 이렇게 직접 바꿔줘야한다.
							 			let oName = encodeURIComponent(oriname);
							 			let rName = encodeURIComponent(rename);
							 			
							 			location.assign(url + "?oriname=" + oName + "&rename=" + rName);
							 		}
							 	</script>
                            		
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