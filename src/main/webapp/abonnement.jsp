<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
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
    <h1>Liste des abonnements</h1>
</div>

<!-- Table Abonnement -->
<div class="table-container">
    <table class="striped-table">
        <thead>
            <tr>
                <th scope="col">ID Abonnement</th>
                <th scope="col">État</th>
                <th scope="col">Propriétaire</th>
                <th scope="col">Date de début</th>
                <th scope="col">Date de fin</th>
                <th scope="col">Offre</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the list of abonnements and populate table rows -->
            <c:forEach var="abonnement" items="${abonnements}">
                <tr>
                    <td>${abonnement.abonnementId}</td>
                    <td class="${abonnement.abonnementEtat == 1 ? 'active-green' : 'inactive-red'}">${abonnement.abonnementEtat == 1 ? 'Active' : 'Expired'}</td>                    
                    <td>${abonnement.abonnementProp}</td>
                    <td>${abonnement.debutDate}</td>
                    <td>${abonnement.finDate}</td>
                    <td>${abonnement.offre.offreNom}</td>
                    <td>
                        <form action="Controller" method="post">
                            <input type="hidden" name="action" value="deleteAbonnement">
                            <input type="hidden" name="abonnementId" value="${abonnement.abonnementId}">
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
<!-- Modal for adding an abonnement -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="Controller" method="post">
					<button type="button" class="btn-close btn-close-white btn-custom" data-bs-dismiss="modal" aria-label="Close"></button>
                    <h1 class="modal-title" id="exampleModalLabel">Ajouter un abonnement</h1>

                <div class="modal-body">
                    <input type="hidden" name="action" value="createAbonnement">
                    <div class="input-group">
                        <span class="input-group-text">État</span>
                        <input type="text" class="form-control" id="abonnementEtat" name="abonnementEtat" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Propriétaire</span>
                        <input type="text" class="form-control" id="abonnementProp" name="abonnementProp" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Date de début</span>
                        <input type="date" class="form-control" id="debutDate" name="debutDate" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Date de fin</span>
                        <input type="date" class="form-control" id="finDate" name="finDate" required>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Offre</span>
                        <select class="form-select" id="abonnementType" name="abonnementType">
                            <c:forEach var="offre" items="${offres}">
                                <option value="${offre.offreId}">${offre.offreNom}</option>
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
<!-- Modal for editing an abonnement -->
<div class="modal fade" id="modifierModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="Controller" method="post" id="modifierForm">
                    <button type="button" class="btn-close btn-close-white btn-custom" data-bs-dismiss="modal" aria-label="Close"></button>
                    <h1 class="modal-title" id="modifierModalLabel">Modifier abonnement</h1>
                <div class="modal-body">
                    <input type="hidden" id="abonnementIdInput" name="abonnementId">
                    <input type="hidden" name="action" value="updateAbonnement"> <!-- Added -->
                    <div class="input-group ">
                        <span class="input-group-text">État</span>
                        <input type="text" class="form-control" id="abonnementEtatInput" name="abonnementEtat" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Propriétaire</span>
                        <input type="text" class="form-control" id="abonnementPropInput" name="abonnementProp" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Date de début</span>
                        <input type="date" class="form-control" id="debutDateInput" name="debutDate" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Date de fin</span>
                        <input type="date" class="form-control" id="finDateInput" name="finDate" required>
                    </div>
                    <div class="input-group ">
                        <span class="input-group-text">Offre</span>
                        <select class="form-select" id="abonnementTypeInput" name="abonnementType">
                            <c:forEach var="offre" items="${offres}">
                                <option value="${offre.offreId}">${offre.offreNom}</option>
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
        const cells = row.cells;
        const abonnementId = cells[0].textContent;
        const abonnementEtat = cells[1].textContent;
        const abonnementProp = cells[2].textContent;
        const debutDate = cells[3].textContent;
        const finDate = cells[4].textContent;
        const offre = cells[5].textContent;

        document.getElementById('abonnementIdInput').value = abonnementId;
        document.getElementById('abonnementEtatInput').value = abonnementEtat;
        document.getElementById('abonnementPropInput').value = abonnementProp;
        document.getElementById('debutDateInput').value = debutDate;
        document.getElementById('finDateInput').value = finDate;
        
        // Populate the dropdown/select element for the offre attribute
        const offreSelect = document.getElementById('abonnementTypeInput');
        Array.from(offreSelect.options).forEach(option => {
            if (option.text === offre) {
                option.selected = true;
            }
        });
    }
</script>
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>