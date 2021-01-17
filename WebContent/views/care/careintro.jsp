<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>Insert title here</title>
<%@ include file="/views/common/header.jsp" %>

<section id="content">
<form id="patintroForm" action="<%= request.getContextPath()%>/careIntro" method="GET">

<h1>요양보호사</h1>
    <hr>
     <img src="./image/josh-appel-0nkFvdcM-X4-unsplash.jpg" alt="" width="50%" height="700px" style="float: right;"> 
    <h4>케어풀에 가입하면...</h4>
        <P>
            1.&nbsp;검증된 보호자 프로필을 확인하여 
            케어할 환자 정보를 미리 확인해서 보호자랑 소통이 가능<br>
           <br>
           2.&nbsp;요양보호사가 환자의 상태를 매시간 체크 하는 만큼 
              보호자및 환자와 신뢰감 상승.<br>
           <br>
           3.&nbsp;내가 원하는 시간 만큼 원하는 날짜를 지정해서
           자유롭게 근무 가능.<br>
           <br>
           4.&nbsp;케어풀에서 3개월에 한 번 교육을 통하여 차별화된 관리를 받을 수 있음.<br>
        </p>
        <br>
        <h4>&lt;등록절차 안내&gt;</h4>
    <div class="wrap">

        <h4>요양보호사</h4>
            <li> 
                1. 요양보호사 프로필 등록
            </li>
            <li>
                2. 관리자 심사
            </li>
            <li>
                3. 등록완료
            </li>
        
        
        </div>

</form>
</section>
<%@ include file="/views/common/footer.jsp" %>