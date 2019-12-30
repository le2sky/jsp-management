<%@page import="modeler.DataBaseModeler"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>dataBeseConnectiondTest</title>
	</head>
	<body>
		<h2>this page is databaseConnectionTestPage</h2>
		<hr>
		<p> If the connection is successful, will write 1, if not will write 0</p>
		<p>return :
		<%
			DataBaseModeler test = new DataBaseModeler();
			test.connect();
			test.disconnect();
			
		
		%>
		</p>
	</body>
</html>