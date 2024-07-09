<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>1. 로그인 폼</h2>
    <%
    /* get 방식으로 전달된 loginErr 파라미터가 있는 경우에만 "로그인 실패"를 출력한다.
    첫 실행 시에는 파라미터가 없는 상태이므로 메세지는 출력되지 않는다. */
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) out.print("로그인 실패");
    %>
    <!-- 로그인을 위해 post 방식으로 폼 값을 전송한다.
    get 방식으로 전송하면 로그인 정보가 쿼리스트링을 통해 주소 줄에 남기 때문에
    정보 유출의 위험이 있다. 따라서 로그인과 같이 보안이 필요한 경우에는 post 방식을 사용해야 한다. -->
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="text" name="user_pwd" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <!-- 응답 헤더에 날짜를 지정하는 경우 대한민국은 세계표준시(그리니치 천문대)보다 9시간이 빠르므로
    그만큼을 더해줘야 정상적인 날짜가 출력된다. 만약 09시 이전의 시간으로 세팅하면 하루 전의 날짜가 출력된다. -->
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-12-01 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>
</html>