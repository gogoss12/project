<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>
    <section>
        <div class="patient_details">
            <form action="<%=request.getContextPath()%>/enroll/profile/guardian" method="POST">
                    <div>
                        <h1>보호자용 프로필 등록</h1>
                    </div>
                    <div>
                        <label><input type="checkbox" name="same" value="보호자이자 환자입니다.">보호자이자 환자입니다.</label>
                    </div>
                    <div>
                        <div><h3>보호자 성별</h3></div>
                        <div>
                            <label><input type="radio" name="gender" value="남">남</label>
                            <label><input type="radio" name="gender" value="여">여</label>
                        </div>
                    </div>
                    <div>
                        <div>
                            <label><input type="checkbox" name="home" value="자택">자택</label>
                            <input type="text" placeholder="주소를 입력해주세요">
                            <input type="button" value="찾기">
                        </div>
                    </div>
                    <div>
                        <div>
                            <label><input type="checkbox" name="hospital" value="병원">병원</label>
                            <input type="text" placeholder="병원명을 입력해주세요">
                            <input type="button" value="찾기">
                        </div>
                    </div>
                    <div>
                        <h3>돌봄기간</h3>
                        <div>
                        <input type="date" name="pat_period">
                        <span> - </span>
                        <input type="date" name="pat_period">
                        </div>
                    </div>
                    <div>
                        <h4>희망시간대 :</h4>
                        <input type="time">
                    </div>
                    <div>
                        <h3>환자 정보</h3>
                        <div>
                            <input type="text" name="patName" placeholder="이름을 입력하세요">
                            <input type="text" name="patAge" placeholder="나이">
                        </div>
                        <div>
                            <label><input type="radio" name="patGen" value="남자">남자</label>
                            <label><input type="radio" name="patGen" value="여자">여자</label>
                            <label><input type="text" name="patKg" placeholder="몸무게"><b>kg</b></label>
                        </div>
                    </div>
                    <div>
                        <h3>감염성 질환 체크</h3>
                        <label><input type="checkbox" name="infectnone" value="없음"></label>없음
                        <div>
                            <label><input type="checkbox" name="patInfact" value="VRE">VRE</label>
                            <label><input type="checkbox" name="patInfact" value="CRE">CRE</label>
                            <label><input type="checkbox" name="patInfact" value="결핵">결핵</label>
                        </div>
                        <div>
                            <label><input type="checkbox" name="patInfact" value="움">움</label>
                            <label><input type="checkbox" name="patInfact" value="독감">독감</label>
                            <label><input type="checkbox" name="patInfact" value="감기">감기</label>
                        </div>
                        <div>
                            <textarea name="infactEtc" cols="40" rows="3" placeholder="내용을 입력해주세요"></textarea>
                        </div>
                    </div>
                    <div>
                        <h3>장기요양등급</h3>
                            <select name="patGrade" id="patGrade">
                                <option>-----</option>
                                <option value="등급없음">등급없음</option>
                                <option value="1등급">1등급</option>
                                <option value="2등급">2등급</option>
                                <option value="3등급">3등급</option>
                                <option value="4등급">4등급</option>
                                <option value="5등급">5등급</option>
                                <option value="인지자원등급">인지자원등급</option>
                                <option value="등급신청 중">등급신청 중</option>
                            </select>
                    </div>
                    <div>
                        <h3>개인위생관리</h3>
                        <div>
                            <label><input type="radio" name="patSanit" value="스스로 가능">스스로 가능</label>
                            <label><input type="radio" name="patSanit" value="화장실에서 도움 필요">화장실에서 도움 필요</label>
                        </div>
                        <div>
                            <label><input type="radio" name="patSanit" value="전적인 도움필요">전적인 도움필요</label>
                            <label><input type="radio" name="patSanit" value="침대에서 도움 필요">침대에서 도움 필요</label>
                        </div>
                    </div>
                    <div>
                        <h3>마비상태</h3>
                        <div>
                            <label><input type="checkbox" name="patParal" value="전신마비">전신마비</label>
                            <td><label><input type="checkbox" name="patParal" value="편마비">편마비</label></td>
                            <td><label><input type="checkbox" name="patParal" value="없음">없음</label></td>
                        </div>
                    </div>
                    <div>
                    <h3>거동상태</h3>
                        <label><input type="checkbox" name="patMove" value="불가능">불가능</label>
                        <label><input type="checkbox" name="patMove" value="부축 필요">부축 필요</label>
                        <label><input type="checkbox" name="patMove" value="홀로 가능">홀로 가능</label>
                    </div>
                    <div>
                        <h3>욕창 환자 여부</h3>
                        <label><input type="radio" name="patBed" value="네">네</label>
                        <label><input type="radio" name="patBed" value="아니요">아니요</label>
                    </div>
                    <div>
                        <h3>인지장애 여부</h3>
                        <label><input type="checkbox" name="patCogdis" value="치매">치매</label>
                        <label><input type="checkbox" name="patCogdis" value="섬망">섬망</label>
                        <label><input type="checkbox" name="patCogdis" value="없음">없음</label>
                    </div>
                    <div>
                        <h3>화장실 이동 시</h3>
                        <label><input type="radio" name="patBathroom" value="부축 필요">부축 필요</label>
                        <label><input type="radio" name="patBathroom" value="스스로 이동 가능">스스로 이동가능</label>
                    </div>
                    <div>
                        <h3>배변도구</h3>
                        <label><input type="checkbox" name="patBowelMn" value="기저귀">기저귀</label>
                        <label><input type="checkbox" name="patBowelMn" value="소변줄">소변줄</label>
                        <label><input type="checkbox" name="patBowelMn" value="없음">없음</label>
                    </div>
                    <div>
                        <h3>장루 설치 여부</h3>
                        <label><input type="radio" name="patOstomy" value="네">네</label>
                        <label><input type="radio" name="patOstomy" value="아니요">아니요</label>
                    </div>
                    <div>
                        <h3>식사 도움 여부</h3>
                        <label><input type="radio" name="patHelpEat" value="도움필요">도움 필요</label>
                        <label><input type="radio" name="patHelpEat" value="스스로 가능">스스로 가능</label>
                    </div>
                    <div>
                        <h3>석션 사용 여부</h3>
                        <label><input type="radio" name="patSuction" value="사용">사용</label>
                        <label><input type="radio" name="patSuction" value="사용안함">사용안함</label>
                    </div>
                    <div>
                        <h3>요양보호사 우대 성별</h3>
                        <label><input type="radio" name="patGuardGen" value="남자">남자</label>
                        <label><input type="radio" name="patGuardGen" value="여자">여자</label>
                    </div>
                    <div>
                        <h3>기타사항(선택)</h3>
                        <textarea name="patEtc" id="paptEtc" cols="50" rows="4"></textarea>
                    </div>
                <input type="reset" value="취소하기">
                <input type="submit" value="등록하기">
            </form>
        </div>
    </section>
<%@ include file="/views/common/footer.jsp" %>