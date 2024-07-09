<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>JSTL - if</title></head>
<body>
<!-- if 태그
: 조건을 확인하여 실행 여부를 판단한다.

* test: EL을 이용해서 조건식을 삽입한다.
* var: test 속성에서 판단한 결과값을 저장한다. -->

	<!-- 변수 선언 -->
	<c:set var="number" value="100" />
	<c:set var="string"	 value="JSP" />
	
	<!-- if (number % 2 == 0)과 동일한 조건의 if문으로
	해당 조건의 결과가 result에 저장된다. 나머지는 0이므로 true가 된다. -->
	<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
	<c:if test="${ number mod 2 eq 0 }" var="result">${ number }는 짝수입니다. <br /></c:if>
	result : ${ result } <br />
	
	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<!-- JSTL의 if 태그는 else 구문이 별도로 없으므로
	if문과 반대의 조건을 만들어서 두 개의 if 태그를 사용한다.
	
	Java에서는 비교연산자 ==과 equals()가 서로 다르지만
	EL에서는 eq를 통해 값에 대한 비교와 문자열에 대한 비교 모두 할 수 있다.
	
	첫 번째 if문은 false의 결과가 나온다. 따라서 result2에는 false가 저장된다.  -->
	<c:if test="${ string eq 'Java' }" var="result2">문자열은 Java입니다. <br /></c:if>
	<!-- result2에는 not을 붙여 반대의 조건을 만든다. 따라서 else와 같은 구문이 된다. -->
	<c:if test="${ not result2 }">'Java'가 아닙니다. <br /></c:if>
	
	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result3">EL이 아닌 정수를 지정하면 false</c:if>
	result3 : ${ result3 } <br />
	<c:if test="tRuE" var="result4">대소문자 구분 없이 'tRuE'인 경우<br /></c:if>
	result4 : ${ result4 } <br />
	<!-- test에는 앞 뒤에 공백이 하나라도 들어가면 무조건 false를 반환하므로 주의해야 한다. -->
	<c:if test=" ${ true } " var="result5">EL 양쪽에 빈 공백이 있는 경우 false<br /></c:if>
	result5 : ${ result5 } <br />
	
	<h4>연습문제 : if 태그</h4>
    <!-- 아이디, 패스워드를 입력 후 submit 버튼을 누르면
    EL식을 통해 파라미터를 받은 후 tjoeun/1234인 경우에는 'tjoeun님, 하이룽~'이라고 출력한다. 
    만약 틀렸다면 "아이디/비번을 확인하세요"라고 출력한다. 
    EL과 JSTL의 if 태그만을 이용해서 구현하시오. -->
    <form method="get">
		아이디 : <input type="text" name="user" /><br />
		패스워드 : <input type="text" name="pass" /><br />
		<input type="submit" value="로그인" />
	</form>	
	
	<!-- 최초 실행 시에는 파라미터가 없는 상태이므로 아무 내용도 출력되면 안된다.
	전송된 파라미터가 있을 때만 실행되도록 한다. -->
	<c:if test="${ not empty param.user  }">
		전송된 아이디 : ${ param.user } <br />
		전송된 비밀번호 : ${ param.pass } <br />
		
		<!-- 아이디, 비번의 일치 여부를 판단한 후 결과를 loginResult에 저장한다.
		if 태그는 else 구문이 별도로 없으므로 not을 통해 else와 같은 구문을 구성해야 한다. -->
		<c:if test="${ param.user == 'tjoeun' and param.pass eq '1234' }" var="loginResult">
											${ param.user }님, 안녕하세요. <br /></c:if>
		<c:if test="${ not loginResult }">아이디, 패스워드를 확인해주세요.<br /></c:if>
	</c:if>	
	
</body>
</html>