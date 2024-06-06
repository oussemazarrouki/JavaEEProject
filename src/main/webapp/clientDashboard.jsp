<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Client Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/client.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<c:set var="clientEmail" value="${requestScope.clientEmail}" />
<c:set var="clientPassword" value="${requestScope.clientPassword}" />
<!--  Admin Header -->
<header class="container-fluid">
    <div class="row align-items-center">
        <div class="col-md-auto">
            <a href="#" class="logo">Flex <span class="green-span">Gym</span></a>
        </div>
        <div class="col-md">
            
        </div>
        <div class="col-md-auto">
            <a class="sign-in" href="#">
                <a href="${pageContext.request.contextPath}/home.jsp"><button class="btn" style="color:#000;background-color:#E7FE58" >Sign Out </button></a>
            </a>
        </div>
    </div>
</header>

<div class="row text-box">
    <div class="col-md text-content">
        <h2 class="feature-title">Welcome, ${clientNom}</h2>
        <h6 class="feature-text">View your personalized client dashboard for secure access to your information, subscriptions, and account settings.</h6>
    </div>
</div>


<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-md-12">
                <div class="card user-card-full">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-block">
                                <h5 class="card-title">Information</h5>
                                <div class="card-info">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Nom</p>
                                            <h6 class="f-w-400 text-muted">${clientNom}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Prenom</p>
                                            <h6 class="f-w-400 text-muted">${clientPrenom}</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Date de naissance</p>
                                            <h6 class="f-w-400 text-muted">${clientDatenais}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Phone</p>
                                            <h6 class="f-w-400 text-muted">${clientTel}</h6>
                                        </div>
                                    </div>
                                </div>
                                <h5 class="card-title">Security</h5>
                                <div class="card-info">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Email</p>
                                            <h6 class="text-muted f-w-400">${clientEmail}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">Password</p>
                                            <h6 class="text-muted f-w-400">${clientPass}</h6>
                                        </div>
                                    </div>
                                </div>
                                <h5 class="card-title">Subscription</h5>
                                <c:forEach var="row" items="${abonnements}">
                                    <div class="card-info">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Name</p>
                                                <h6 class="text-muted f-w-400">${row.offre.offreNom}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Status</p>
                                                <h6 class="f-w-400 ${row.abonnementEtat == 1 ? 'active-green' : 'inactive-red'}">
                                                    ${row.abonnementEtat == 1 ? 'Active' : 'Expired'}
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Date debut </p>
                                                <h6 class="text-muted f-w-400">${row.debutDate}</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Date d'expiration</p>
                                                <h6 class="text-muted f-w-400">${row.finDate}</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
