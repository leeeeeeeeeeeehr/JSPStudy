<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 전송된 폼값을 받는다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
/* checkbox의 경우 2개 이상의 항목을 전송할 수 있으므로
getParameterValues()를 사용해야 한다.
하지만 항목이 1개라면 일반적인 폼값과 동일하게 받을 수 있다. */
String save_check = request.getParameter("save_check");

// 단순한 문자열 비교로 로그인 처리를 한다.
if ("must".equals(user_id) && "1234".equals(user_pw)) {
	// 로그인에 성공을 했고아이디 저장에 체크한 상태라면
	if (save_check != null && save_check.equals("Y")) {
		// 하루(60초 * 60초 * 24 = 86400초(= 24시간))짜리 쿠키를 생성한다.
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	}
	else {
		// 로그인에 성공했지만 체크를 해제한 상태라면 쿠키를 삭제한다.
		CookieManager.deleteCookie(response, "loginId");
	}
	
	JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
}
else {
	// 로그인 실패
	JSFunction.alertBack("로그인에 실패했습니다.", out);
}
%>