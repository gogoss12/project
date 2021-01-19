<%@page import="java.util.ArrayList"%>
<%@page import="com.care.mvc.message.model.vo.ReceiveMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<ReceiveMessage> list = (ArrayList)request.getAttribute("list");
	ReceiveMessage r = new ReceiveMessage();
	System.out.println(r.getMem_id());
	System.out.println(session.getAttribute("loginMember"));
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
						<input type="button" name="write" value="쪽지쓰기">
					</div>
					<div>
						<a href="#"> 받은쪽지함 </a>
					</div>
					<div>
						<a href=""> 보낸쪽지함 </a>
					</div>
				</div>
				<div id="msg_2-2">
					<div id="msg_2-2-header">
						<input type="button" name="delete_msg" value="X삭제"> 
						<input type="text" name="find_id" placeholder="아이디 검색 : "> 
						<input type="button" name="search_id" value="검색">
					</div>
					<div id="msg_2-2-section">
					<table id="msg_table">
								<tr>
									<td><input type="checkbox" name="delete_check" value="delete_check"></td>
									<td id="td-2" style="width: 80px;"><b>보낸사람</b></td>
									<td id="td-3"><b>내용</b>	</td>
									<td id="td-4" style="width: 120px;"><b>날짜</b></td>
								</tr>
								
								<% if(list.isEmpty()) { %>
								<tr>
									<td colspan="6">
										받은 메세지가 존재하지 않습니다.
									</td>
								</tr>
								<% }else { 
									for(ReceiveMessage recM : list){
										if(recM.getMem_id().equals(loginMember.getMemId())){
								%>								
								<tr>
									<td id="td-1">
										<input type="checkbox" name="delete_check" value="delete_check">
									</td>
									<td id="td-2" style="width: 80px;">
										<a href="#">
											<b><%=recM.getSend_id()%></b>
										</a>
									</td>
									<td id="td-3">
										<a href="#">
											<b><%=recM.getRec_body()%></b>
										</a>
									</td>
									<td id="td-4" style="width: 120px;">
										<b><%=recM.getRec_date()%></b>
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
<%@ include file="/views/common/footer.jsp"%></>