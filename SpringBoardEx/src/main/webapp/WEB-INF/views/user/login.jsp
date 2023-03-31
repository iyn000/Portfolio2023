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
	
	
		<!-- 폰트 -->
		<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
		
		
		<!--제이쿼리-->
		<script src="js/jquery-3.6.1.min.js"></script>
		
		  <style>
		      .bd-placeholder-img 
		      {
		        font-size: 1.125rem;
		        text-anchor: middle;
		        -webkit-user-select: none;
		        -moz-user-select: none;
		        user-select: none;
		      }
		
		      @media (min-width: 768px) 
		      {
		        .bd-placeholder-img-lg 
		        {
		          font-size: 3.5rem;
		        }
		      }
		
	
				body 
				{
				  display: flex;
				  align-items: center;
				  padding-top: 40px;
				  padding-bottom: 40px;
				  background-color: #f5f5f5;
				}
				
    </style>

	<body class="text-center position-absolute top-50 start-50 translate-middle" id="login_page">
	
		
		<div class="form-signin w-100 m-auto">
			<div class="w-100 m-auto mb-3" style="font-size:12px;">해당 시스템은 로그인 이후 사용가능합니다</div>
			<hr/>
			<form name="frm" action="login.do" method="post" class="form-floating">
				
				<table>
					<tr>
						<th>아이디  </th>
						<td><input type="text" name="uid" id="uid" class="form-control"><td>
					</tr>
					<tr>
						<th>비밀번호  </th>
						<td><input type="password" name="upw" id="upw" class="form-control"><td>
					</tr>
					<tr>
						<td colspan="2"><button style="width:150px; font-weight:bold;" class="w-100 btn btn-lg btn-primary mt-3" type="submit">로그인</button><td>
					</tr>
				</table>
			</form>
			<a href="<%=request.getContextPath()%>/user/join.do" style="float:right; padding-right:5px;">[회원가입]</a>
		</div>
		
	</body>
</html>