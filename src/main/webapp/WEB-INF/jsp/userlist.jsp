<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tn.iit.model.UtilisateurModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Print Management Application</title>
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
    <nav class="navbar navbar-expand-lg navbar-custom">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/list">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/matiere/list">Matieres</a>
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
        <h3 class="text-center">List of Users</h3>
        <hr>
        <div class="text-left mb-3">
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New User</a>
        </div>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<UtilisateurModel> listUser = (List<UtilisateurModel>) request.getAttribute("listUser");
                    if (listUser != null) {
                        for (UtilisateurModel user : listUser) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getLastName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getRole() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/edit?id=<%= user.getId() %>" class="btn btn-primary">Edit</a>
                        <a href="<%= request.getContextPath() %>/delete?id=<%= user.getId() %>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No users found.</td>
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
