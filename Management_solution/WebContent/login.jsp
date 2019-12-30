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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="./css/sign.css">
</head>
<body>

	<%
		if (session.getAttribute("id") != null){
		%>
			<script type="text/javascript">
				document.location = 'productList.jsp';
			</script>		
		
		<%
		}
	%>
	

    <div class="container">
        <header>
            <a href="index.html"><img class="logo-M" src="./img/logo.png" alt="logo"></a>
            <h1>SIGN IN.</h1>
        </header>
        <article>
            <form action="signIn.jsp" method="post" autocomplete="off">
                <div>
                    <div><span class="input-label">ID</span></div>
                    <input type="text" placeholder="ID" name="id">
                </div>
                <div>
                    <div><span class="input-label">PASSWORD</span></div>
                    <input type="password" placeholder="PASSWORD" name="password">
                </div>
                <a href="./productList.jsp"><button>SIGN IN</button></a>
                <div><a href="#">Forgot password?</a></div>
                <div><span class="label">Don't have an account?</span><a href="./signUp.html">SIGN UP.</a></div>
            </form>
        </article>
        <footer>
            <span>Copyright 2019 . Narciss . All rights reserved</span>
        </footer>
    </div>
</body>
</html>