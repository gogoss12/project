<%@page import="com.care.mvc.common.util.PageInfo"%>
<%@page import="com.care.mvc.message.model.vo.SendMessage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../../css/style.css">
<%

	ArrayList<SendMessage> list = (ArrayList)request.getAttribute("list");
	PageInfo info = (PageInfo)request.getAttribute("pageInfo");

%>
<%@ include file="/views/common/header.jsp" %>
<section>
    <div id="msg_container">
        <form action="<%= request.getContextPath()%>/search/sendId" method="post">
            <div id="msg_1">
                <h1>CAREPOOL 쪽지</h1>
            </div>
            <div id="msg_2">
                <div id="msg_2-1">
                    <div id="write_msg">
                        <a href="<%= request.getContextPath()%>/msg/write">쪽지쓰기</a>
                    </div>
                    <div>
                        <a href="<%= request.getContextPath()%>/msg/get">
                            받은쪽지함
                        </a>
                    </div>
                    <div>
                        <a href="<%= request.getContextPath()%>/msg/send">
                            보낸쪽지함
                        </a>
                    </div>
                </div>
                <div id="msg_2-2">
                    <div id="msg_2-2-header">
                        <input type="text" id="find_id" name="find_id" placeholder="아이디 검색 : ">
                        <input type="button" name="search_id" value="검색" onclick="search()">
                    </div>
                    <script>
                    	function search(){
                    		var id = document.getElementById('find_id').value;
                    		location.href="<%= request.getContextPath()%>/search/sendId?Id="+id
                    	}
                    
                    </script>
                    <div id="msg_2-2-section">
                        <table id="msg_table">
                            <tr>
                                <td id="td-1" style="width: 150px;"><b>번호</b></td>
                                <td id="td-1" style="width: 150px;"><b>받은사람</b></td>
                                <td id="td-1"><b>내용</b>	</td>
                                <td id="td-1" style="width: 150px;"><b>파일</b></td>
                                <td id="td-1" style="width: 200px;"><b>보낸날짜</b></td>
                                <td id="td-1" style="width: 30px;"><b>-</b></td>
                            </tr>
                             <% if(list.isEmpty()) { %>
                            <tr>
                                <td id="td-2" colspan="6">
                                    보낸 메세지가 존재하지 않습니다.
                                </td>
                            </tr>
                            <% }else { 
                                for(SendMessage sendM : list){
                            %>								
                            <tr>
                                <td id="td-2" >
										<!--  <b><1%=sendM.getRowNum()%></b>-->
										<b><%=sendM.getRowNum()%></b>
									</td>
                                <td id="td-2" style="width: 80px;">
                                    <a href="#">
                                        <b><%=sendM.getRec_id()%></b>
                                    </a>
                                </td>
                                <td id="td-2">
                                    <a href="<%=request.getContextPath()%>/sendMsg/details?send_no=<%= sendM.getSend_no()%>">
                                        <b><%=sendM.getSend_body()%></b>
                                    </a>
                                </td>
                                
                                <td id="td-2">
                                    <a href="">
                                        <b> 채워야하는 부분 </b>
                                    </a>
                                </td>
                                
                                <td id="td-2">
                                    <b><%=sendM.getSend_date()%></b>
                                </td>
                                <td id="td-2" style="width: 30px;">
										<input type="button" value="삭제" onclick="delete_row()" name="delete" style="color:red;">
										<script>
										function delete_row(){
											if(confirm("쪽지를 삭제하시겠습니까 ?")){
												location.href="<%=request.getContextPath()%>/delete/send?SendNum=<%=sendM.getSend_no()%>"
											}; 
									    };
										</script>
									</td>
                            </tr>
                                <%}
                        } %>
                        </table>
						</div>
                    </div>
                </div>
            </form>
           <div id="msg_2-2-footer">
			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/msg/send?send_page=1'">&lt;&lt;</button>
				<!-- 이전 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath() %>/msg/send?send_page=<%= info.getPrvePage()%>'">&lt;</button>
				
				<!--  10개 페이지 목록 -->
				
				<% for(int p = info.getStartPage(); p <= info.getEndPage(); p++) { %>
					<% if(p == info.getCurrentPage()) { %>
						<button disabled><%= p %></button>
					<% }else { %>
						<button onclick="location.href='<%= request.getContextPath()%>/msg/send?send_page=<%= p %>'"><%= p %></button>
					<% } %>
				<% } %>
				<!-- 다음 페이지로 -->
				<button onclick="location.href='<%= request.getContextPath()%>/msg/send?send_page=<%= info.getNextPage() %>'">&gt;</button>
				<!-- 맨 끝으로 -->
				<button onclick="location.href='<%= request.getContextPath()%>/msg/send?send_page=<%= info.getMaxPage() %>'">&gt;&gt;</button>
			</div>
		</div>
        </div>
    </section>
    <%@ include file="/views/common/footer.jsp" %>