<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
		<head>
		<meta charset="EUC-KR">
	<title>Insert title here</title>
	</head>
	<body>
		<h2>���� ���ε� ����</h2>
		<form action="upload.do" method="post" enctype="multipart/form-data">
			<input type="file" name="file1">
			<input type="file" name="file2">
			<input type="file" name="file3">
			<button>���ε�</button>
		</form>
		
		<c:if test="${not empty param.uploadFileName}">
		<img src="<%= request.getContextPath()%>/resources/uploadFile/${param.uploadFileName}">
		</c:if>
		
	</body>
</html>