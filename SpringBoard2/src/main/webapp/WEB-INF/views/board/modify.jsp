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
		<h2>�Խñ� ����</h2>
		<form name="frm" action="modify.do" method="post">
		<input type="hidden" name="bno" value="${vo.bno}">
		<table>
			<tr>
				<th align="right">���� : </th>
				<td><input type="text" name="btitle" value="${vo.btitle}"></td>
			</tr>
			<tr>
				<th align="right">���� : </th>
				<td>
					<input type="radio" name="bkind" value="J" <c:if test="${vo.bkind eq 'J'}">checked</c:if>>J
					<input type="radio" name="bkind" value="H" <c:if test="${vo.bkind eq 'H'}">checked</c:if>>H
				</td>
			</tr>
			<tr>
				<th align="right">���� : </th>
				<td><textarea name="bnote">${vo.bnote}</textarea></td>
			</tr>
			
		</table>
		<button>����</button>
		</form>
		<button onclick="location.href='view.do?bno=${vo.bno}'">���</button>
	</body>
</html>