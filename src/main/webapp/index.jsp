<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Offre Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
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

<!--  Admin Header -->
<header class="container-fluid">
    <div class="row align-items-center">
        <div class="col-md-auto">
            <a href="#" class="logo">Flex <span class="green-span">Gym</span></a>
        </div>
        <div class="col-md">
            <nav class="text-center">
                <ul class="nav-links">
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="adminCour">
                            <button type="submit" class="btn btn-css " >Cour</button>
                        </form>
                        </li>
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="adminClient">
                            <button type="submit" class="btn btn-css " >Client</button>
                        </form>
                        </li>
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="adminAbonnement">
                            <button type="submit" class="btn btn-css " >Abonnement</button>
                        </form>
                        </li>
                        <li>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="adminOffre">
                            <button type="submit" class="btn btn-css " >Offre</button>
                        </form>
                        </li>
                    </ul>
            </nav>
        </div>
        <div class="col-md-auto">
            <a class="sign-in" href="${pageContext.request.contextPath}/home.jsp">
                <button class="btn" style="color:#000;background-color:#E7FE58" >Sign Out </button>
            </a>
        </div>
    </div>
</header>

<!-- Table title -->
<div class="text-center table-title">
    <h1>Liste des offres</h1>
</div>

<!-- Table Offre -->
<div class="table-container">
	
    <table class="striped-table">
        <thead>
            <tr>
                <th scope="col">offreID</th>
                <th scope="col">offreNom</th>
                <th scope="col">Detailoffre</th>
                <th scope="col">Cours</th>
                <th scope="col">Prixoffre</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the list of offers and populate table rows -->
            <c:forEach var="offre" items="${offres}">
                <tr>
                    <td>${offre.offreId}</td>
                    <td>${offre.offreNom}</td>
                    <td>${offre.offreDetail}</td>
                    <td>${offre.cour.courNom}</td>
                    <td>${offre.offrePrix}</td>
                    <td>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="offreId" value="${offre.offreId}">
                            <button type="submit" class="btn annuler-btn" style="color:#DC3545;background-color:#000">Annuler</button>
                        </form>
                        <button type="button" class="btn" style="color:#E7FE58;background-color:#000" data-bs-toggle="modal" data-bs-target="#modifierModal" onclick="populateForm(this.closest('tr'))">Modifier</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="button-container" style="display: flex;justify-content: flex-end;margin-top: 10px;">
        <!-- Modal Button -->
        <button type="button" class="btn " style="background-color: #E7FE58;margin-top: 20px;" data-bs-toggle="modal" data-bs-target="#exampleModal">Ajouter</button>
    </div>
    
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="Controller" method="post">
       				<button type="button" class="btn-close btn-close-white btn-custom" data-bs-dismiss="modal" aria-label="Close"></button>
                    <h1 class="modal-title" id="exampleModalLabel">Ajouter une offre</h1>

                <div class="modal-body">
                    <input type="hidden" name="action" value="create">
                    <div class="input-group">
                        <span class="input-group-text">Nom Offre</span>
                        <input type="text" class="form-control" id="offreNom" name="offreNom" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Detail Offre</span>
                        <input type="text" class="form-control" id="offreDetail" name="offreDetail" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Prix Offre</span>
                        <input type="text" class="form-control" id="offrePrix" name="offrePrix" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Cours</span>
                        <select class="form-select" id="offreCour" name="offreCour">
                            <c:forEach var="cour" items="${cours}">
                                <option value="${cour.courId}" >${cour.courNom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="d-grid">
                    	<button type="submit" class="btn modal-button">Ajouter</button>
                	</div>
                </div>
                
            </form>
        </div>
    </div>
</div>

<!-- Modal for editing an offer -->
<div class="modal fade" id="modifierModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="Controller" method="post" id="modifierForm">
                    <button type="button" class="btn-close btn-close-white btn-custom" data-bs-dismiss="modal" aria-label="Close"></button>
                    <h1 class="modal-title" id="modifierModalLabel">Modifier offre</h1>
                <div class="modal-body">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="offreIdInput" name="offreId">
                    <div class="input-group ">
                        <span class="input-group-text">Nom Offre</span>
                        <input type="text" class="form-control" id="nomOffreInput" name="offreNom" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Detail Offre</span>
                        <input type="text" class="form-control" id="detailOffreInput" name="offreDetail" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Prix Offre</span>
                        <input type="text" class="form-control" id="prixOffreInput" name="offrePrix" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Cours</span>
                        <select class="form-select"  name="offreCour">
                            <c:forEach var="cour" items="${cours}">
                                <option id="modifierCourInput" value="${cour.courId}">${cour.courNom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="d-grid">
                    	<button type="submit" class="btn modal-button">Modifier</button>
                	</div>
                </div>
               
            </form>
        </div>
    </div>
</div>

<script>
function populateForm(row) {
    document.getElementById("offreIdInput").value = row.children[0].textContent;
    document.getElementById("nomOffreInput").value = row.children[1].textContent;
    document.getElementById("detailOffreInput").value = row.children[2].textContent;
    document.getElementById("prixOffreInput").value = row.children[4].textContent;
    
    var coursName = row.children[3].textContent;
    var select = document.getElementById("modifierForm").querySelector("select[name='offreCour']");
    
    for (var i = 0; i < select.options.length; i++) {
        if (select.options[i].text === coursName) {
            select.selectedIndex = i;
            break;
        }
    }
}

</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
