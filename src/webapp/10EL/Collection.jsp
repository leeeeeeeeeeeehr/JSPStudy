<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head><title>표현언어(EL) - 컬렉션</title></head>
<body>
	<h2>List 컬렉션</h2>
	<%
	// List를 Object 기반으로 생성
	List<Object> aList = new ArrayList<Object>();
	// 아래와 같이 타입 매개변수를 생략해도 Object 기반의 List가 된다.
	List aList2 = new ArrayList();
	
	// String 인스턴스 추가
	aList.add("청해진");
	// Person 인스턴스 추가
	aList.add(new Person("장보고", 28));
	// page 영역에 List를 저장한다.
	pageContext.setAttribute("Ocean", aList);
	%>
	<ul>
		<!-- 첫 번째는 String 인스턴스가 출력된다.
		List는 배열의 특성을 가지므로 인덱스로 접근할 수 있다. -->
		<li>0번째 요소 : ${ Ocean[0] }</li>
		<!-- 두 번째는 Person 인스턴스가 출력된다.
		멤버변수명을 통해 getter()를 호출하여 출력한다.
		만약 getter()를 정의하지 않으면 에러가 발생한다. -->
		<li>1번째 요소 : ${ Ocean[1].name }, ${ Ocean[1].age }</li>
		<!-- 2번 인덱스에는 아무런 값도 없으므로 출력되지 않는다.
		Java라면 예외가 발생하겠지만 EL에서는 예외가 발생하지 않는다. -->
		<li>2번째 요소 : ${ Ocean[2] }</li>
	</ul>
	
	<h2>Map 컬렉션</h2>	
	<%
	// Map을 생성한다. Key와 Value 모두 String으로 선언한다.
	Map<String, String> map = new HashMap<String, String>();
	// 한글을 Key로 설정하여 값을 추가한다.
	map.put("한글", "훈민정음");
	// 영어를 Key로 사용한다.
	map.put("Eng", "English");
	// page 영역에 저장한다.
	pageContext.setAttribute("King", map);
	%>
	<ul>
		<!-- Key 값이 영문인 경우에는 아래 3가지 방법 모두를 사용할 수 있다. -->
		<li>영문 Key : ${ King["Eng"] }, ${ King['Eng'] }, ${ King.Eng }</li>
		<!-- 단, Key 값이 한글인 경우에는 .(닷)을 사용할 수 없다.
		파싱할 수 없다는 에러가 발생된다. -->
		<li>한글 Key : ${ King["한글"] }, ${ King['한글'] }, \${ King.한글 } </li>
		<!-- EL식 앞에 \(역슬래시)를 붙이면 주석이 된다.
		단, 코드가 숨겨지는 것은 아니고 화면에 작성한 그대로 출력된다.
		실행되지 않는 코드이므로 주석이라 표현한다. -->
	</ul>
</body>
</html>