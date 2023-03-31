<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"> </script>
		<script>
			function fn1(){
				$.ajax({
					url: "ex01.do", 				 //어디로 요청을 보낼 것인지 > 컨트롤러
					type: "get", 					 //메소드
					success: function(d){ 			 //data > 매개변수(바꿀 수 있다)
						$("#result").html(d);		 //id가 result인 곳에 넣는다
					},
					error:function(){
						alert("예외발생!!");
					}
					
				});
			}
			
			
			function fn2(){
				$.ajax({
					url: "ex02.do",
					type: "get",
					data:{data1:1},
					success:function(data){
						$("#result").html(data);
					},
					error:function(){
						alert("예외발생!!");
					}
					
				});
			}
			
			
			function fn3(){
				$.ajax({
					url:"ex03.do",
					success:function(data){
						console.log(data);
						//var jsonData = JSON.parse(data);
						//console.log(jsonData);
					}
				});
			}
			
			
			
		</script>
	</head>
	<body>
		
		<h2>Ajax 샘플 페이지</h2>
		<button onclick="fn1()">1</button>
		<button onclick="fn2()">2</button>
		<button onclick="fn3()">3</button>

		<hr>
		
		<!-- 
			검색 버튼을 클릭 시 입력한 bno와 일치하는 게시글 정보는 ajax로 조회하여 아래 div에 출력하세요
			출력 정보 : bno, btitle, bnote, bkind, bwdate
			
			1. 버튼 클릭시 함수를 호출한다
			2. 함수에서는 입력된 bno를 가져온다
			3. 찾은 bno를 파라미터로 넘겨 ajax 요청한다
			4. controller에서는 bno파라미터와 일치하는 게시글을 조회한다.
			5. 조회한 객체를 return 한다. (jsckson이 알아서 json 데이터로 변환)
			6. success 메소드에서는 응답받은 json데이터를 div에 출력한다.
			
		 -->
		<input type="number" name="bno" id="bno">
		<button onclick="findBoard()">검색</button>
		<script>
			function findBoard(){
				var bnoVal = $("#bno").val();
				$.ajax({
					url:"findBoard.do",
					type:"get",
					data:{bno:bnoVal}, //키 : 값
					success:function(data){
						var html = "";
						html += "<table>"
						html += "<tr>"
						html += "<th>제목</th>"
						html += "<th>"+data.btitle+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>종류</th>"
						html += "<th>"+data.bkind+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>작성일</th>"
						html += "<th>"+data.bwdate+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>글번호</th>"
						html += "<th>"+data.bno+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>내용</th>"
						html += "<th>"+data.bnote+"</th>"
						html += "</tr>"

						html += "</table>"
						
						$("#result").html(html);
					}
				});
				
			}
		</script>
		
		<div id="result"></div>
	</body>
</html>