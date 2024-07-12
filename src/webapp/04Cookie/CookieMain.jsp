<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>Cookie</title></head>
<body>
<!-- 쿠키 (Cookie)
: 클라이언트의 상태 정보를 유지하기 위한 기술로 클라이언트의 PC에
파일 형태로 저장된다. 쿠키 하나의 크기는 4Kb이고 3000개까지 만들 수 있다.  -->
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	/* 쿠키는 생성자를 통해서만 생성할 수 있다.
	setName()이라는 setter가 없으므로 생성 후에는 쿠키명을 변경할 수 없다. */
	Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
	/* 쿠키의 경로 설정, 컨텍스트 루트 경로로 지정하므로
	웹 애플리케이션 전체에서 사용할 수 있게 된다. */
	cookie.setPath(request.getContextPath());
	System.out.println("설정경로 : " + request.getContextPath());
	// 쿠키의 유지시간 설정, 3600초(= 1시간)으로 설정했다.
	cookie.setMaxAge(3600);
	// 응답 헤더에 쿠키를 추가하여 클라이언트 측으로 전송한다.
	response.addCookie(cookie);
	/* 여기까지의 코드를 통해 클라이언트 측에는 쿠키가 생성된다.
	생성된 쿠키는 개발자 모드에서 확인할 수 있다. */
	%>
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	/* request 내장 객체의 getCookies()를 통해 생성된
	모든 쿠키를 배열의 형태로 가져온다. */
	Cookie[] cookies = request.getCookies();
	// 생성된 쿠키가 있는지 확인 후
	if (cookies != null) {
		// 개선된 for문으로 쿠키를 하나씩 인출한다.
		for (Cookie c : cookies) {
			// 쿠키명과 값을 변수에 저장한 후 웹 브라우저에 출력한다.
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println(String.format("%s : %s<br />", cookieName, cookieValue));
		}
	}
	/* 쿠키가 생성된 직후에는 쿠키값을 읽을 수 없다.
	클라이언트 측에 저장된 쿠키를 서버로 다시 전송하기 위해
	페이지 이동을 하거나 새로고침하여 새로운 요청을 보내야만 읽을 수 있다.*/
	%>
	
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<!-- 쿠키는 유효시간이 지나지 않는다면 웹 애플리케이션 어디서든 값을 읽을 수 있다.
	즉, 페이지 이동을 하더라도 설정된 경로 내에서는 값이 소멸되지 않는다. -->
	<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>