<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>Client Admin</title>
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
	<!--CLIENT-->
<!-- Table title -->
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
<div class="text-center table-title">
    <h1>Liste des clients</h1>
</div>

<!-- Table Client -->
<div class="table-container">
    <table class="striped-table">
        <thead>
            <tr>
                <th scope="col">ID Client</th>
                <th scope="col">Nom</th>
                <th scope="col">Prénom</th>
                <th scope="col">Date de Naissance</th>
                <th scope="col">Email</th>
                <th scope="col">Téléphone</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the list of clients and populate table rows -->
            <c:forEach var="client" items="${clients}">
                <tr>
                    <td>${client.clientId}</td>
                    <td>${client.clientNom}</td>
                    <td>${client.clientPrenom}</td>
                    <td>${client.clientDatenais}</td>
                    <td>${client.clientEmail}</td>
                    <td>${client.clientTel}</td>
                    <td>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="deleteClient">
                            <input type="hidden" name="clientId" value="${client.clientId}">
                            <button type="submit" class="btn annuler-btn" style="color:#DC3545;background-color:#000">Supprimer</button>
                        </form>
                        <button class="btn" style="color:#E7FE58;background-color:#000" data-bs-toggle="modal" data-bs-target="#modifierModal" onclick="populateForm(this.closest('tr'))">Modifier</button>
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
                    <h1 class="modal-title" id="exampleModalLabel">Ajouter un client</h1>
                <div class="modal-body">
                    <input type="hidden" name="action" value="createClient">
                    <div class="input-group ">
                        <span class="input-group-text">Nom</span>
                        <input type="text" class="form-control" id="clientNom" name="clientNom" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Prénom</span>
                        <input type="text" class="form-control" id="clientPrenom" name="clientPrenom" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Date de Naissance</span>
                        <input type="date" class="form-control" id="clientDatenais" name="clientDatenais" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Email</span>
                        <input type="email" class="form-control" id="clientEmail" name="clientEmail" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Téléphone</span>
                        <input type="tel" class="form-control" id="clientTel" name="clientTel" required>
                    </div>
                    <div class="d-grid">
                    	<button type="submit" class="btn modal-button">Ajouter</button>
                	</div>
                </div>
                
            </form>
        </div>
    </div>
</div>
<!-- Modal for editing a client -->
<div class="modal fade" id="modifierModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="Controller" method="post" id="modifierForm">
                    <button type="button" class="btn-close btn-close-white btn-custom" data-bs-dismiss="modal" aria-label="Close"></button>
                    <h1 class="modal-title" id="modifierModalLabel">Modifier client</h1>
                <div class="modal-body">
                    <input type="hidden" id="clientIdInput" name="clientId">
                    <input type="hidden" name="action" value="updateClient"> <!-- Added -->
                    <div class="input-group mb-3">
                        <span class="input-group-text">Nom</span>
                        <input type="text" class="form-control" id="clientNomInput" name="clientNom" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Prénom</span>
                        <input type="text" class="form-control" id="clientPrenomInput" name="clientPrenom" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Date de Naissance</span>
                        <input type="date" class="form-control" id="clientDatenaisInput" name="clientDatenais" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Email</span>
                        <input type="email" class="form-control" id="clientEmailInput" name="clientEmail" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Téléphone</span>
                        <input type="tel" class="form-control" id="clientTelInput" name="clientTel" required>
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
        const cells = row.cells;
        const clientId = cells[0].textContent;
        const clientNom = cells[1].textContent;
        const clientPrenom = cells[2].textContent;
        const clientDatenais = cells[3].textContent;
        const clientEmail = cells[4].textContent;
        const clientTel = cells[5].textContent;

        document.getElementById('clientIdInput').value = clientId;
        document.getElementById('clientNomInput').value = clientNom;
        document.getElementById('clientPrenomInput').value = clientPrenom;
        document.getElementById('clientDatenaisInput').value = clientDatenais;
        document.getElementById('clientEmailInput').value = clientEmail;
        document.getElementById('clientTelInput').value = clientTel;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>