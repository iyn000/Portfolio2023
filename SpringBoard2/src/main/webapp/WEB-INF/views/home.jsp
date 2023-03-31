<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
		<h1>
			
			
			<c:if test="${not empty login}"> ${login.uname} 님!</c:if> Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P><br/>
		<a href="board/list.do">board list go!</a><br/>
		
		<c:if test="${empty login}">
			<a href="<%=request.getContextPath()%>/user/join.do">회원가입</a><br/>
			<a href="<%=request.getContextPath()%>/user/login.do">로그인</a><br/>
		</c:if>
		<c:if test="${not empty login}">
			<a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a><br/>
		</c:if>
		
		<a href="<%=request.getContextPath()%>/ajax/main.do">ajax 예제 페이지로</a><br/>
		<a href="<%=request.getContextPath()%>/upload/ex01.do">파일 업로드 예제로 가기</a>
	</body>
</html>
