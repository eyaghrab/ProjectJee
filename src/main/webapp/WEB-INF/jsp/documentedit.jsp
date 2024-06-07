<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <li><a href="<%=request.getContextPath()%>/document/list" class="nav-link">Documents</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/document/update" method="post" enctype="multipart/form-data">
                <caption>
                    <h2>Edit Document</h2>
                </caption>

                <input type="hidden" name="id" value="${document.id}"> <!-- Hidden field to store document ID -->

                <fieldset class="form-group">
                    <label>Matiere Name</label> 
                    <input type="text" class="form-control" name="nomMatiere" value="${document.nomMatiere}" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>ID Enseignant</label> 
                    <input type="number" class="form-control" name="idEnseignant" value="${document.idEnseignant}">
                </fieldset>

                <fieldset class="form-group">
                    <label>Number of Copies</label> 
                    <input type="number" class="form-control" name="nbCopie" value="${document.nbCopie}">
                </fieldset>

                <fieldset class="form-group">
                    <label>Date Fin</label> 
                    <input type="date" class="form-control" name="dateFin" value="${document.dateFin}">
                </fieldset>

                <fieldset class="form-group">
                    <label>File</label> 
                    <input type="file" class="form-control" name="pdfFile">
                </fieldset>

                <fieldset class="form-group">
                    <label>Etat</label> 
                    <input type="checkbox" class="form-check-input" name="etat" <c:if test="${document.etat}">checked</c:if>>
                </fieldset>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
