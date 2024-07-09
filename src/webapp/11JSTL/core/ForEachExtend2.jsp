<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>JSTL - forEach 2</title></head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	// List 계열의 컬렉션 생성
	LinkedList<Person> lists = new LinkedList<Person>();
	// Person 인스턴스 3개를 추가
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));	
	%>
	<!-- set 태그로 page 영역에 속성(변수)를 저장한다. -->
	<c:set var="lists" value="<%= lists %>" />
	<!-- 저장한 변수를 통해 확장 for문을 실행한다.
	지정한 컬렉션에 저장된 인스턴스의 갯수만큼 반복하여 items에 list로 하나씩 전달한다. -->
	<c:forEach items="${ lists }" var="list">
	<!-- 저장된 순서대로 Person 인스턴스를 변수 list에 저장 후
	getter를 통해 멤버변수에 저장된 값을 출력한다. -->
	<li>
		이름 : ${ list.name }, 나이 : ${ list.age }
	</li>
	</c:forEach>
	
	<h4>Java 코드를 통한 출력</h4>
	<%
	/* Java 코드를 사용하면 출력할 인스턴스를 명시한 후 getter를 직접 호출해야 한다. */
	for (Person per : lists) {
		out.print("이름 : " + per.getName() + ", 나이 : " + per.getAge() + "<br>");
	}
	%>
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
	/* Map 계열의 컬렉션을 생성한다.
	Key는 String, Value는 Person 타입으로 지정했다. */
	Map<String, Person> maps = new HashMap<String, Person>();
	maps.put("1st", new Person("맹사성", 34));
	maps.put("2nd", new Person("장영실", 44));
	maps.put("3rd", new Person("신숙주", 54));
	%>
	<!-- JSTL을 통해 변수 저장 -->
	<c:set var="maps" value="<%= maps %>" />
	<!-- Map 사용 시 Key를 별도로 얻어올 필요없이
	변수명.key 혹은 변수명.vale를 통해 값을 얻어와 출력할 수 있다. -->
	<c:forEach items="${ maps }" var="map">
	<li>Key => ${ map.key } <br />
		Value => 이름 : ${ map.value.name }, 나이 : ${ map.value.age }
	</li><br />
	</c:forEach>

	<h4>Java 코드를 통한 출력</h4>
	<%
	// Map은 항상 Key를 먼저 얻어와야 한다.
	Set<String> keys = maps.keySet();
	// 앞에서 얻어온 Key의 갯수만큼 반복한다.
	for (String key : keys) {
		// Key를 통해 Value를 얻어온다.
		Person per = maps.get(key);
		/* Key와 Value를 출력한다. Value는 Person 인스턴스이므로
		멤버변수에 저장된 값은 getter를 통해 출력할 수 있다. */
		out.print("Key = > " + key + "<br>");
		out.print("Value => " + per.getName() + ", " + per.getAge() + "<br>");
	}
	
	// JSTL의 확장 for문을 사용하면 Key를 별도로 얻어와야하는 번거로움이 없으므로 편리하다.
	%>
</body>
</html>