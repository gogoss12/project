<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<section id="content">

	<form id="page_container" action="<%= request.getContextPath()%>/member/mypage"
		method="post">
			<div id="my_text">
				<h1>마이페이지</h1>
			</div>
			<div class="outer">
				<div class="my_page" id="my_im">
					<div class="my_page" id="my_intro">

						<legend style="font-size: 16px; font-weight: 600;">한줄
							자기소개</legend>
						<div id="print" class="print"></div>
						<div>
							<button onclick="addMember();">수정</button>
							<button onclick="printMember();">저장</button>
						</div>

					</div>
					<img src="./image/병아리당황.png">
					<div id="my_name">땡땡땡 님 안녕하세요</div>
				</div>

				<div class="my_page" id="my_infor">
					<div class="my_page" id="my_em">이메일</div>
					<div class="my_page" id="my_num">전화번호</div>
					<P>자기소개</P>
				</div>
				<div id="my_match">
					<h3>최근매칭내역</h3>
					<table>
						<thead>
							<tr>
								<th>매칭날짜</th>
								<th>이름</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#">date</a></td>
								<td>name</td>
								<td>name</td>
							</tr>
							<tr>
								<td><a href="#">date</a></td>
								<td>name</td>
								<td>name</td>
							</tr>
							<tr>
								<td><a href="#">date</a></td>
								<td>name</td>
								<td>name</td>
							</tr>
							<tr>
								<td><a href="#">date</a></td>
								<td>name</td>
								<td>name</td>
							</tr>
							<tr>
								<td><a href="#">date</a></td>
								<td>name</td>
								<td>name</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="my_numbtn">
					<button onclick="location.href=''">&lt;&lt;</button>
					<button>&lt;</button>
					<button>1</button>
					<button onclick="location.href=''">2</button>
					<button onclick="location.href=''">3</button>
					<button>&gt;</button>
					<button>&gt;&gt;</button>
				</div>
			</div>
	</form>
</section>
<script type="text/javascript">
    var member;
    
    function addMember() {
        const name = prompt("닉네임 또는 한줄자기소개 :");
        

        member = {
            name,
            toString: function() {
              return `$(this.name) <br>`;
            }
        }

        console.log(member.toString());
    }

    function printMember() {
        if(member === null) {
            alert("입력을 먼저 진행해주세요.");
        } else {
            document.getElementById("print").innerHTML = member;
        }
    }
    </script>

    <%@ include file="/views/common/footer.jsp" %>