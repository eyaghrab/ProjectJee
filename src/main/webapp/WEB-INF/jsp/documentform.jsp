<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: black;">
        <div class="container">
            <a href="#" class="navbar-brand">IIT Application</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/document/list" class="nav-link">List Documents</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h2 class="text-center">Add New Document</h2>
        </div>
        <div class="card-body">
            <form action="insert" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="nomMatiere">Nom Matière</label>
                    <input type="text" class="form-control" id="nomMatiere" name="nomMatiere" required>
                </div>
                <div class="form-group">
                    <label for="idEnseignant">ID Enseignant</label>
                    <input type="text" class="form-control" id="idEnseignant" name="idEnseignant" required>
                </div>
                <div class="form-group">
                    <label for="nbCopie">Number of Copies</label>
                    <input type="number" class="form-control" id="nbCopie" name="nbCopie">
                </div>
                <div class="form-group">
                    <label for="etat">Etat</label>
                    <select class="form-control" id="etat" name="etat">
                        <option value="true">True</option>
                        <option value="false">False</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dateFin">Date Fin</label>
                    <input type="date" class="form-control" id="dateFin" name="dateFin">
                </div>
                <div class="form-group">
                    <label for="pdfFile">PDF File</label>
                    <input type="file" class="form-control-file" id="pdfFile" name="pdfFile" accept=".pdf" required>
                </div>
                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
