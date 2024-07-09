<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Java 코드를 통한 일반적인 변수 선언
int num1 = 3;
// Page 영역에 속성값 저장
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");  
pageContext.setAttribute("num4", "8");  
%>    
<html>
<meta charset="UTF-8">
<head><title>표현언어(EL) - 연산자</title></head>
<body>
    <h3>변수 선언 및 할당</h3>
    <!-- EL 및 JSTL은 영역에 저장된 속성을 이용해서 연산하거나 출력한다.
    따라서 스크립트릿에서 선언한 변수는 EL에서 사용할 수 없다.
    따라서 num1은 아무값도 출력되지 않는다. -->
    스크립틀릿에서 선언한 변수 : ${ num1 }  <br />    
    page 영역에 저장된 변수 : ${ num2 } <br />
    변수 할당 및 즉시 출력 : ${ num1 = 7 } <br />
    <!-- Tomcat 8.0부터는 EL에서 변수 할당을 할 수 있다.
    하지만 할당과 동시에 출력되므로 할당문 뒤에 ;''을 붙여줘야 출력되지 않는다.
    즉, EL에서 변수 할당은 거의 사용되지 않는다. -->
    변수 할당 및 별도 출력 : ${ num2 = 8;'' } => ${ num2 } <br />
    num1 = ${ num1 }, num2 = ${ num2 }, num3 = ${ num3 }, num4 = ${ num4 }
    
    <h3>산술 연산자</h3>
    num1 + num2 : ${ num1 + num2 } <br />
    num1 - num2 : ${ num1 - num2 } <br />
    num1 * num2 : ${ num1 * num2 } <br />
    <!-- 나눗셈에서는 /와 % 대신에 div, mod를 사용할 수 있다.
    또한 자동 형 변환이 적용되므로 정수끼리의 연산에서 실수의 결과를 반환할 수 있다. -->
    num3 / num4 : ${ num3 / num4 } <br />    
    num3 div num4 : ${ num3 div num4 }  <br />
    num3 % num4 : ${ num3 % num4 } <br />  
    num3 mod num4 : ${ num3 mod num4 }
   
    <!-- EL에서는 + 연산자로 덧셈 기능만 수행할 수 있다.
    문자열의 연결에는 사용되지 않는다. -->
    <h3>+ 연산자는 덧셈만 가능</h3>
    <!-- 문자열 34가 자동으로 정수로 변경되어 연산된다.
    Integer.parseInt()를 적용한 것과 동일한 결과가 반환된다. -->
    num1 + "34" : ${ num1 + "34" } <br />
    <!-- 하지만 숫자와 문자열 혹은 문자열과 문자열의 경우에는
    덧셈 연산이 불가능하므로 예외가 발생한다. -->
    num2 + "이십" : \${num2 + "이십" }  <br /> 
    "삼십" + "사십" : \${"삼십" + "사십" }
    
    <!-- 
    * > : gt (Greater Than)
    * >= : ge (Greater Than Equal)
    * < : lt (Less Than)
    * <= : le (Less Than Equal)
    * == : eq (Equal)
    * != : ne (Not Equal) -->
    <h3>비교 연산자</h3>
    num4 > num3 : ${ num4 gt num3 } <br />
    num1 < num3 : ${ num1 lt num3 } <br />
    num2 >= num4 : ${ num2 ge num4 } <br />
    num1 == num4 : ${ num1 eq num4 } 
	
	<!-- 논리 And, 논리 Or 사용 시 &&, || 대신 영문자 형식의 연산자를 사용할 수 있다. -->
    <h3>논리 연산자</h3>
    num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
    num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }
</body>
</html>
