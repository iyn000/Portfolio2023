<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>게시글 작성</h2>
		<form name="frm" action="write.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th align="right">제목</th>
					<td><input type="text" name="btitle"></td>
				</tr>
				<tr>
					<th align="right">종류</th>
					<td>
						<input type="radio" name="bkind" value="J">J
						<input type="radio" name="bkind" value="H">H
					</td>
				</tr>
				<tr>
					<th align="right">내용</th>
					<td><textarea name="bnote"></textarea></td>
				</tr>
				<tr>
					<th align="right">파일 업로드</th>
					<td><input type="file" name="file" name="uploadFile"></td>
				</tr>
			
				
			</table>
			<button>저장</button>
		</form>
		<!-- 저장버튼 클릭시 입력 된 모든 값을 콘솔에 출력 후 list페이지로 이동 -->
	</body>
</html>