<%@page import="modeler.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin page</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="./css/productList.css">
</head>
<body>
	<%
	  if(session.getAttribute("id")==null){
		  %>
		    <script type="text/javascript">
		      if(!(alert("로그인을 먼저 해주세요!"))){
		         document.location = 'signIn.html';
		      }
		    </script>
		  <%
	  }
	%>
	<jsp:useBean id="productList" class="modeler.ProductListModeler" scope="page" />
    <div class="container">
        <header>
            <div class="product-logo">
                <a href="index.html"><img class="logo-S" src="./img/logo.png" alt="logo"></a>
            </div>
            <h1 class="product-h1">product list.</h1>
            <div  class="member-wrap">
                <div>
                    <div>
                        <span class="input-label">STORE</span>
                        <span class="manager-info"><%= session.getAttribute("address")%></span>
                    </div>
                    <div>
                        <span class="input-label">MANAGER</span>
                        <span class="manager-info"><%= session.getAttribute("name") %></span>
                    </div>
                </div>
                <a href="logOut.jsp">
                    <button class="logout-button">LOGOUT</button>
                </a>
            </div>
        </header>
        <article>
            <div class="search-wrap">
                <form action="productList.jsp" method="get" autocomplete="off">
                    <div>
                        <input  name="searchValue" type="text">
                        <button  class="search-button" type="submit">search</button>
                    </div>
                </form>
            </div>
            <div>
                <div class="tbl-header">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <th>product name</th>
                                <th>price ($)</th>
                                <th>stock</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="tbl-content">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                        <%
                        	ArrayList<Product> list;
                        	String searchValue = request.getParameter("searchValue");
                        	if((searchValue == null) || (searchValue.equals("ALL")) || searchValue.equals("all")){
                        		list = productList.getAllList();
                        	}
                        	else {
                        		list = productList.getFindList(searchValue);
                        	}
                        	int counter = list.size();
                        	if(counter > 0){
                        		for (Product p : list){
                        %>
                            <tr>
                                <th><%= p.getProductName() %></th>
                                <th><%= p.getProductPrice() %></th>
                                <th><%= p.getStockCount() %></th>
                            </tr>
						                 
                        <%
                        		}
                        	}
                        
                        
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div>
                <div><span class="label">go to</span><a href="./createProduct.jsp">create product.</a></div>
                <div><span class="label">go to</span><a href="./updateProduct.jsp">update product.</a></div>
                <div><span class="label">go to</span><a href="./deleteProduct.jsp">delete product.</a></div>
            </div>
        </article>
        <footer>
            <span>Copyright 2019 . Narciss . All rights reserved</span>
        </footer>
    </div>
</body>
</html>