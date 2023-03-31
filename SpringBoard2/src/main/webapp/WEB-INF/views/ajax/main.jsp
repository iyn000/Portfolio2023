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
					url: "ex01.do", 				 //���� ��û�� ���� ������ > ��Ʈ�ѷ�
					type: "get", 					 //�޼ҵ�
					success: function(d){ 			 //data > �Ű�����(�ٲ� �� �ִ�)
						$("#result").html(d);		 //id�� result�� ���� �ִ´�
					},
					error:function(){
						alert("���ܹ߻�!!");
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
						alert("���ܹ߻�!!");
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
		
		<h2>Ajax ���� ������</h2>
		<button onclick="fn1()">1</button>
		<button onclick="fn2()">2</button>
		<button onclick="fn3()">3</button>

		<hr>
		
		<!-- 
			�˻� ��ư�� Ŭ�� �� �Է��� bno�� ��ġ�ϴ� �Խñ� ������ ajax�� ��ȸ�Ͽ� �Ʒ� div�� ����ϼ���
			��� ���� : bno, btitle, bnote, bkind, bwdate
			
			1. ��ư Ŭ���� �Լ��� ȣ���Ѵ�
			2. �Լ������� �Էµ� bno�� �����´�
			3. ã�� bno�� �Ķ���ͷ� �Ѱ� ajax ��û�Ѵ�
			4. controller������ bno�Ķ���Ϳ� ��ġ�ϴ� �Խñ��� ��ȸ�Ѵ�.
			5. ��ȸ�� ��ü�� return �Ѵ�. (jsckson�� �˾Ƽ� json �����ͷ� ��ȯ)
			6. success �޼ҵ忡���� ������� json�����͸� div�� ����Ѵ�.
			
		 -->
		<input type="number" name="bno" id="bno">
		<button onclick="findBoard()">�˻�</button>
		<script>
			function findBoard(){
				var bnoVal = $("#bno").val();
				$.ajax({
					url:"findBoard.do",
					type:"get",
					data:{bno:bnoVal}, //Ű : ��
					success:function(data){
						var html = "";
						html += "<table>"
						html += "<tr>"
						html += "<th>����</th>"
						html += "<th>"+data.btitle+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>����</th>"
						html += "<th>"+data.bkind+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>�ۼ���</th>"
						html += "<th>"+data.bwdate+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>�۹�ȣ</th>"
						html += "<th>"+data.bno+"</th>"
						html += "</tr>"
						html += "<tr>"
						html += "<th>����</th>"
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