<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>FileUpload</title></head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<!-- 하나의 파일만 등록하기 위한 작성폼 -->
	<a href="FileUploadMain.jsp">파일등록1</a>
	<!-- 2개 이상의 파일을 등록하기 위한 작성폼 -->
	<a href="MultiUploadMain.jsp">파일등록2</a>
	<%
	// 업로드 폴더의 물리적 경로
	String saveDirectory = application.getRealPath("/Uploads");
	// 물리적 경로를 기반으로 File 인스턴스 생성
	File file = new File(saveDirectory);
	// 폴더에 저장된 파일의 목록을 배열 형태로 얻어온다.
	File[] fileList = file.listFiles();
	%>
	<table border="1">
		<tr>
			<th>No</th>
			<th>이미지</th>
			<th>파일명</th>		
			<th>크기</th>
			<th></th>
		</tr>
	<%
	// 얻어온 파일의 목록의 갯수만큼 반복
	int fileCnt = 1;
	for (File f : fileList) {
	%>
		<tr>
			<td><%= fileCnt %></td>
			<!-- 이미지 -->
			<td><img src="../Uploads/<%= f.getName() %>" width="300" /></td>
			<!-- 파일명 -->
			<td><%= f.getName() %></td>
			<!-- 파일의 크기를 Kb로 출력 -->
			<td><%= (int) Math.ceil(f.length() / 1024.0) %>Kb</td>
			<!-- 파일 다운로드 링크 -->
			<td>
				<a href="Download.jsp?oName=myImage.jpg&sName=<%= f.getName() %>">[다운로드]</a>
			</td>
		</tr>
	<% 
		fileCnt++;
	}
	%>
	</table>
</body>
</html>