<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>Offre</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/offre.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
    /* CSS for buttons */
    .btn-css {
        border: none;
        background: none;
        padding: 0;
        font: inherit;
        cursor: pointer;
        outline: inherit;
        text-decoration: none;
        color: white;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-css:hover {
        color: #F3FF95;
    }
</style>
</head>
<body>
	<header class="container-fluid header-css">
        <div class="row align-items-center header-content">
            <div class="col-md-auto">
                <a href="${pageContext.request.contextPath}/home.jsp" class="logo">Flex <span class="green-span">Gym</span></a>
            </div>
            <div class="col-md">
                <nav class="text-center">
                    <ul class="nav-links">
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="courPage">
                            <button type="submit" class="btn btn-css " >Cours</button>
                        </form>
                        </li>
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="offrePage">
                            <button type="submit" class="btn btn-css " >Offre</button>
                        </form>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-auto buttons">
                <div class="col-md-auto buttons">
                    <a class="sign-in" href="${pageContext.request.contextPath}/login.jsp"><button type="button" class="btn" style="background-color: #E7FE58; color: #000;">Log In</button></a>
                </div>
            </div>
        </div>
    </header>
	
	<div class="row text-box">
    <div class="col-md text-content">
        <h2 class="feature-title">DISCOVER OUR OFFERS</h2>
        <h6 class="feature-text">Explore tailored offers and pricing for your fitness goals.</h6>
    </div>
</div>
<div class="row cards">
    <c:forEach var="offre" items="${offres}">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title mt-4">${offre.offreNom}</h4>
                    <p class="card-price">$${offre.offrePrix}<span class="month">/Month</span></p>
                    <p class="card-text description mb-4">${offre.offreDetail}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
	
</body>
</html>