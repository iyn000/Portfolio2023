<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>게시글 목록</h2>
		
		<form name="frm" action="list.do" method="get">
			<select name="searchType">
				<option value="title" <c:if test ="${param.searchType eq 'title'}" > selected</c:if> > 제목 </option>
				<option value="writer" <c:if test="${param.searchType eq 'writer'}"> selected</c:if> >작성자</option>
			</select>
			<select name="searchKind">
				<option value="J" <c:if test ="${param.searchKind eq 'J'}" >selected</c:if>>자바</option>
				<option value="H" <c:if test ="${param.searchKind eq 'H'}" >selected</c:if>>HTML</option>
			</select>
			
			<input type="text" name="searchValue" value="${param.searchValue}">
			<button>검색</button>
			
		</form>
		
		<c:if test="${not empty login}">
			<button onclick="location.href='write.do' ">등록</button>			
		</c:if>
		
		<table>
			<tr>
				<th>no</th><th>제목</th><th>종류</th>
			</tr>
			
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.bno}</td>
					<td><a href="view.do?bno=${vo.bno}">${vo.btitle}</a></td>
					<td>${vo.bkind}</td>
				</tr>
			</c:forEach>
		</table>
		
	</body>
</html>