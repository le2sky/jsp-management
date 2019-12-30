<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<jsp:useBean id="deleteModeler" class="modeler.CrudModeler" scope="page"/>
	<body>
		<%
			String delete_keyword = request.getParameter("productName");
			try{
				deleteModeler.deleteRecord(delete_keyword);
				%>
				<script type="text/javascript">
					if(!alert("데이터를 성공적으로 삭제했습니다.")){
						document.location = './productList.jsp';
					}
				</script>			
				<%
			}
			catch(Exception e){
				e.printStackTrace();			
			}
		
		%>

	
	</body>	
</html>