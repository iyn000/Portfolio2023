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
		<link href="../resources/css/style.css?after" rel="stylesheet">
	
	
		<!-- 폰트 -->
		<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
		
		
		<!--제이쿼리-->
		<script src="../resources/js/jquery-3.6.1.min.js"></script>
		
	</head>
	<body>
		<header class="container">

			<div id="header_1" class="container">
				<ul >
					<li><a href="<%=request.getContextPath()%>/board/notice_list.do">공지사항</a></li>
					<li><a href="#" class="ms-4 me-4 ">자유 게시판</a></li>
					<li><a href="#">Q&A 게시판</a></li>
				</ul>
			</div>

			<div  id="header_2" class="container">
				<ul>
					<li class="me-4"><c:if test="${not empty login}">${vo.uname}</c:if>님 환영합니다</li>
					<li>[<a href="#"> 마이 페이지</a> ｜ <a href="<%=request.getContextPath()%>/user/logout.do">로그아웃 </a>]</li>
				</ul>
			</div>

			<hr/>
		</header>
		
		
		
		
		
		
		
		
		
		
		
		
		