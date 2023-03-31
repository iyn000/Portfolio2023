<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script>
			var updateYN = '${param.updateYN}'
			
			window.onload = function(){
				if(updateYN == 'N'){
					alert("��������");
				}
			}
		</script>
	</head>
	<body>
		<h2>�Խñ� ����ȸ</h2>
		
		<table>
			<tr>
				<th align="right">���� : </th>
				<td>${vo.btitle}</td>
			</tr>
			<tr>
				<th align="right">���� : </th>
				<td>
					<c:if test="${vo.bkind eq 'j'}">�ڹ�</c:if>
					<c:if test="${vo.bkind eq 'H'}">HTML</c:if>
				</td>
			</tr>
			<tr>
				<th align="right">�ۼ��� : </th>
				<td>${vo.bwdate}</td>
			</tr>
			<tr>
				<th align="right">��ȸ�� : </th>
				<td>${vo.bhit}</td>
			</tr>
			<tr>
				<th align="right">���� : </th>
				<td>${vo.bnote}</td>
			</tr>
			<tr>
				<th align="right">���� : </th>
				<td>
					<c:if test="${not empty param.uploadFileName}">
						<img src="<%= request.getContextPath()%>/resources/uploadFile/${param.uploadFileName}">
					</c:if>
				</td>
			</tr>
			
		</table>
		
		<c:if test="${not empty login and login.uno eq vo.uno}">
		<button onclick="location.href='modify.do?bno=${vo.bno}'">����</button>
		<button onclick="document.delfrm.submit();">����</button>
		<form name="delfrm" action="delete.do" method="post">
			<input type="hidden" name="bno" value="${vo.bno}">
		</form>
		</c:if>
		<button onclick="location.href='list.do'">����Ʈ��</button>
	</body>
</html>