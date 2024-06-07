<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
            display: flex; /* Utiliser Flexbox pour positionner l'image et le formulaire côte à côte */
            align-items: center; /* Centrer verticalement les éléments dans le conteneur */
        }
        .register-container img {
            width: 100px; /* Taille de l'image */
            margin-right: 20px; /* Ajouter une marge à droite pour séparer l'image du formulaire */
        }
    </style>
</head>
<body>
<div class="register-container">
  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
          alt="Phone image">    <div>
        <h2 class="text-center">Register</h2>
        <form action="${pageContext.request.contextPath}/registerUser" method="post">
            <div class="form-group">
                <label for="name">First Name</label>
                <input type="text" class="form-control" name="name" required="required">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" name="lastName" required="required">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" required="required">
            </div>
             <div class="form-group">
                <label for="role">Role</label>
                <input type="role" class="form-control" name="role" required="required">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" required="required">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">Already have an account? Login</a>
        </div>
    </div>
</div>
</body>
</html>
