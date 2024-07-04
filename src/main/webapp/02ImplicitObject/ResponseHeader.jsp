<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* get 방식으로 전송된 폼 값을 날짜 형식을 통해 타임스탬프로 변경한다.

- getTime(): 날짜를 1970-01-01부터 지금까지의 시간을 초 단위로 반환해주는 메서드이다. */
// 날짜와 시간의 서식을 지정한다. (응답 헤더에 추가할 값 준비)
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
// String 타입의 폼 값을 날짜 형식으로 변경한 후 타임스탬프를 얻어온디.
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date = " + add_date);

// 숫자 형식으로 전송된 값을 정수로 변환한다. 
int add_int = Integer.parseInt(request.getParameter("add_int"));

// 문자형은 그대로 사용하면 된다.
String add_str = request.getParameter("add_str");

/* addDateHeader(헤더명, long타입의 타임스탬프)
: 응덥 헤더에 날짜 형식을 추가하는 경우 long 타입의 타임스탬프로 변환한 후 추가하면 된다.
addIntHeader()
: 숫자 형식의 응답 헤더를 추가한다.
addHeader()
: 문자 형식의 응답 헤더를 추가한다. */

// 날짜 형식 추가 (응답 헤더에 값 추가)
response.addDateHeader("myBirthday", add_date);
// 숫자 형식 추가, 동일한 헤더명으로 2개의 값을 추가
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);		// 추가
// 문자 형식 추가
response.addHeader("myName", add_str);
// 앞에서 추가한 값을 '안중근'으로 수정한다.
response.setHeader("myName", "안중근");			// 수정
%>
<!DOCTYPE html>
<html>
<head><title>내장 객체 - response</title></head>

<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	// getHeaderNames()를 통해 응답 헤더명 전체를 얻어온디.
	Collection<String> headerNames = response.getHeaderNames();
	// 확장 for문으로 갯수만큼 반복한다.
	for (String hName : headerNames) {
		// 헤더명을 통해 헤더값을 얻어온 후 출력한다.
		String hValue = response.getHeader(hName);
	%>
		<li><%= hName %> : <%= hValue %></li>
	<%
	}
	/* 첫 번째 출력 결과에서 myNumber라는 헤더명이 2번 출력되는데 이때 동일한 값 8282가 출력된다.
	이것은 getHeader() 메서드의 특성으로 처음 입력한 헤더값만 출력된다. */
	%>
	
	<h2>myNumber만 출력하기</h2>
	<%
	/* myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는 각각의 값이 정삭적으로 출력된다.
	즉, add 계열의 메서드는 헤더명을 동일하게 사용하더라도 헤더값은 정상적으로 추가된다.
	즉, 덮어쓰기 하지 않는다. */
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li>myNumber : <%= myNum %></li>
	<%
	}
	%>
</body>
</html>