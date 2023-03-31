<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>Home</title>
		</head>
	<body>
		<h1>
			Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P><br>
		
		<c:if test="${empty login}">
			<a href="<%=request.getContextPath()%>/user/login.do"><button type="button">로그인</button></a>
			<a href="<%=request.getContextPath()%>/user/join.do"><button type="button">회원가입</button></a>
		</c:if>
		
		<c:if test="${not empty login}">
			<a href="<%=request.getContextPath()%>/board/notice_list.do"><button type="button">페이지로</button></a>
			<a href="<%=request.getContextPath()%>/user/logout.do"><button type="button">로그아웃</button></a>
		</c:if>
		
		
	
	</body>
</html>
