<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="../include/head.jsp" %>

		<!-- cut -->
		
		<div class="container" id="Page_Name">
			<h3>｜ 공지사항</h3>
			<hr/>
		</div>
		
		<div id="Notice_list_page" class="container">

		<!-- 검색  -->
			<div id="Notice_search" class="d-flex align-items-end flex-column mb-3">
				
				<form name="frm" action="notice_list.do" method="get" class="input-group input-group-sm mb-3">
					<label for="searchType" >검색</label>
					
					<select id="searchType" name="searchType" class="form-select">
						<option selected disabled>전체 ▼</option>
						<option value="title_note" <c:if test ="${param.searchType eq 'title_note'}" > selected</c:if>	>제목+내용</option>
						<option value="writer" <c:if test="${param.searchType eq 'writer'}"> selected</c:if>	>작성자</option>
					</select>
					
					<input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width:200px" >
					<button class="btn btn-light btn-outline-dark btn-sm">검색</button>
				</form>
				
			</div>
			
			
			<!-- 리스트 -->
			<div>
				<p> -총 **건이 조회되었습니다. </p>
				<table class="table text-center">
				
					<thead class="table-dark">
						<th>No</th> <th>제 목</th> <th>작성자</th> <th>등록일</th> <th>조회수</th>
					</thead>
					
					<c:forEach items="${list}" var="vo">
					<tbody>
						<tr>
							<td>${vo.bno}</td>
							<td><a href="view.do?bno=${vo.bno}">${vo.btitle}</a></td>
							<td>${vo.uname}</td>
							<td>${vo.bwdate}</td>
							<td>${vo.bhit}</td>
						</tr>
					</tbody>
					</c:forEach>
					
					
				</table>
				
				<c:if test="${not empty login}">
				<button type="button" class="btn btn-light btn-outline-dark btn-sm">등록</button>
				</c:if>
				
				
				<!-- 페이징 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					  <li class="page-item ">
						<a class="page-link text-bg-dark" href="#" aria-label="Previous">
						  <span aria-hidden="true">&laquo;</span>
						</a>
					  </li>
					  <li class="page-item"><a class="page-link text-bg-light" href="#">1</a></li>
					  <li class="page-item"><a class="page-link text-bg-light" href="#">2</a></li>
					  <li class="page-item"><a class="page-link text-bg-light" href="#">3</a></li>
					  <li class="page-item">
						<a class="page-link text-bg-dark" href="#" aria-label="Next">
						  <span aria-hidden="true">&raquo;</span>
						</a>
					  </li>
					</ul>
				</nav>
			
			</div>
			
		</div>
		
		
		<!-- cut -->
		
		
		<button onclick="loadPage(1)">1</button>
		<button onclick="loadPage(2)">2</button>
		<button onclick="loadPage(3)">3</button>
		
		<div id="content"></div>
		
		<script>
		function loadPage(page) {
		  $.ajax({
		    url: "${pageUrl}",
		    type: "GET",
		    data: { page: page },
		    dataType: "json",
		    success: function(data) {
		      $("#content").html("");
		      for (var i = 0; i < data.length; i++) {
		        $("#content").append("<div>" + data[i].title + "</div>");
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log(xhr.responseText);
		    }
		  });
		}
		</script>
		
<%@ include file="../include/foot.jsp" %>