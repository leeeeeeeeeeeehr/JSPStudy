<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 해당 페이지에서는 가장 먼저 팝업창 오픈에 관련된
쿠키가 있는지 확인한 후 팝업창을 처리한다. */
String popupMode = "on"; 

// 쿠키를 배열로 얻어온 후 모든 쿠키를 읽는다.
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        
        /* 생성된 쿠키 중에 아래와 같이 쿠키명이 일치하는 것을 찾는다.
        조건에 만족한다면 변수에 쿠키값을 저장한다. */
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
    div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:300px; height:100px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
// jQuery의 엔트리 포인트 (진입점)
$(function() {
	// 팝업창의 '닫기' 버튼을 누르면 아래 jQuery를 실행한다.
    $('#closeBtn').click(function() {
    	// 레이어 팝업창을 숨김 처리한다. (엘리먼트의 display 속성을 none으로 변경한다.)
    	$('#popup').hide();
    	/* 하루동안 열지 않음 체크박스에 체크한 경우에는 value를 얻어와서 변수에 저장한다.
    	value는 1로 설정되어있다. */
    	var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
    	$.ajax({
    		// 요청 URL
    		url : './PopupCookie.jsp',
    		// 전송방식
    		type : 'get',
    		// 서버로 전송할 파라미터
    		data : {inactiveToday : chkVal},
    		// 콜백 데이터의 타입 (text 형식으로 지정)
    		dataType : "text",
    		// 요청 성공 시 호출될 콜백 함수
    		success : function(resData) {
    			// 콜백 데이터가 있다면 화면을 새로고침한다. F5를 누른 것과 동일하다.
    			if (resData != '') location.reload();
    		}
    	});
    });
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
	// 스크립트릿을 통해 아래 문장을 10번 출력
    for (int i = 1; i <= 10; i++) {
    	/* 변수 popupMode의 초기값은 on이고
    	만약, 쿠키가 생성되었다면 off로 설정된다. */
        out.println("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    }
	/* 만약 변수값이 on이 아니라면 아래 팝업창을 위한 HTML 코드는 물리적으로 삽입되지 않는다.
	즉, 쿠키의 상태에 따라 페이지가 동적으로 변경된다. */
    if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right"><form name="popFrm">
            <input type="checkbox" id="inactiveToday" value="1" />
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" />
        </form></div>
    </div>
<%
    }
%>
</body>
</html>
