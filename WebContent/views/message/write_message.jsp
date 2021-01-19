<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
    <section>
        <div id="msg_container">
            <form action="<%=request.getContextPath()%>/msg/write" method="post">
                <div id="msg_1">
                    <h1>CAREPOOL 쪽지</h1>
                </div>
                <div id="msg_2">
                    <div id="msg_2-1">
                        <div id="write_msg">
                            <a href="<%= request.getContextPath()%>/msg/write">
                                쪽지쓰기
                            </a>
                        </div>
                        <div>
                            <a href="<%= request.getContextPath()%>/msg/get">
                                받은쪽지함
                            </a>
                        </div>
                        <div>
                            <a href="<%= request.getContextPath()%>/msg/send">
                                보낸쪽지함
                            </a>
                        </div>
                    </div>
                    <div id="msg_2-2">
                        <div id="msg_2-2-header">
                            <label style="font-size: large;">받는 사람</label>
                            <input type="text" name="rev_id" placeholder="아이디를 입력해주세요">
                        </div>
                        <div id="msg_2-2-section">

                            <div style="margin-left: 35px;">
                                <textarea name="msg_contents" id="msg_content" cols="100" rows="25" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                            </div>
                        </div>
                        <input type="submit" value="보내기" style="margin-left: 640px; margin-top: 5px;">
                    </div>
                </div>
            </form>
        </div>
    </section>
    <%@ include file="/views/common/footer.jsp" %>
