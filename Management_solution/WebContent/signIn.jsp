<%@page import="modeler.FindManagerId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="manager" class="modeler.ManagerEntitiy" scope="page">
  <jsp:setProperty property="*" name="manager"/>
</jsp:useBean>
<%

  FindManagerId login = new FindManagerId();
  String webId=request.getParameter("id");
  String webPassword=request.getParameter("password");
  manager=login.idFind(webId);		//db에 singIn.html에서 입력한 id가 있는지 찾아 ManagerEntitiy객체로 반환
    
  if(webId.equals(manager.getId())){
	  if(manager.getPassword().equals(webPassword)){         //아이디와 비밀번호 체크 후 세션에 저장 그리고 productList.jsp로 이동
		  session.setAttribute("id", webId);
		  session.setAttribute("password", webPassword);	//아이디가 없거나 비밀번호가 틀릴시 signIn.html로 다시 이동
		  session.setAttribute("address", manager.getAddress());
		  session.setAttribute("name", manager.getName());
		  session.setMaxInactiveInterval(60*10);
		  response.sendRedirect("productList.jsp");
	  } else{
		  %>
		    <script type="text/javascript">
		      if(!(alert("아이디 및 비밀번호를 확인하세요!"))){
		         document.location = 'login.jsp';
		      }
		    </script>
		  <%
	  }
  } else {
	  %>
	    <script type="text/javascript">
	      if(!(alert("아이디 및 비밀번호를 확인하세요!"))){
	         document.location = 'login.jsp';
	      }
	    </script>
	  <%
  }
%>

</body>
</html>