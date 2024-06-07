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
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> Document Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/document/list" class="nav-link">Documents</a></li>
            <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Déconnexion</a>
                </li>
        </ul>
    </nav>
</header>
<br>
<div class="container">
    <h3 class="text-center">List of Documents</h3>
    <hr>
    <div class="container text-left">
        <a href="${pageContext.request.contextPath}/document/new" class="btn btn-success">Add New Document</a>
    </div>
    <br>
    <table class="table table-bordered">
        <thead>
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
                    <a href="<%= request.getContextPath() %>/upload/<%= document.getPdfFile() %>" class="btn btn-info" download><%= document.getPdfFile() %></a>
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
                <td colspan="9">No documents found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
