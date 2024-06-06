<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flex Gym</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
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
                <a href="#" class="logo">Flex <span class="green-span">Gym</span></a>
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

    <div class="container">
        <div class="row">
            <div class="col-md-5 box-hero justify-content-center">
                <h2 class="hero-title">Where <span class="span-green">Passion</span><br>Builds <span class="span-green">Strength</span></h2>
                <p class="hero-text">Flex Gym isn't just about reps and sets; it's where we<br> ignite your passion for fitness and sculpt your <br>inner strength.</p>
                <div class="button-hero">
                	<form action="Controller" method="post">
                            <input type="hidden" name="action" value="offrePage">
                            <button type="submit" class="btn" style="background-color: #E7FE58; color: #000;">Check Offres</button>
                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/assets/lift.jpg" alt="hero-image" class="img-fluid" >
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row text-box">
            <div class="col-md text-content">
                <h2 class="feature-title">WHY CHOOSE US?</h2>
                <h6 class="feature-text">Explore our features , these are our key points we constantly work on.</h6>
            </div>
        </div>
        <div class="row">
            <div class="col-md">
                <div class="card">
                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/3.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Expert Coaching Team</h5>
                        <p class="card-text">Our experienced and certified coaches are dedicated to guiding and motivating you towards your fitness goals, providing personalized attention and support every step of the way.</p>
                    </div>
                </div>
            </div>
            <div class="col-md">
                <div class="card">
                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/gym.jpg"" alt="Card image cap" class="img-fluid">
                    <div class="card-body">
                        <h5 class="card-title">Cutting-Edge Equipment</h5>
                        <p class="card-text">Train with confidence using our state-of-the-art equipment, meticulously selected to cater to all fitness levels and workout preferences. From cardio machines to free weights, we have everything you need to achieve your desired results.</p>
                    </div>
                </div>
            </div>
            <div class="col-md">
                <div class="card">
                    <img class="card-img-top" src="${pageContext.request.contextPath}/assets/pc.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Secure Subscription Management</h5>
                        <p class="card-text">Access and manage your profile details and subscriptions securely through our website. Easily track subscription details, including renewal dates and starting dates, all protected by robust security measures.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/assets/1.jpg" alt="hero-image" class="img-fluid img-css" >
            </div>
            <div class="col-md-5 box-hero justify-content-center">
                <h2 class="hero-title">Join our<br><span class="span-green">Community</span></h2>
                <p class="hero-text">Join our dynamic community at FlexGym. Explore our facilities, meet our coaches, and enroll in our diverse courses. Find your perfect fit and start your fitness journey with us today!</p>
                <div class="button-hero">
	                <form action="Controller" method="post">
	                            <input type="hidden" name="action" value="courPage">
	                            <button type="submit" class="btn" style="background-color: #E7FE58; color: #000;">Check Courses</button>
	                 </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
