<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<jsp:useBean id="updateModeler" class="modeler.CrudModeler" scope="page"/>
	<%
		String p_name = request.getParameter("productName");
		int p_price = new Integer(request.getParameter("productPrice")).intValue();
		int p_stock = new Integer(request.getParameter("stockCount")).intValue();
		
		
		if(p_name == null){
			%>
			<script type="text/javascript">
				alert('null');
			</script>
			<% 
		}
		
		else{
			try{
				updateModeler.updateRecord(p_name, p_price, p_stock);
			%>
			<script type="text/javascript">
				if(!alert("데이터를 성공적으로 수정했습니다.")){
					document.location = './productList.jsp';
				}
			</script>		
			<% 
			}
			catch(Exception e){
			}
		
		}	
	
	%>
	


	
	</body>
</html>