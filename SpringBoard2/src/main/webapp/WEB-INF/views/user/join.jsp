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
				{ //아이디 중복체크
					var contextPath = '<%=request.getContextPath()%>';
					$.ajax({
						
						url:contextPath+"/ajax/checkID.do",
						type:"get",
						data:{id : $("#uid").val()},
						success:function(data)
						{
							if(data == '0')
							{ //중복
								alert("사용할 수 없는 아이디입니다.");
								$("#uid").val();
							}else if(data == '1')
							{
								alert("사용할 수 있는 아이디입니다.");
							}
						},
							error:function()
							{
								alert("예외발생!");
							}
							
							
						
					
					})
				};
			</script>
	</head>
	<body>
		<h2>회원가입</h2>
		<form name="frm" action="join.do" method="post">
				
				<table>
					<tr>
						<th algin="right"> id : </th>
						<td id="idCheck"></td>
						<td><input type="text" name="uid" id="uid"> <button type="button" onclick="checkId()">중복확인</button></td>
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
				<button>회원가입</button>
			</form>
			
		
			
	</body>
</html>