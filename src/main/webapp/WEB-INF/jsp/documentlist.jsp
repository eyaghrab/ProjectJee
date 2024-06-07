<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.model.DocumentModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        header {
            margin-bottom: 20px;
        }
        .navbar-custom {
            background-color: #007bff; /* Couleur de fond de la navbar */
            color: white;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: white;
            font-weight: bold;
        }
        .navbar-custom .nav-link {
            margin-right: 15px;
        }
        .navbar-custom .nav-link:hover {
            color: #0056b3; /* Couleur au survol */
        }
        .navbar-custom .navbar-brand:hover {
            color: #e9ecef; /* Couleur au survol */
        }
        .navbar-toggler {
            border-color: white; /* Couleur de la bordure du bouton de menu déroulant */
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%2877, 77, 77, 0.5%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary,
        .btn-danger {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: black;">
        <a href="#" class="navbar-brand">IIT Application</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/document/list" class="nav-link">Documents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Déconnexion</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="container mt-4">
    <h3 class="text-center">List of Documents</h3>
    <hr>
    <div class="mb-3 text-right">
        <a href="${pageContext.request.contextPath}/document/new" class="btn btn-success">Add New Document</a>
    </div>
    <div id="documentTable">
        <table class="table table-hover table-striped">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date Ajout</th>
                <th>Date Fin</th>
                <th>ID Enseignant</th>
                <th>Nombre de Copies</th>
                <th>Etat</th>
                <th>PDF File</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
                <% 
                    List<DocumentModel> listDocuments = (List<DocumentModel>) request.getAttribute("listDocuments");
                    if (listDocuments != null && !listDocuments.isEmpty()) {
                        for (DocumentModel document : listDocuments) {
                %>
                <tr>
                    <td><%= document.getId() %></td>
                    <td><%= document.getNomMatiere() %></td>
                    <td><%= document.getDateAjout() %></td>
                    <td><%= document.getDateFin() %></td>
                    <td><%= document.getIdEnseignant() %></td>
                    <td><%= document.getNbCopie() %></td>
                    <td><%= document.isEtat() ? "Active" : "Inactive" %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/upload/<%= document.getPdfFile() %>" class="btn btn-info" download>Download</a>
                    </td>
                    <td>
                        <a href="<%= request.getContextPath() %>/document/edit?id=<%= document.getId() %>" class="btn btn-primary">Edit</a>
                        <a href="<%= request.getContextPath() %>/document/delete?id=<%= document.getId() %>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="9" class="text-center">No documents found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaD5LQ17m9ZZTtx4xI5o5hjU8" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyhzJ8ZZ6SmFOFTbI1wWR3fqDmEnKyoeG2iCtpA" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        // Your JavaScript code here
        // You can refer to the table using 'this'
        $('#documentTable').DataTable();
    });
</script>
</body>
</html>
