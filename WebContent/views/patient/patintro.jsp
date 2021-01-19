<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<section id="content">
<form id="patintroForm" action="<%= request.getContextPath()%>/guardianAndPatientIntro" method="GET">

<h1>보호자&환자</h1>
    <hr>
     <img src="./image/national-cancer-institute-BxXgTQEw1M4-unsplash.jpg" alt="" width="50%" height="700px" style="float: right;"> 
    <h4>케어풀에 가입하면...</h4>
        <P>
           1.&nbsp;  검증된 요양보호사 프로필을 확인하여 
           맞춤 돌봄을 제공 받을 수 있음.<br>
           <br>
           2.&nbsp;  요양보호사가 환자의 상태를 매시간 체크 하는 만큼 
           보호자및 환자와 신뢰감 상승.<br>
           <br>
           3.&nbsp;내가 원하는 시간 만큼 원하는 날짜를 지정해서
           돌봄 가능.<br>
           <br>
           4.&nbsp; 나의 집 주변 근처에 거주 하고있는 요양 보호사를 찾을 수 있음.<br>
           <br>
           5.&nbsp;케어풀에서 3개월에 한번 요양보호사 교육을 통하여 요양보호사와 보호자간의 의사소통 역할을 함.
      
        </p>
        <br>
        <h4>&lt;등록절차 안내&gt;</h4>
    <div class="wrap">
         <h4>보호자&환자</h4>
            <li> 
                1. 환자 프로필 등록
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