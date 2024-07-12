<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 페이지로 진입하면 loginId라는 쿠키가 있는지 확인한다.
String loginId = CookieManager.readCookie(request, "loginId");

// 이미 생성된 쿠키가 있다면 체크박스가 체크된 상태로 페이지를 로드한다.
String cookieCheck = "";
if (!loginId.equals("")) {
	// 여기에서 부여된 값은 아래 checkbox의 속성값으로 사용된다.
	cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head><title>Cookie - 아이디 저장하기</title></head>
<body>
    <h2>로그인 페이지</h2>
    <form action="IdSaveProcess.jsp" method="post">
    <!-- 쿠키에 저장된 아이디가 있다면 value 속성에 설정한다. -->
    아이디 : 
		<input type="text" name="user_id" value="<%= loginId %>" tabindex="1" />
		<!-- 쿠키가 있다면 체크박스에 체크한 상태로 설정한다. -->
  		<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3" />
   		아이디 저장하기
   		<br />
    패스워드 :
    	<input type="text" name="user_pw" tabindex="2" />
    	<br />
    <input type="submit" value="로그인하기" />
    </form>
</body>
</html>