<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../css/style.css">
</head>

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
                            <a href="#">
                                쪽지쓰기
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                받은쪽지함
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                보낸쪽지함
                            </a>
                        </div>
                    </div>
                    <div id="msg_2-2">
                        <div id="msg_2-2-header">
                            <label style="font-size: large;">받는 사람</label>
                            <input type="text" name="mem_id" placeholder="아이디를 입력해주세요">
                        </div>
                        <div id="msg_2-2-section">

                            <div style="margin-left: 35px;">
                                <textarea name="msg_content" id="msg_content" cols="100" rows="25" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                            </div>
                        </div>
                        <input type="submit" name="send_msg" id="send_msg" value="보내기" style="margin-left: 666px; margin-top: 5px;">
                    </div>
                </div>
            </form>
        </div>
    </section>
    <%@ include file="/views/common/footer.jsp" %>
