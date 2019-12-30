<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  session.setAttribute("id", null);
  session.setAttribute("password", null);
  session.setAttribute("name", null);
  session.setAttribute("address", null);
  session.setMaxInactiveInterval(0);
  response.sendRedirect("index.html");
%>
</body>
</html>