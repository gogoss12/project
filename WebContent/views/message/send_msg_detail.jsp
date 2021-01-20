<%@page import="com.care.mvc.message.model.vo.SendMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.care.mvc.message.model.vo.ReceiveMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="../../css/style.css">
<%
	ArrayList<ReceiveMessage> list = (ArrayList)request.getAttribute("list");
	
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
					<div id="msg_2-2-header">
						<input type="button" name="delete_msg" onclick="delete_msg()" value="X삭제" style="color: red;"> 
						<input type="text" name="find_id" placeholder="아이디 검색 : "> 
						<input type="button" name="search_id" value="검색">
					</div>
					<div id="msg_2-2-body">
                        <div id="msg_contents1">             <!-- 여기 a태그 없앨지 있을지 여부 -->
                            <b>받는사람 : &nbsp;</b> <a href="#"></a><b><%=sendM.getRec_id()%></b></a>
                        </div>
                        <div id="msg_contents1">
                            <b>보낸파일 : &nbsp;</b> <a href="#"><b> 채워야하는 부분 </b></a>
                        </div>
                        <div id="msg_contents1">
                            <b>보낸날짜 : &nbsp;</b> <b><%=sendM.getSend_date()%></b>
                        </div>
					</div>
                            
                    <!-- 이게 보낸 내용 -->
                    <div id="msg_contents2">
                        <a href="#"><b><%=sendM.getSend_body()%></b></a>
                    </div>
				</div>
			</div>
		</form>
	</div>
</section>
<script>
	$(document).ready(function() {
		 $('#checkAll').change(function () {
             if ($(this).prop('checked')) {
                 $('input:checkbox').prop('checked', true);
             } else {
                 $('input:checkbox').prop('checked', false);
             }
         });
	});
	

</script>
<%@ include file="/views/common/footer.jsp"%></>