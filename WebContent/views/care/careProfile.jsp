<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
	<section>
		<div id="mucenter">
        	<h1 id="pointer">요양보호사 프로필 등록</h1>

	<form name="careEnrollFrm" action="<%= request.getContextPath()%>/enroll/profile/care" method="post"
				style="width: 600px;">

        <br><br><br>

        <div class="mb-3">
            <label for="formFile" class="form-label">프로필 사진 등록</label>
            <input class="form-control" type="file" id="formFile" style="width: fit-content;">
        </div>
        <br>
        <label id="firstTitle">이름: <input type="text" id="carename" placeholder="이름을 입력해주세요" required></label> <br><br>
        <label id="firstTitle">성별 : </label>
        <label><input type="radio" name="caregender" value="M">남자</label>
        <label><input type="radio" name="caregender" value="F" checked>여자</label>
        
        <br><br>
        
        <label id="firstTitle">나이: </label>
        <input type="number" style="width: 60px;" min="1" required>세

        <br><br>

        <label id="firstTitle">자격증(중복 선택 가능):</label> <br>
            <div>
                <label><input type="checkbox" name="careLicense">없음</label> &nbsp; 
                <label><input type="checkbox" name="careLicense">요양보호사</label> &nbsp; 
                <label><input type="checkbox" name="careLicense">사회복지사</label> <br>
                <label><input type="checkbox" name="careLicense">간호조무사</label> &nbsp; 
                <label><input type="checkbox" name="careLicense">간호사</label> &nbsp; 
                <label><input type="checkbox" name="careLicense">물리치료사</label> &nbsp; 
                <label><input type="checkbox" name="careLicense">직업치료사</label> &nbsp; 
            </div>
            
        &nbsp; <br><br>

        <h2><span class="badge bg-secondary">경력사항 상세 입력</span></h2>
        
        <label>경력 : 
            <select name="careYears">
                <option selected>전체</option>
                <option>신규</option>
                <option>1 ~ 2년</option>
                <option>3 ~ 5년</option>
                <option>5 ~ 10년</option>
                <option>10년 이상</option>
            </select>
        </label>

        <br><br>
        
        <div>
            <h6>회사명 : <input type="text"></h6>
            <h6>&nbsp;&nbsp; 업무 :  <input type="text" name="careHistory"></h6>
            <h6>기간 : <input type="date"> ~ <input type="date"></h6>
        </div>
       
        <h3>+</h3>

        <h2><span class="badge bg-secondary">케어하는데 도움되는 장점</span></h2>
        
        <div>
            <label><input type="checkbox" name="carePlus"> &nbsp;없음</label>
            <label><input type="checkbox" name="carePlus"> &nbsp;산책</label>
            <label><input type="checkbox" name="carePlus"> &nbsp;말벗</label>
            <label><input type="checkbox" name="carePlus"> &nbsp;병원동행</label>
            <label><input type="checkbox" name="carePlus"> &nbsp;외국어</label>
            <label><input type="checkbox" name="carePlus"> &nbsp;병원근무이력</label>
        </div> 

        <br>

        <h2><span class="badge bg-secondary">희망근무시간(중복선택 가능)</span></h2>
            <div>
                <label><input type="checkbox" name="careTime">주중</label> &nbsp;
                <label><input type="checkbox" name="careTime">주말</label> &nbsp;
                <label><input type="checkbox" name="careTime">주간</label> &nbsp;
                <label><input type="checkbox" name="careTime">야간</label> &nbsp;
                <label><input type="checkbox" name="careTime">입주</label> &nbsp;
            </div>

        <br>

        <h2><span class="badge bg-secondary">희망근무위치</span></h2>
        <label >위치: <input type="text" name="carePlace" id="hopeplace"></label>
      
        <br><br>

        <h2><span class="badge bg-secondary">희망급여</span></h2>
            <div>
                <label><input type="checkbox" name="careSal">협의가능</label> &nbsp;
                <label><input type="checkbox" name="careSal">월급</label> &nbsp;
                <label><input type="checkbox" name="careSal">시급</label> &nbsp;
            </div>
       
        <br><br>

        <h1 id="pointer">케어가능 환자</h1> <br><br>

        <h2><span class="badge bg-secondary">환자상태1</span></h2>
        <label>성별: </label> &nbsp;
            <label><input type="checkbox">남</label> &nbsp;
            <label><input type="checkbox">여</label>

        <br><br>
        
        <label>나이: </label>
            <input type="number" style="width: 60px;" min="1" required>세
        
        <br><br>

        <h2><span class="badge bg-secondary">환자상태2</span></h2>
            <div>질병:   &nbsp;
                <label><input type="checkbox" name="carePlus">없음</label> &nbsp;
                <label><input type="checkbox">치매</label> &nbsp;
                <label><input type="checkbox">파킨스</label> &nbsp;
                <label><input type="checkbox">뇌전증</label> <br>
                <label><input type="checkbox">뇌졸중/뇌출혈</label> &nbsp;
                <label><input type="checkbox">당뇨</label> &nbsp;
                <label><input type="checkbox">고혈압</label> &nbsp;
                <label><input type="checkbox">기타</label>
            </div>       

            <br>    

        <h2><span class="badge bg-secondary">환자상태3</span></h2>
            <div>장기요양 등급:  &nbsp;
                <label><input type="checkbox">없음</label> &nbsp;
                <label><input type="checkbox">1등급</label> &nbsp;
                <label><input type="checkbox">2등급</label> <br>
                <label><input type="checkbox">3등급</label> &nbsp;
                <label><input type="checkbox">4등급</label> &nbsp;
                <label><input type="checkbox">5등급</label> &nbsp;
                <label><input type="checkbox">인지지원등급</label>
            </div>
        
        <br>

        <h2><span class="badge bg-secondary">소개</span></h2>
        <textarea cols="60" rows="10" name="careIntro" placeholder="내용을 입력해주세요." style="resize: none; text-align: left;">
        </textarea>

        <br><br>
       
        <div>
            <input type="submit" id="careenroll" value="등록하기">
            <input type="reset" value="취소하기">
        </div>
        </form>
        <form name="checkIdForm">   
		<input type="hidden" name="userId">
	</form>
    </div>
	</section>
	
<%@ include file="/views/common/footer.jsp" %>
