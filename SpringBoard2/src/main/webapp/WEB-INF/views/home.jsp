<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
		<h1>
			
			
			<c:if test="${not empty login}"> ${login.uname} ��!</c:if> Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P><br/>
		<a href="board/list.do">board list go!</a><br/>
		
		<c:if test="${empty login}">
			<a href="<%=request.getContextPath()%>/user/join.do">ȸ������</a><br/>
			<a href="<%=request.getContextPath()%>/user/login.do">�α���</a><br/>
		</c:if>
		<c:if test="${not empty login}">
			<a href="<%=request.getContextPath()%>/user/logout.do">�α׾ƿ�</a><br/>
		</c:if>
		
		<a href="<%=request.getContextPath()%>/ajax/main.do">ajax ���� ��������</a><br/>
		<a href="<%=request.getContextPath()%>/upload/ex01.do">���� ���ε� ������ ����</a>
	</body>
</html>
