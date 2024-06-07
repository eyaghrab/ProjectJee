<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.model.MatiereModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Matiere Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        header {
            margin-bottom: 20px;
        }
        .navbar-custom {
            background: linear-gradient(45deg, #1d2b64, #f8cdda); /* Gradient background */
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
            color: #ffdd57; /* Yellow text on hover */
        }
        .navbar-custom .navbar-brand:hover {
            color: #f8cdda; /* Pinkish text on hover */
        }
        .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.1);
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
        <a class="navbar-brand" href="#">IIT Application</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/matiere/list">Matieres</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/list">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Déconnexion</a>
                </li>
                
            </ul>
        </div>
    </nav>
</header>
<div class="container">
    <div class="table-container">
        <h3 class="text-center">List of Matieres</h3>
        <hr>
        <div class="text-left mb-3">
            <a href="${pageContext.request.contextPath}/matiere/new" class="btn btn-success">Add New Matiere</a>
        </div>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>ID Enseignant</th>
                    <th>Number of Max</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<MatiereModel> listMatieres = (List<MatiereModel>) request.getAttribute("listMatieres");
                    if (listMatieres != null) {
                        for (MatiereModel matiere : listMatieres) {
                %>
                <tr>
                    <td><%= matiere.getId() %></td>
                    <td><%= matiere.getName() %></td>
                    <td><%= matiere.getIdEnseignant() %></td>
                    <td><%= matiere.getNbMax() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/matiere/edit?id=<%= matiere.getId() %>" class="btn btn-primary">Edit</a>
                        <a href="<%= request.getContextPath() %>/matiere/delete?id=<%= matiere.getId() %>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No matieres found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa8lqj/6aHprIQlbjP4l7nP4j" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyhzJ8ZZ6SmFOFTbI1wWR3fqDmEnKyoeG2iCtpA" crossorigin="anonymous"></script>
</body>
</html>
