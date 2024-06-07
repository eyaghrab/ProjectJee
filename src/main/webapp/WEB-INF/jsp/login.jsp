<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/study.jpg');
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
            display: flex; /* Utiliser Flexbox pour positionner l'image et le formulaire côte à côte */
            align-items: center; /* Centrer verticalement les éléments dans le conteneur */
        }
        .login-container img {
            width: 80px; /* Définir la largeur de l'image */
            margin-right: 20px; /* Ajouter une marge à droite pour séparer l'image du formulaire */
        }
        .login-container form {
            width: 100%; /* Utiliser toute la largeur restante */
            text-align: left; /* Aligner le texte à gauche */
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container div {
            margin-bottom: 15px;
            text-align: left;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 22px); /* Calculer la largeur en soustrayant la largeur des bordures */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .login-container .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
          alt="Phone image">
        <form action="login" method="post">
            <h2>Login</h2>
            <div>
                <label>Email:</label>
                <input type="text" name="email" required>
            </div>
            <div>
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
            <div>
                <input type="submit" value="Login">
            </div>
            <div class="text-center mt-3">
    <a href="${pageContext.request.contextPath}/register">Don't have an account? Register here</a>
</div>
            <div class="error-message">
                <c:if test="${not empty errorMessage}">
                    <p>${errorMessage}</p>
                </c:if>
            </div>
        </form>
    </div>
</body>
</html>
