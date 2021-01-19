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
					<div id="msg_2-2-section">
					<table id="msg_table">
								<tr>
									<td id="td-1"><input type="checkbox" name="delete_check" value="delete_check"></td>
									<td id="td-1" style="width: 150px;"><b>보낸사람</b></td>
									<td id="td-1"><b>내용</b>	</td>
									<td id="td-1" style="width: 200px;"><b>받은날짜</b></td>
								</tr>
								
								<% if(list.isEmpty()) { %>
								<tr>
									<td id="td-2" colspan="6">
										받은 메세지가 존재하지 않습니다.
									</td>
								</tr>
								<% }else { 
										for(ReceiveMessage revM : list){
											if(loginMember.getMemId().equals(revM.getMem_id())){									
								%>								
								<tr>
									<td id="td-2" >
										<input type="checkbox" name="delete_check" value="delete_check">
									</td>
									<td id="td-2" style="width: 80px;">
										<a href="#">
											<b><%=revM.getSend_id()%></b>
										</a>
									</td>
									<td id="td-2">
										<a href="#">
											<b><%=revM.getRec_body()%></b>
										</a>
									</td>
									<td id="td-2" style="width: 120px;">
										<b><%=revM.getRec_date()%></b>
									</td>
								</tr>
									<%}
								 } 
							} %>
							</table>
						<div id="msg_2-2-footer">
							<div id="pageBar">
								<!-- 맨 처음으로 -->
								<button onclick="location.href=''">&lt;&lt;</button>
								<!-- 이전 페이지로 -->
								<button>&lt;</button>
								<!--  10개 페이지 목록 -->
								<button>1</button>
								<button onclick="location.href=''">2</button>
								<button onclick="location.href=''">3</button>
								<button>4</button>
								<button>5</button>
								<!-- 다음 페이지로 -->
								<button>&gt;</button>
								<!-- 맨 끝으로 -->
								<button>&gt;&gt;</button>
							</div>
						</div>
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