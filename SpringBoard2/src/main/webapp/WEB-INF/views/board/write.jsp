<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>�Խñ� �ۼ�</h2>
		<form name="frm" action="write.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th align="right">����</th>
					<td><input type="text" name="btitle"></td>
				</tr>
				<tr>
					<th align="right">����</th>
					<td>
						<input type="radio" name="bkind" value="J">J
						<input type="radio" name="bkind" value="H">H
					</td>
				</tr>
				<tr>
					<th align="right">����</th>
					<td><textarea name="bnote"></textarea></td>
				</tr>
				<tr>
					<th align="right">���� ���ε�</th>
					<td><input type="file" name="file" name="uploadFile"></td>
				</tr>
			
				
			</table>
			<button>����</button>
		</form>
		<!-- �����ư Ŭ���� �Է� �� ��� ���� �ֿܼ� ��� �� list�������� �̵� -->
	</body>
</html>