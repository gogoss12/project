<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Message</title>
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
                            <a href="#">쪽지쓰기</a>
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
                            <input type="button" name="delete_msg" value="X삭제" style="color: red;">
                            <input type="text" name="find_id" placeholder="아이디 검색 : ">
                            <input type="button" name="search_id" value="검색">
                        </div>
                        <div id="msg_2-2-section">

                            <table id="msg_table">
                                <tr>
                                    <td id="td-1" style="width: 30px;">
                                        <input type="checkbox" name="delete_check" value="delete_check">
                                    </td>
                                    <td id="td-1" style="width: 120px;">
                                        <input type="text" name="send_id" value="받은사람" style="width: 100%; margin: auto; text-align: center;" readonly>
                                    </td>
                                    <td id="td-1">
                                        <input type="text" name="msg_contents" value="내용" style="width: 100%; margin: auto; text-align: center;" readonly>
                                    </td>
                                    <td id="td-1"  style="width: 130px;">
                                        <input type="text" name="msg_get_date" value="날짜" style="width: 100%; margin: auto; text-align: center;">
                                    </td>

                                </tr>
                                 <!-- 없을 때 보여주는 형식 --> 
                                 <!-- 이거 if문 채워야함 -->
                                <% if(list.isEmpty()) { %>
                                    <tr>
                                        <td id="td-2" colspan="4">  
                                            받은 쪽지가 없습니다.
                                        </td>
                                    </tr>			
                                <% } else { 
                                    for(Message message) : list <!-- list도 바꿔야함 -->) {
                                %>
                                <tr>
                                    <td id="td-2">
                                        <input type="checkbox" name="delete_check" value="delete_check">
                                    </td>
                                    <td id="td-2" name="send_id" value="받은사람"><%= member.getUserId() %></td>
                                            <!-- <td id="td-3" name="msg_contents" value="내용">			
                                                <a href="#">                            <!-- 내용클릭이 가능하게 만드는부분 -->
                                                    <%= <!-- 연결지어야하는 부분 --> %>   
                                                <!-- </a>
                                            </td> --> 
                                    <td id="td-2" name="rec_body" value="내용"><%= <!-- 연결지어야하는 부분 --> %></td>  		
                                    <td id="td-2" name="rec_date" value="날짜" style="width: 120px;"><%= <!-- 연결지어야하는 부분 --> %></td>
                                    </tr>
				
                                    <% 		}
                                        } %>
                                    
                                <tr>
                                    <td id="td-2">
                                        <input type="checkbox" name="delete_check" value="delete_check">
                                    </td>
                                    <td id="td-2" style="width: 80px;">
                                        <input type="text" name="send_id" value="예시" style="width: 100%; margin: auto; text-align: center;">
                                    </td>
                                    <td id="td-2">
                                        <input type="text" name="msg_contents" value=" 예시 아무개님에게 메세지가 왔습니다." style="width: 100%; margin: auto; text-align: center;">
                                    </td>
                                    <td id="td-2"  style="width: 120px;">
                                        <input type="text" name="msg_get_date" value="2020.11.27" style="width: 100%; margin: auto; text-align: center;">
                                    </td>
                                </tr>
                            </table>

                            <div id="msg_2-2-footer">
                                <div id="pageBar">
                                    <!-- 맨 처음으로 -->
                                    <button onclick="location.href='<%= request.getContextPath() %>/message/list?page=1 /* 임시로 만들어 놓은거 바꿔야함 */'">&lt;&lt;</button>
                                    <!-- 이전 페이지로 -->
                                    <button>&lt;</button>
                                    <!--  10개 페이지 목록 -->
                                    <button>1</button>
                                    <button onclick="location.href='<%= request.getContextPath() %>/message/list?page=2'">2</button>
                                    <button onclick="location.href='<%= request.getContextPath() %>/message/list?page=3'">3</button>
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
    <%@ include file="/views/common/footer.jsp" %>

