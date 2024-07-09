<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>page 영역</title></head>
<body>
    <h2>이동 후 page 영역의 속성값 읽기</h2>
    <%
    /* pageContextMain.jsp에서 page 영역에 저장된 속성 값들은
    이동된 현재 페이지에서 모든 데이터가 소멸되므로 아래에서는 null 값이 출력된다. */
    Object pInteger = pageContext.getAttribute("pageInteger");
    Object pString = pageContext.getAttribute("pageString");
    Object pPerson = pageContext.getAttribute("pagePerson"); 
    %>
    <ul>
        <li>Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
        <li>String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
        <li>Person 객체 : <%= (pPerson == null) ?
        			"값 없음" : ((Person)pPerson).getName() %></li>
    </ul>
</body>
</html>