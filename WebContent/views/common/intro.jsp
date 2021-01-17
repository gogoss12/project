<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<section id="content">
<form id="introForm" action="<%= request.getContextPath()%>/intro" method="GET">
   <article id="main">
    <h2>케어풀</h2>
       <h4>cateful & care-pool </h4>
    <ul>
        <pre>
        	나의 가족같은 마음으로, 세심함으로...
            케어풀은 돌봄을 최우선으로 하여 다가갑니다.
        </pre>

    </ul>
    <hr>
    <img src="./image/cristian-newman-CeZypKDceQc-unsplash.jpg"  width="400px" height="870px" style="float: right;" alt="이미지">
    <ul>
    
       
        <p>돌봄이 필요한 분들에게 제일 먼저 찾고 싶은 업체.</p>


        <li >
        상세한 문항의 프로필 등록으로 돌봄이 필요한 분들의 현황을 정확히 파악하여 
        맞는 돌봄이 가능한 매칭을 제공.
        </li>
        <br>
        <li>
            원하는 시간대에 원하는 시간만큼 원하는 돌봄을 제공.
        </li>
        <br>
        <li>
           실시간 인증을 통하여 요양보호사와 보호자간의 신뢰 상승.
        </li>
        <br>
        <li>
           내 집 주변에 거주 하고 있는 요양보호사를 찾아보세요~
        </li>
    
    </ul>
    </article>
    </form>
    </section>
	<%@ include file="/views/common/footer.jsp" %>