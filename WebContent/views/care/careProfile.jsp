<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% String userId=(String)request.getAttribute("userId"); // 여기에 찍어서 디버깅 모드로 봐야함 %>
<%@ include file="/views/common/header.jsp" %>

<script>
    // 추가버튼 스크립트
    function career_detail() {
        var career1;
        career1 = document.all["carshow"].insertRow();

        // 경력사항 상세입력 부분 value 값은 여기에 넣어야 DB로 넣을 수 있으니 확인바람

        // 근무병원
        var hos_place = career1.insertCell();
        hos_place.innerHTML = "<input type='text' id='hosp' name='careHistory1' value=''>";

        // syso 로 값이 넘어오는지 안 넘어오는지 하나하나 확인하기
        // 소요's Tip! 소요꺼 매치jsp꺼 보면 도움될거다!

        // 업무
        var your_job = career1.insertCell();
        your_job.innerHTML = "<input type='text' id='hosp' name='careHistory2' value=''>";

        // 기간1
        var period1 = career1.insertCell();
        period1.innerHTML = "<input type='date' id='hosp' name='careHistoryDate1' value=''>";

        // 중간에 ~ 표시
        var period2 = career1.insertCell();
        period2.innerHTML = "<p> &nbsp ~ &nbsp</p>";

        // 기간2
        var period2 = career1.insertCell();
        period2.innerHTML = "<input type='date' id='hosp' name='careHistoryDate2' value=''>";
    }

    // 삭제버튼 스크립트
    function career_delete() {
        var table = document.getElementById('careerwrite');
        // 보기 td는 남겨놓기
        if (table.rows.length < 2) {
            return;
        }

        //tr삭제하기
        table.deleteRow(table.rows.length - 1);
        // count--;
    }
</script>

