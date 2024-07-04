<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Session</title></head>
<body>
	<!-- JSP에서 인클루드는 2가지 방법이 있다.
	1 ) include 지시어를 이용한 방법
	2 ) 액션 태그를 이용한 방법 -->
	<%--@ include file="../Common/Link.jsp" --%>
	<jsp:include page="../Common/Link.jsp" />
	
	<h2>로그인 페이지</h2>
	
	<!-- 로그인을 위해 폼값을 전송한 후 조건에 맞는 회원정보가 없다면
	request 영역에 에러 메세지를 저장한 후 현재 페이지로 forward 한다.
	request 영역은 forward 된 페이지까지는 공유되므로 아래의 메세지를 출력할 수 있다. -->
	<span style="color: red; font-size: 1.2em;">
		<!-- if문 대신 삼항연산자를 통해 분기 -->
		<%= request.getAttribute("LoginErrMsg") == null ?
					"" : request.getAttribute("LoginErrMsg") %>
	</span>
<%
/* session 영역에 해당 속성값이 있는지 확인한다.
즉, session 영역에 저장된 속성이 없다면 로그아웃 상태이므로
로그인 폼을 웹 브라우저에 출력한다. */
if (session.getAttribute("UserId") == null)		// 로그인 상태 확인
{			// if 시작
%>
		<!-- 로그아웃인 상태,
		로그인 폼의 입력값을 서버로 전송하기 전에 검증하기 위해 정의한 함수로
		입력값이 빈 값인지 확인하여 경고창을 띄워준다. -->
		<script>
		function validateForm(form) {
			/* 매개변수로 전달된 DOM을 통해 하위 태그인 <input>에 접근할 수 있다.
			접근 시에는 name 속성값을 사용하고 value는 입력값을 가리키게 된다. */
			if (!form.user_id.value) {
				// 입력된 값이 없으면 경고창을 띄우고
				alert("아이디를 입력하세요.");
				// 입력을 위해 포커스를 이동하고
				form.user_id.focus();
				// submit 이벤트 리스너쪽으로 false를 반환한다.
				return false;
			}
			/* 빈 값에 대한 체크는 !(부정연산자)와 아래의 방식 2가지를 모두 사용할 수 있다. */
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				form.user_pw.focus();
				return false;
			}
		}
		</script>
		<!-- 로그인 폼에서 아이디, 비밀번호를 입력한 후 submit 버튼을 누르면
		action에 설정된 경로로 폼 값이 전송된다. submit 버튼을 누를 때
		JavaScript 함수를 호출하게 되는데 이때 전달되는 인수 this는
		<form> 태그의 DOM을 가리킨다.
		 -->
		<form action="LoginProcess.jsp" method="post" name="loginFrm"
			onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id"	/><br />
			비밀번호 : <input type="password" name="user_pw" /><br />
			<input type="submit" value="로그인하기" /> 	
		</form>
<%
} else {	// if 끝 + else 시작
%>
		<!-- 로그인된 상태,
		session 영역에 속성값이 있다면 로그인에 성공한 상태이므로
		회원의 이름과 로그아웃 버튼을 출력한다. -->
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br />
		<a href="Logout.jsp">[로그아웃]</a>
<%
}			// else 끝
%>
</body>
</html>