<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>예제 페이지</title>
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

		<!-- 스타일 시트 연결 -->
		<link href="../resources/css/style.css" rel="stylesheet">
		<style>
				body 
				{
				  display: flex;
				  align-items: center;
				  padding-top: 40px;
				  padding-bottom: 40px;
				  background-color: #f5f5f5;
				}
		</style>
	
		<!-- 폰트 -->
		<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
		
		
		<!--제이쿼리-->
		<script src="../resources/js/jquery-3.6.1.min.js"></script>
		
			<script>
				function checkId()
				{ //아이디 중복체크
					var contextPath ='<%=request.getContextPath()%>';
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
	<body class="container">
		
		
		<div class="position-absolute top-50 start-50 translate-middle">
			
			<form name="frm" action="join.do" method="post">
				<p class="text-center">회원 가입 후 로그인하여 이용하세요.</p>
				<hr/>	
				<table class="table text-end" >
					<tr>
						<th>아이디 : </th>
						<td><input type="text" id="uid" name="uid" class="form-control"></td>
						<td><button type="button" onclick="checkId()" class="btn btn-secondary">아이디 중복확인</button></td>
					</tr>
					<tr>
						<th>비밀번호 : </th>
						<td colspan="2"><input type="password" id="upw" name="upw" class="form-control"></td>
					</tr>
					<tr>
						<th>이름 : </th>
						<td colspan="2"><input type="text" name="uname" class="form-control"></td>
					</tr>
					<tr>
						<th>이메일 : </th>
						<td colspan="2"><input type="text" name="uemail" class="form-control"></td>
					</tr>
					<tr>
						<th>연락처 : </th>
						<td colspan="2"><input type="text" name="unumber" class="form-control"></td>
					</tr>
					<tr>
						<th>주소 : </th>
						<td colspan="2"><input type="text" name="uaddr" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="3"><button type="submit" style="width:300px;" class="btn btn-secondary d-grid gap-2 col-6 mx-auto">회원가입</button></td>
					</tr>
				
				</table>
				
			</form>
		</div>
		
	</body>
</html>