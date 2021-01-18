<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section>
	<div id="msg_container">
		<form action="">
			<div id="msg_1">
				<h1>CAREPOOL 쪽지</h1>
			</div>
			<div id="msg_2">
				<div id="msg_2-1">
					<div id="write_msg">
						<input type="button" name="write" value="쪽지쓰기">
					</div>
					<div>
						<a href="#"> 받은쪽지함 </a>
					</div>
					<div>
						<a href=""> 보낸쪽지함 </a>
					</div>
					<div>
						<a href=""> 삭제된 메세지 </a>
					</div>
				</div>
				<div id="msg_2-2">
					<div id="msg_2-2-header">
						<input type="button" name="delete_msg" value="X삭제"> 
						<input type="text" name="find_id" placeholder="아이디 검색 : "> 
						<input type="button" name="search_id" value="검색">
					</div>
					<table>
						<ul class="board">
							<li class="fl tc w70 title t_line">번호</li>
							<li class="fl tc w500 title t_line">제목</li>
							<li class="fl tc w120 title t_line">글쓴이</li>
							<li class="fl tc w100 title t_line">작성일</li>
							<li class="fl tc w100 title ">조회수</li>
						</ul>
						<!--- 리스트 --->
						<ul class="board">
							<li class="fl tc w70 list t_line lt_line">2</li>
							<li class="fl tc w500 list t_line lt_line">제목</li>
							<li class="fl tc w120 list t_line lt_line">관리자</li>
							<li class="fl tc w100 list t_line lt_line">2019-02-11</li>
							<li class="fl tc w100 list  lt_line">1</li>
						</ul>
						<ul class="board">
							<li class="fl tc w70 list t_line lt_line">1</li>
							<li class="fl tc w500 list t_line lt_line">제목</li>
							<li class="fl tc w120 list t_line lt_line">관리자</li>
							<li class="fl tc w100 list t_line lt_line">2019-02-11</li>
							<li class="fl tc w100 list  lt_line">1</li>
						</ul>
					</table>
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Document</title>
                    </head>
                    <style>
                    /* * {
                       border: 1px solid red;
                    } */
                    
                    
                    div {
                       box-sizing: border-box;
                    }
                    
                    body {
                       /* border: 1px solid wheat; */
                       width: 1390px;
                       height: 980px;
                       margin: auto;
                       display: relative;
                    }
                    
                    header {
                       /* height: 20%; */
                       height: 200px;
                    }
                    
                    section{
                       min-height: 100%;
                        border: 1px solid;
                    
                    }
                    
                    footer {
                       /* height: 20%; */
                    }
                    
                    
                    /*헤더*/
                    #wrapper {
                       width: 100%;
                       height: 70%;
                       background: cornsilk;
                    }
                    
                    #logo {
                       width: 30%;
                       float: left;
                    }
                    
                    #page {
                       width: 40%;
                       float: left;
                    }
                    
                    #login {
                       width: 30%;
                       float: left;
                    }
                    
                    #logo img {
                       padding-top: 5px;
                       width: 200px;
                       height: 130px;
                    }
                    
                    #page h1 {
                       cursor: pointer;
                       text-align: center;
                       font-size: 80px;
                       line-height: 0px;
                       color: rgb(7, 7, 7);
                    }
                    
                    #login {
                       text-align: center;
                       /* line-height: 150px; */
                       padding-right: 15px;
                       display: flex;
                       justify-content: space-around;
                       height: 100%;
                       padding-top: 40px;
                    }
                    
                    #login input[type=button] {
                       width: 110px;
                       height: 40px;
                       border-radius: 20px;
                       border: white;
                       cursor: pointer;
                    }
                    
                    #authbtn {
                       background: rgb(252, 130, 130);
                       border-radius: 10px;
                    }
                    /* 네비바 */
                    nav {
                       border: 1px solid darkkhaki;
                       height: 30%;
                       background: beige;
                    }
                    
                    #main-menu {
                       list-style-type: none;
                       text-align: center;
                    }
                    
                    #main-menu>li {
                       /* float: left; */
                       width: 13%;
                       height: 100%;
                       text-align: center;
                       display: inline-block;
                    }
                    
                    #main-menu a {
                       /* border:1px solid blue; */
                       text-decoration: none;
                       color: rgb(111, 79, 40);
                       font-size: 18px;
                       font-weight: 900;
                       font-size: 40px;
                       height: 100%;
                       display: block;
                       line-height: 30px;
                    }
                    
                    #main-menu a:hover {
                       color: black;
                    }
                    
                    #main-menu>li>ul {
                       position: absolute;
                       width: 150px;
                       list-style-type: none;
                       padding: 0;
                       display: none;
                    }
                    
                    #main-menu>li>a:hover+ul {
                       display: block;
                    }
                    
                    #main-menu>li>ul:hover {
                       display: block;
                    }
                    
                    #main-menu>li>ul a {
                       font-size: 25px;
                       line-height: 40px;
                       border: 1px solid;
                       border-radius: 10px;
                       background: beige;
                    }
                    
                    #sec_container {
                       width: 100%;
                       height: 100%;
                    }
                    
                    #sec_container>div {
                       float: left;
                       width: 50%;
                       /*height: 100%;*/
                    }
                    
                    #sec_container>div>div {
                       padding-top: 30px;
                       text-align: center;
                       line-height: 100px;
                    }
                    
                    #btngroup span {
                       display: block;
                    }
                    
                    #btngroup input[type=button] {
                       font-size: 15px;
                       width: 300px;
                       height: 90px;
                       border: white;
                       border-radius: 20%;
                       background: lightblue;
                    
                    
                    
                    }
                    
                    #btngroup input:hover {
                       border: 1px solid skyblue;
                       background: white;
                       cursor: pointer;
                    }
                    
                    span {
                       font-size: 15px;
                    }
                    
                    #btn_1 {
                       height: 50%;
                    }
                    
                    #btn_2 {
                       height: 50%;
                    }
                    
                    /* ----------------------------------------------------------------------------- */
                    
                    #msg_container>*{
                        height: 100%;
                    }
                    
                    #msg_1 {
                        width: 100%;
                        height: 35%;
                    }
                    
                    #msg_1 h1{
                        font-size: 40px;
                        font-weight: 900;
                        background: rgb(146, 220, 238);    
                        margin: auto;
                    }
                    
                    #msg_2{
                        width: 100%;
                        float: left;
                    }
                    
                    #msg_2-1{
                        width: 15%;
                        float: left; 
                        background-color: rgb(146, 220, 238); 
                        height: 926px; 
                        text-align: center;
                        
                        }
                    #msg_2-1{line-height: 130px;}
                    #msg_2-1 input[type=button]{
                        width: 150px;
                        height: 50px;
                    }
                    #msg_2-1 a{
                        font-size: 30px;
                        text-decoration: none;
                    }
                    
                    #msg_2-2{
                        float: left;
                        width: 85%;
                        height: 926px;
                    }
                    
                    
                    #msg_2-2>#msg_2-2-header{
                        padding-top: 5%;
                        padding-left: 2rem;
                        padding-bottom: 3rem;
                    }
                    #msg_2-2 input[type=text]{
                        margin-left: 40px;
                    }
                    
                    #msg_2-2-section{
                        width: 100%;
                    }
                    
                    #msg_2-2-section td input{
                        border: none;
                        
                    }
                    
                    #msg_table{
                        width: 100%;
                        text-align: center;
                    }
                    
                    #msg_table input{
                        margin: auto;
                        background: none;
                        text-align: left;
                    }
                    #msg_table td{
                        border: 1px solid;
                    }
                    
                    #msg_2-2-footer div{
                        text-align: center;
                    }
                    
                    
                    /* -------------------------------------------------------------------------------- */
                    #foot {
                       width: 100%;
                       height: 100%;
                       font-size: 10px;
                       width: 100%;
                       /* background: beige; */
                       text-align: center;
                       color: black;
                    }
                    
                    /* 푸터 */
                    footer {
                       font-size: 10px;
                       width: 100%;
                       height: 80px;
                       /* position: absolute; */
                       z-index: 20;
                       overflow: hidden;
                       padding: 20px;
                       bottom: 0;
                       text-align: center;
                       color: black;
                       margin: 50px 0 0 0;
                    }
                    
                    </style>
                    <body>
                       <header>
                          <div id="wrapper">
                                <div id="logo">
                                      <a href="<%=request.getContextPath()%>" >
                                        <img src="./image/케어풀 임시 아이콘.png" alt="" >
                                    </a>
                                </div>
                             <div id="page">
                    
                                <h1>Carepool</h1>
                             </div>
                             <div id="login">
                             <% if (loginMember == null) { %>   
                                <input type="button" id="loginbtn" value="로그인"
                                   onclick="location.href = '<%=request.getContextPath()%>/member/login';">
                                <input type="button" id="enrollbtn" value="회원가입"
                                   onclick="location.href = '<%=request.getContextPath()%>/member/enroll';">
                    
                             <% } else { %>                  
                                <input type="button" value="마이페이지"
                                   onclick="location.href = '<%= request.getContextPath() %>/member/view?userId=<%= loginMember.getMemId()%>';">
                                
                                <!-- 드롭박스는 마이페이지에서 보일 예정 -->
                                <!-- <select name="myPage">
                                   <option selected>마이페이지</option>
                                   <option value="editInfo">개인정보 수정</option>
                                   <option value="certList">인증내역</option>
                                   <option value="message">쪽지기록</option>
                                   <option value="matchList">매칭내역</option>
                                   <option value="delAcct">회원탈퇴</option>
                                </select> -->
                                
                                <input type="button" id="authbtn" value="인증/확인">               
                                <input type="button" id="logoutbtn" value="로그아웃" 
                                   onclick="location.replace('<%= request.getContextPath() %>/logout');">
                             <% } %>
                    
                             </div>
                          </div>
                          <nav>
                    
                             <ul id="main-menu">
                                <li><a href="<%=request.getContextPath()%>/intro">소개</a></li>
                                <li><a href="#">매칭</a>
                                   <ul id="sub-menu">
                                      <li><a href="#">매칭검색</a></li>
                                   </ul>
                                </li>
                                <li><a href="#">서비스</a>
                                   <ul id="sub-menu">
                                      <li><a href="#">쪽지</a></li>
                                      <li><a href="#">지도</a></li>
                                   </ul>
                                </li>
                             </ul>
                          </nav>
                        </header>
                    
                    
                        <section>
                            <div id="msg_container">
                                <form action="">
                                    <div id="msg_1">
                                        <h1>CAREPOOL 쪽지</h1>
                                    </div>
                                    <div id="msg_2">
                                        <div id="msg_2-1">
                                            <div id="write_msg">
                                                <input type="button" name="write" value="쪽지쓰기">
                                            </div>
                                            <div>
                                                <a href="#">
                                                    받은쪽지함
                                                </a>
                                            </div>
                                            <div>
                                                <a href="">
                                                    보낸쪽지함
                                                </a>
                                            </div>
                                            <div>
                                                <a href="">
                                                    삭제된 메세지
                                                </a>
                                            </div>
                                        </div>
                                        <div id="msg_2-2">
                                            <div id="msg_2-2-header">
                                                <input type="button" name="delete_msg" value="X삭제">
                                                <input type="text" name="find_id" placeholder="아이디 검색 : ">
                                                <input type="button" name="search_id" value="검색">
                                            </div>
                                            <div id="msg_2-2-section">
                                                <table id="msg_table">
                                                    <tr>
                                                        <td id="td-1">
                                                            <input type="checkbox" name="delete_check" value="delete_check">
                                                        </td>
                                                        <td id="td-2" style="width: 80px;">
                                                            <input type="text" name="send_id" value="보낸사람" style="width: 100%; margin: auto; text-align: center;" readonly>
                                                        </td>
                                                        <td id="td-3">
                                                            <input type="text" name="msg_contents" value="내용" style="width: 100%; margin: auto; text-align: center;" readonly>
                                                        </td>
                                                        <td id="td-4"  style="width: 120px;">
                                                            <input type="text" name="msg_get_date" value="날짜" style="width: 100%; margin: auto; text-align: center;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td id="td-1">
                                                            <input type="checkbox" name="delete_check" value="delete_check">
                                                        </td>
                                                        <td id="td-2" style="width: 80px;">
                                                            <input type="text" name="send_id" value="asd123" style="width: 100%; margin: auto; text-align: center;">
                                                        </td>
                                                        <td id="td-3">
                                                            <input type="text" name="msg_contents" value="아무개님에게 메세지가 왔습니다." style="width: 100%; margin: auto; text-align: center;">
                                                        </td>
                                                        <td id="td-4"  style="width: 120px;">
                                                            <input type="text" name="msg_get_date" value="2020.11.27" style="width: 100%; margin: auto; text-align: center;">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div id="msg_2-2-footer">
                                                    <div id="pageBar">
                                                        <!-- 맨 처음으로 -->
                                                        <button onclick="location.href=''">&lt;&lt;</button>
                                                        <!-- 이전 페이지로 -->
                                                        <button>&lt;</button>
                                                        <!--  10개 페이지 목록 -->
                                                        <button>1</button>
                                                        <button onclick="location.href=''">2</button>
                                                        <button onclick="location.href=''">3</button>
                                                        <button>4</button>
                                                        <button>5</button>
                                                        <!-- 다음 페이지로 -->
                                                        <button >&gt;</button>
                                                        <!-- 맨 끝으로 -->
                                                        <button>&gt;&gt;</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    
                    
                        </section>
                    <footer>
                            <div id="foot">
                                <div id="foot_1">
                                <hr>
                                    <p>Copyright 2021. <strong>carepool</strong> All rights reserved.</p>
                                    <address>주소 : 서울 영등포구 영등포로 5길 45. 070-1234-5678</address>
                                    <p>*회사는 통신판매중계로서 거래에 필요한 시스템을 운명 및 제공합니다.</p>
                                    <p>&nbsp;&nbsp;보호자와 간병인 사이에 발생한 분쟁에 대한 책임은 보호자와 간병인에게 있습니다</p>
                                </div>
                            </div>
                        </footer>
                    
                    </body>
                    </html>
					<!-- <div id="msg_2-2-section">
						<table id="msg_table">
							<tr>
								<td id="td-1">
									<input type="checkbox" name="delete_check" value="delete_check">
								</td>
								<td id="td-2" style="width: 80px;">
									<input type="text" name="send_id" value="보낸사람" style="width: 100%; margin: auto; text-align: center;" readonly>
								</td>
								<td id="td-3">
									<input type="text" name="msg_contents" value="내용" style="width: 100%; margin: auto; text-align: center;" readonly>
								</td>
								<td id="td-4" style="width: 120px;">
									<input type="text" name="msg_get_date" value="날짜" style="width: 100%; margin: auto; text-align: center;">
								</td>
							</tr>
							<tr>
								<td id="td-5">
									<input type="checkbox" name="delete_check" value="delete_check">
								</td>
								<td id="td-6" style="width: 80px;">
									<input type="text" name="send_id" value="asd123" style="width: 100%; margin: auto; text-align: center;">
								</td>
								<td id="td-7">
									<input type="text" name="msg_contents" value="아무개님에게 메세지가 왔습니다." style="width: 100%; margin: auto; text-align: center;">
								</td>
								<td id="td-8" style="width: 120px;">
									<input type="text" name="msg_get_date" value="2020.11.27" style="width: 100%; margin: auto; text-align: center;">
								</td>
							</tr>
							<tr>
								<td id="td-5">
									<input type="checkbox" name="delete_check" value="delete_check">
								</td>
								<td id="td-6" style="width: 80px;">
									<input type="text" name="send_id" value="" style="width: 100%; margin: auto; text-align: center;">
								</td>
								<td id="td-7">
									<input type="text" name="msg_contents" value="" style="width: 100%; margin: auto; text-align: center;">
								</td>
								<td id="td-8" style="width: 120px;">
									<input type="text" name="msg_get_date" value="" style="width: 100%; margin: auto; text-align: center;">
								</td>
							</tr>
						</table> -->
						<div id="msg_2-2-footer">
							<div id="pageBar">
								<!-- 맨 처음으로 -->
								<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=1'">&lt;&lt;</button>
								<!-- 이전 페이지로 -->
								<button>&lt;</button>
								<!--  10개 페이지 목록 -->
								<button>1</button>
								<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=2'">2</button>
								<button onclick="location.href='<%= request.getContextPath() %>/board/list?page=3'">3</button>
								<button>4</button>
								<button>5</button>
								<!-- 다음 페이지로 -->
								<button>&gt;</button>
								<!-- 맨 끝으로 -->
								<button>&gt;&gt;</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>






<%@ include file="/views/common/footer.jsp"%>