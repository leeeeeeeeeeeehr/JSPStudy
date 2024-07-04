<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<!--  <a> 태그를 통해 링크를 걸면 get 방식이 된다.
	? 뒤에 파라미터를 붙여서 서버로 전송한다.
	파라미터의 구분은 &로 하면 된다. -->
    <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
    <a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">  <!--GET 방식으로 요청-->
      GET 방식 전송
    </a>
    <br />
    
    <!-- <form> 태그를 이용한 post 방식의 전송,
    하위 태그인 <input>에 입력된 값이 서버로 전송된다. -->
    <form action="RequestWebInfo.jsp" method="post">  <!--POST 방식으로 요청-->
        영어 : <input type="text" name="eng" value="Bye" /><br />
        한글 : <input type="text" name="han" value="잘 가" /><br />
        <input type="submit" value="POST 방식 전송" />
    </form>

    <h2>2. 클라이언트의 요청 매개변수 읽기</h2>
    <form method="post" action="RequestParameter.jsp">  <!--다양한 <input> 태그 사용-->
        아이디 : <input type="text" name="id" value="" /><br />
        성별 :
        <input type="radio" name="sex" value="man" />남자
        <input type="radio" name="sex" value="woman" checked />여자
        <br />
        관심사항 :
        <input type="checkbox" name="favo" value="eco" />경제
        <input type="checkbox" name="favo" value="pol" checked />정치
        <input type="checkbox" name="favo" value="ent" />연예<br />
        자기소개 :
        <textarea name="intro" cols="30" rows="4"></textarea>
        <br />
        학력 :
        <select name="grade" size="4" multiple>
        	<option value="초딩">초딩</option>
        	<option value="중딩">중딩</option>
        	<option value="고딩">고딩</option>
        	<option value="대딩">대딩</option>
        </select>
        <input type="submit" value="전송하기" />
    </form>

    <h2>3. HTTP 요청 헤더 정보 읽기</h2>
    <a href="RequestHeader.jsp">  <!--HTTP 요청 헤더 읽기-->
        요청 헤더 정보 읽기
    </a>    
</body>

</html>