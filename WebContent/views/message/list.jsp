<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<section id="searchMatch">

    <h2>원하시는 요양보호사님을 찾아보세요</h2>

    <form id="searchMatchForm" action="" method="GET">

        <h3>돌봄시간</h3>
        <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              전체
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              주중
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              주말
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              주간
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              야간
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              입주
            </label>
          </div>
        </div>

        <h3>요양보호사 성별</h3>
        <div class="radio">
            <label>
              <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
              남
            </label>
          </div>
          <div class="radio">
            <label>
              <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
              여
            </label>
          </div>

        <h3>자격증 유무</h3>
        <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              없음
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              요양보호사
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              사회복지사
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              간호조무사
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              간호사
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              물리치료사
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              작업치료사
            </label>
          </div>
        </div>

        <h3>경력사항</h3>
        <div class="dropdown">
            <label>
                <select name="job">
                    <option value="ko">신입</option>
                    <option value="ch">1년</option>
                    <option value="ch">2년</option>
                    <option value="ch">3년</option>
                    <option value="ch">4년</option>
                    <option value="ch">5년이상</option>
                </select>
            </label>
        </div>

        <h3>희망 근무지역</h3>
        <div class="dropdown">
            <label>
                <select name="city">
                    <option value="seoul">서울</option>
                    <option value="busan">부산</option>
                    <option value="etc">등등...</option>
                </select>
            </label>
        </div>

        <div class="dropdown">
            <label>
                <select name="district">
                    <option value="yongsan-gu">용산구</option>
                    <option value="jung-gu">중구</option>
                    <option value="etc">등등...</option>
                </select>
            </label>
        </div>

        <h3>급여지급</h3>
        <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              협의가능
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              월급
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" value="">
              시급
            </label>
          </div>
        </div>

        <button type="submit" class="btn btn-default" id="searchBtn">검색</button>
    </form>

    <div id="searchResult">
        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>

        <div class="profile">
            <img src="../../image/병아리당황.png" alt="">
            <h5>홍길동 (50세)</h5>
            <p>치매환자돌봄/전직간호사5년</p>
            <button>쪽지보내기</button>
        </div>
    </div>

</section>

<%@ include file="/views/common/footer.jsp" %>
