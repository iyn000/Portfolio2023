<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>로그인</h2>
		<form name="frm" action="login.do" method="post">
			<table>
				<tr>
					<th>id : </th>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<th>pw : </th>
					<td><input type="password" name="upw"></td>
				</tr>
				
			</table>
			<button>로그인</button>
		</form>
	</body>
</html>