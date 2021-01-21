<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%	
	List<Member> profiles = (ArrayList) request.getAttribute("profiles");
%>

<section id="matchPage">

    <h2>검색하신 요양보호사님께 문의해보세요</h2>
    <div id="searchResult">
    <% if (profiles == null || profiles.isEmpty()) { %>
    		<!-- 검색결과 없음 -->
    <% } else {
    		for (Member member : profiles) { %>
    			<div class="profile">
                    <img src="../../image/병아리당황.png" alt="">
                    <h5><%= member.getMemName() %> (<%= member.getMemId() %>)</h5>
                    <button onclick="">쪽지보내기</button>
                </div>
   		 <% }
      } %>
    </div>
    
    <button id="backBtn" onclick='location.replace("<%= request.getContextPath() %>/match/search");'>검색페이지로</button>

    <script type="text/javascript">
        $(document).ready(function () {
            console.log("doc loaded");
        });        
    </script>
</section>

<%@ include file="/views/common/footer.jsp" %>