<section>
    <div id="mucenter">
        <div id="profile1">
            <h1 id="pointer">요양보호사 프로필 등록</h1>

            <form name="careEnrollFrm" action="<%= request.getContextPath()%>/enroll/profile/care"
                method="post" enctype="multipart/form-data">
                <br><br><br>

                <div class="mb-3 photo group" >
                    <input class="form-control" type="file" id="formFile" name="upfile"
                        style="width: fit-content;" required>
                </div>
                <br>
                
                <div class="gender group">
                    <label id="firstTitle">성별 : </label>
                    <label><input type="radio" name="caregender" value="남" required>남자</label>
                    <label><input type="radio" name="caregender" value="여" required>여자</label>
                </div>

                <br><br>

                <div class="age group">
                    <label id="firstTitle">나이: </label>
                    <input type="number" name="careAge" style="width: 60px;" min="1" required>세
                </div>

                <br><br>

                <div class="qual group">
                    <h3><span class="badge bg-secondary">자격증(중복 선택 가능):</span></h3>
                    <label><input type="checkbox" name="careLicense" value="없음" required>없음</label> &nbsp;
                    <label><input type="checkbox" name="careLicense" value="요양보호사" required>요양보호사</label> &nbsp;
                    <label><input type="checkbox" name="careLicense" value="사회복지사" required>사회복지사</label> <br><br>
                    <label><input type="checkbox" name="careLicense" value="간호조무사" required>간호조무사</label> &nbsp;
                    <label><input type="checkbox" name="careLicense" value="간호사" required>간호사</label> &nbsp;
                    <label><input type="checkbox" name="careLicense" value="물리치료사" required>물리치료사</label> &nbsp;
                    <label><input type="checkbox" name="careLicense" value="직업치료사" required>직업치료사</label> &nbsp;
                </div>

                <br>

                <div class="years group">
                    <h3><span class="badge bg-secondary">경력사항 상세 입력</span></h3>

                    <label>경력 :
                        <select name="careYears" required>
                            <option selected>전체</option>
                            <option value="신규">신규</option>
                            <option value="1 ~ 2년">1 ~ 2년</option>
                            <option value="3 ~ 5년">3 ~ 5년</option>
                            <option value="5 ~ 10년">5 ~ 10년</option>
                            <option value="10년 이상">10년 이상</option>
                        </select>
                    </label>
                </div>

                <br><br> <!-- request.getpara... 시스템 콘솔로 다 찍어본다. -->

                <!-- 정보를 받아왔는지 확인을 한다. (값을 가져왔을 경우 - service, dao쪽을 봐야함, 못 가져왔을 경우 - 스크립트, jsp을 봐야함) -->
                <input type="button" id="addBtn" name="addBtn" value="추가" onclick="career_detail()"
                    style="margin-left: 600px;">

                <input type="button" id="delBtn" name="delBtn" value="삭제" onclick="career_delete()"
                    style="margin-left: 600px;">

                <br>

                <!-- required 없음 -->
                <div class="history group" style="text-align: center;">
                    <table id="careerwrite" style="margin:0 auto;">
                        <tr>
                            <td style="width: 170px; border-bottom: 1px solid;">근무병원</td>
                            <td style="width: 170px; border-bottom: 1px solid;">업무</td>
                            <td style="width: 300px; border-bottom: 1px solid;" colspan="3">기간</td>
                        </tr>
                        <tbody id="carshow"></tbody>
                    </table>
                </div>

                <div class="plus group">
                    <h3><span class="badge bg-secondary">케어하는데 도움되는 장점</span></h3>
                    <div>
                        <label><input type="checkbox" name="carePlus" value="없음" required> &nbsp;없음</label>
                        <label><input type="checkbox" name="carePlus" value="산책" required> &nbsp;산책</label>
                        <label><input type="checkbox" name="carePlus" value="말벗" required> &nbsp;말벗</label>
                        <label><input type="checkbox" name="carePlus" value="병원동행" required> &nbsp;병원동행</label>
                        <label><input type="checkbox" name="carePlus" value="외국어" required> &nbsp;외국어</label>
                        <label><input type="checkbox" name="carePlus" value="병원근무이력" required> &nbsp;병원근무이력</label>
                    </div>
                </div>

                <br>

                <div class="time group">
                    <h3><span class="badge bg-secondary">희망근무시간(중복선택 가능)</span></h3>
                    <div>
                        <label><input type="checkbox" name="careTime" value="주중" required>주중</label> &nbsp;
                        <label><input type="checkbox" name="careTime" value="주말" required>주말</label> &nbsp;
                        <label><input type="checkbox" name="careTime" value="주간" required>주간</label> &nbsp;
                        <label><input type="checkbox" name="careTime" value="야간" required>야간</label> &nbsp;
                        <label><input type="checkbox" name="careTime" value="입주" required>입주</label> &nbsp;
                    </div>
                </div>

                <br>

                <div class="place group">
                    <h3><span class="badge bg-secondary">희망근무위치 (e.g. 서울특별시 영등포구)</span></h3>
                    <label>위치: <input type="text" name="carePlace" id="hopeplace" required></label>
                </div>

                <br><br>

                <div class="pay group">
                    <h3><span class="badge bg-secondary">희망급여</span></h3>
                    <div>
                        <input type="checkbox" name="careSal" value="협의가능" required>협의가능 &nbsp;
                        <input type="checkbox" name="careSal" value="월급" required>월급 &nbsp;
                        <input type="checkbox" name="careSal" value="시급" required>시급 &nbsp;
                    </div>
                </div>

                <br><br>

                <hr>
                <h1 id="pointer"> 케어가능 환자</h1> <br><br>

                <div class="patGen group">
                    <h3><span class="badge bg-secondary">환자상태1</span></h3>
                    <label>성별: </label> &nbsp;
                    <label><input type="radio" name="wantedgen" value="남" required>남</label> &nbsp;
                    <label><input type="radio" name="wantedgen" value="여" required>여</label>
                </div>

                <br><br>

                <div class="patAge group">
                    <label>나이: </label>
                    <select required>
                        <option name="wantedAge" value="50대 이하"> 50대 이하 </option>
                        <option name="wantedAge" value="50대"> 50대 </option>
                        <option name="wantedAge" value="60대"> 60대 </option>
                        <option name="wantedAge" value="70대"> 70대 </option>
                        <option name="wantedAge" value="80대 이상"> 80대 이상 </option>
                    </select>
                </div>

                <br><br>

                <div class="patIll group">
                    <h3><span class="badge bg-secondary">환자상태2</span></h3>
                    <div>질병: &nbsp;
                        <label><input type="checkbox" name="wantedill" value="없음" required>없음</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="치매" required>치매</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="파킨스" required>파킨스</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="뇌전증" required>뇌전증</label> <br>
                        <label><input type="checkbox" name="wantedill" value="뇌졸중/뇌출혈" required>뇌졸중/뇌출혈</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="당뇨" required>당뇨</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="고혈압" required>고혈압</label> &nbsp;
                        <label><input type="checkbox" name="wantedill" value="기타" required>기타</label>
                    </div>
                </div>

                <br>

                <div class="patGrade group">
                    <h3><span class="badge bg-secondary">환자상태3</span></h3>
                    <div>장기요양 등급: &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="없음" required>없음</label> &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="1등급" required>1등급</label> &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="2등급" required>2등급</label> <br>
                        <label><input type="checkbox" name="wantedgra" value="3등급" required>3등급</label> &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="4등급" required>4등급</label> &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="5등급" required>5등급</label> &nbsp;
                        <label><input type="checkbox" name="wantedgra" value="인지지원등급" required>인지지원등급</label>
                    </div>
                </div>

                <br>

                <div class="intro group">
                    <h2><span class="badge bg-secondary">소개</span></h2>
                    <textarea cols="60" rows="10" name="careIntro" placeholder="내용을 입력해주세요."
                        style="resize: none; text-align: left;" required></textarea>
                </div>

                <br><br>

                <div class="btn">
                    <input type="submit" id="careenroll" value="등록하기">
                    <input type="reset" value="취소하기">
                    <input type="hidden" name="memId" value=<%=userId %>>
                </div>

            </form>
        </div>
