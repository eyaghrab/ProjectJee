<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Matiere Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> Matiere Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/matiere/list" class="nav-link">Matieres</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/matiere/update" method="post">
                <caption>
                    <h2>Edit Matiere</h2>
                </caption>

                <input type="hidden" name="id" value="${matiere.id}"> <!-- Hidden field to store matiere ID -->

                <fieldset class="form-group">
                    <label>Matiere Name</label> 
                    <input type="text" class="form-control" name="name" value="${matiere.name}" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>ID Enseignant</label> 
                    <input type="number" class="form-control" name="idEnseignant" value="${matiere.idEnseignant}">
                </fieldset>

                <fieldset class="form-group">
                    <label>Number of Max</label> 
                    <input type="number" class="form-control" name="nbMax" value="${matiere.nbMax}">
                </fieldset>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
