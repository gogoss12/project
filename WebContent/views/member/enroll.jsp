<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
	<section id="content">
		<h2 align="center" style="line-height: 3.0;">회원가입</h2>
		<div id="enroll-container" style="margin: 0 auto; width: 600px">
			<form name="memberEnrollFrm" action="<%= request.getContextPath()%>/member/enroll" method="post"
				style="width: 600px;">
				<table class="table table-borderless" style="width: 600px;">
					<tr>
						<th>이름</th>
						<td><input type="text" name="userName" id="userName" required>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId" id="userId"
							placeholder="아이디(4글자이상)" required> <input type="button"
							id="checkDuplicate" value="중복확인"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="userPwd" id="pass1" required>
						</td>
					</tr>
					<tr>
						<th>패스워드확인</th>
						<td><input type="password" id="pass2"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" id="email"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="tel" placeholder="e.g. 01012345678"
							name="phone" id="phone" maxlength="11"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="postalAddr" id="postalAddr">
							<input type="button" id="findPostalAddr" value="우편번호 검색"><br>
							<input type="text" name="addr1" id="addr1"><br> <input
							type="text" name="addr2" id="addr2" placeholder="상세주소 입력">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birth" id="birth"
							min="1930-01-01" max="" value="mm/dd/yyyy"><br> <!-- max 값을 오늘 날짜로 지정 -->
						</td>
					</tr>
					<tr>
						<th>보호자/요양보호사</th>
						<td><select name="role">
								<option disabled selected>선택</option>
								<option value="guardian">보호자</option>
								<option value="caregiver">요양보호사</option>
						</select></td>
					</tr>
				</table>
				<input type="submit" id="enrollSubmit" value="회원가입"
					style="margin: 0 150px;"> <input type="reset" value="새로고침">
			</form>
			<form name="checkIdForm">
				<input type="hidden" name="userId">
			</form>
		</div>
	</section>
	
	<script>
	
	// 비밀번호, 비밀번호 확인 일치확인
	$(document).ready(() => {   
	      $("#pass2").blur((e) => {
	         let pass1 = $("#pass1").val();
	         let pass2 = $(e.target).val();
	         if(pass1.trim() != pass2.trim()){
	            alert("비밀번호가 일치하지 않습니다.");
	            $("#pass1").val("");
	            $(e.target).val("");
	            $("#pass1").focus();
	         }
	      });
	      
      $("#enrollSubmit").on("click", () => {
	       })
       let id = $("#newId").val().trim();
         
         if (id.length < 4) {
        	 alert("아이디는 최소 4글자 이상 입력해라")
        	 
        	 return;
         }
	      
	      
	</script>

	<%@ include file="/views/common/footer.jsp" %>
	
	
	
	
	
	
	
	