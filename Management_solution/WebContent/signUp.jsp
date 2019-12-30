<%@page import="modeler.ManagerEntitiy"%>
<%@page import="modeler.FindManagerId"%>
<%@page import="modeler.DataBaseModeler"%>
<%@page import="modeler.InsertManager"%>
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
  InsertManager insertManager=new InsertManager();
  FindManagerId finder=new FindManagerId();
  ManagerEntitiy forFind;
  
  forFind=finder.idFind(manager.getId());
  String webId=manager.getId();
  String dbId=forFind.getId();
  
  if(webId.equals(dbId)){  //아이디가 중복되는 경우 원래 페이지로 반환
	  %>
	    <script type="text/javascript">
	      if(!(alert("중복되는 아이디가 있습니다!"))){
	         document.location = 'signUp.html';
	      }
	    </script>
	  <%
  }
  else if(manager.getId()==null || manager.getPassword()==null ||
		  manager.getName()==null || manager.getAddress()==null){  //정보란을 작성하지 않는 경우 원래 페이지로 반환
	  %>
	    <script type="text/javascript">
	      if(!(alert("모든 양식을 작성하셔야 합니다!"))){
	         document.location = 'signUp.html';
	      }
	    </script>
	  <%
  } 
  else{
	  insertManager.insert(manager);       //폼으로 받은정보 DB에 삽입하고 signIn.html로 이동 
	  response.sendRedirect("login.jsp");
  }
  %>


</body>
</html>