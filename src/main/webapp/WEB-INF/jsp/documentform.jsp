<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> Document Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/document/list" class="nav-link">Back to Documents</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="insert" method="post" enctype="multipart/form-data">
                <caption>
                    <h2>Add New Document</h2>
                </caption>

                <fieldset class="form-group">
                    <label>Nom Matiere</label>
                    <input type="text" class="form-control" name="nomMatiere" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>ID Enseignant</label>
                    <input type="text" class="form-control" name="idEnseignant" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Number of Copies</label>
                    <input type="text" class="form-control" name="nbCopie">
                </fieldset>

                <fieldset class="form-group">
                    <label>Etat</label>
                    <select class="form-control" name="etat">
                        <option value="true">True</option>
                        <option value="false">False</option>
                    </select>
                </fieldset>

                <fieldset class="form-group">
                    <label>Date Fin</label>
                    <input type="date" class="form-control" name="dateFin">
                </fieldset>

                <fieldset class="form-group">
                    <label>PDF File</label>
                    <input type="file" class="form-control-file" name="pdfFile" accept=".pdf" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
