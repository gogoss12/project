<%@page import="com.care.mvc.care.model.vo.Care"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%	
	// List<Member> profiles = (ArrayList) request.getAttribute("profiles");
	
	List<Care> profiles = (ArrayList) request.getAttribute("profiles");

%>

<section id="matchPage">

    <h2>검색하신 요양보호사님께 문의해보세요</h2>
    <div id="searchResult">
    <% if (profiles == null || profiles.isEmpty()) { %>
    		<!-- 검색결과 없음 -->
    <% } else {
    		for (Care care : profiles) { %>
    			<div class="profile">    				    				
                    <img class="profPic" src="<%= request.getContextPath() %>/upload/carephoto/<%= care.getCareImg().getImgNameSav() %>" alt="">
                    <script>
                        $('document').ready(function () {
                            console.log('doc loaded');
                        });

                        $(".profPic").on("click", () => {
                            // let id = $("#newId").val().trim();
                            
                            // if (id.length < 4) {
                            //     alert("아이디는 최소 4글자 이상 입력하셔요.")
                                
                            //     return;
                            // }
                            
                            const url = "<%= request.getContextPath()%>/match/profilecheck";
                            const title = "duplicate";
                            const status = "left=600px, right=600px, top=100px,width=500px,height=800px";
                            
                            open("", title, status);
                            
                            // form에 데이터들을 채우고 open된 윈도우에서 결과를 받는 로직을 구성한다.
                            // 자바스크립트에서 form은 name 속성으로 요소를 가져올 수 있다.
                            // checkIdForm.target = title; // form 전송하는 윈도우를 설정한다.
                            // checkIdForm.action = url;
                            // checkIdForm.method = "post";
                            // checkIdForm.userId.value = id;
                            
                            // // form 전송하기
                            // checkIdForm.submit();
                        });
                    </script>

                    <h5><%= care.getCareName() %> (<%= care.getMemId() %>)</h5>
                    <button onclick='location.href="<%= request.getContextPath() %>/msg/write?memId=<%= care.getMemId() %>"'>쪽지보내기</button>
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
