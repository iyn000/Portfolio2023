<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
			<script>
				function checkId()
				{ //���̵� �ߺ�üũ
					var contextPath = '<%=request.getContextPath()%>';
					$.ajax({
						
						url:contextPath+"/ajax/checkID.do",
						type:"get",
						data:{id : $("#uid").val()},
						success:function(data)
						{
							if(data == '0')
							{ //�ߺ�
								alert("����� �� ���� ���̵��Դϴ�.");
								$("#uid").val();
							}else if(data == '1')
							{
								alert("����� �� �ִ� ���̵��Դϴ�.");
							}
						},
							error:function()
							{
								alert("���ܹ߻�!");
							}
							
							
						
					
					})
				};
			</script>
	</head>
	<body>
		<h2>ȸ������</h2>
		<form name="frm" action="join.do" method="post">
				
				<table>
					<tr>
						<th algin="right"> id : </th>
						<td id="idCheck"></td>
						<td><input type="text" name="uid" id="uid"> <button type="button" onclick="checkId()">�ߺ�Ȯ��</button></td>
					</tr>
					<tr>
						<th algin="right"> password : </th>
						<td><input type="password" name="upw"></td>
					</tr>
					<tr>
						<th algin="right"> name : </th>
						<td><input type="text" name="uname"></td>
					</tr>
					<tr>
						<th algin="right"> gender : </th>
						<td>
							<input type="radio" name="ugen" value="M">M
							<input type="radio" name="ugen" value="F">F
						</td>
					</tr>
				</table>
				<button>ȸ������</button>
			</form>
			
		
			
	</body>
</html>