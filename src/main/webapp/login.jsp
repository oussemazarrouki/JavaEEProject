<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Login - Flex Gym</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="login-background">
    <header class="container-fluid">
        <div class="row align-items-center">
            <div class="col">
                <a href="${pageContext.request.contextPath}/home.jsp" class="logo">Flex <span class="green-span">Gym</span></a>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="text-center title">
                        <h1>Login</h1>
                        <h6>Please enter email and password</h6>
                    </div>
                    <form action="Controller" method="post">
                        <div class="input-class">
                          <label for="email" class="form-label">Email address</label>
                          <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                          <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="input-class">
                          <label for="pass" class="form-label">Password</label>
                          <input type="password" class="form-control" id="pass" name="password">
                        </div>
                        <c:if test="${not empty errorMessage}">
	                        <p style="color:red">${errorMessage}</p>
                    	</c:if>
                        <div class="d-grid">
                          <button type="submit" name="action" value="login" class="btn btn-custom">Submit</button>
                        </div>
                      </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