</section>

<%@ include file="/views/common/footer.jsp" %>

<script>
    $(function(){
    // 사진은 안올리면 디폴트 아이콘 띄우기
    // var file = $('.photo :file[required]');
       
    var gender = $('.gender input:radio[required]');
    var age = $('.age input[name=careAge][required]');
    var qual = $('.qual input:checkbox[required]');
    var years = $('.years select[required]');
    var plus = $('.plus input:checkbox[required]');
    var time = $('.time input:checkbox[required]');
    var place = $('.place input:text[required]');
    var pay = $('.pay input:checkbox[required]');

    var patGen = $('.patGen input:radio[required]');
    var patAge = $('.patAge select[required]');
    var patIll = $('.patIll input:checkbox[required]');
    var patGrade = $('.patGrade input:checkbox[required]');
    
    var textarea = $('.intro textarea[required]');

    gender.change(function(){
        if(gender.is(':checked')) {
            gender.removeAttr('required');
        } else {
            gender.attr('required', 'required');
        }
    });

    age.change(function(){
        if(age.val() != null) {
            age.removeAttr('required');
        } else {
            age.attr('required', 'required');
        }
    });

    qual.change(function(){
        if(qual.is(':checked')) {
            qual.removeAttr('required');
        } else {
            qual.attr('required', 'required');
        }
    });

    years.change(function(){
        if(years.is(':checked')) {
            years.removeAttr('required');
        } else {
            years.attr('required', 'required');
        }
    });

    plus.change(function(){
        if(plus.is(':checked')) {
            plus.removeAttr('required');
        } else {
            plus.attr('required', 'required');
        }
    });

    time.change(function(){
        if(time.is(':checked')) {
            time.removeAttr('required');
        } else {
            time.attr('required', 'required');
        }
    });

    place.change(function(){
        if(place.val() != null) {
            place.removeAttr('required');
        } else {
            place.attr('required', 'required');
        }
    });

    pay.change(function(){
        if(pay.is(':checked')) {
            pay.removeAttr('required');
        } else {
            pay.attr('required', 'required');
        }
    });

    patGen.change(function(){
        if(pay.is(':checked')) {
            pay.removeAttr('required');
        } else {
            pay.attr('required', 'required');
        }
    });

    patAge.change(function(){
        if(patAge.is(':checked')) {
            patAge.removeAttr('required');
        } else {
            patAge.attr('required', 'required');
        }
    });

    patIll.change(function(){
        if(patIll.is(':checked')) {
            patIll.removeAttr('required');
        } else {
            patIll.attr('required', 'required');
        }
    });

    patGrade.change(function(){
        if(patGrade.is(':checked')) {
            patGrade.removeAttr('required');
        } else {
            patGrade.attr('required', 'required');
        }
    });

    textarea.change(function(){
        if(textarea.innerHTML != null) {
            textarea.removeAttr('required');
        } else {
            textarea.attr('required', 'required');
        }
    });
});
</script>
