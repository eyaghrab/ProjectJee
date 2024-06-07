<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.model.DocumentModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato;">
        <a href="#" class="navbar-brand">Document Management App</a>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaD5LQ17m9ZZTtx4xI5o5hjU8" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-jjSmVgyd0p3pXB1rRibZUAYoIIyknpRdDtbR4EdP7Cjo2MekpD7v7Syzg4u65rGx" crossorigin="anonymous"></script>
</body>
</html>
