<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Print Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: black;">
        <div>
            <a href="#" class="navbar-brand"> IIT Application </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/update" method="post">
                <caption>
                    <h2>Edit User</h2>
                </caption>

                <input type="hidden" name="id" value="${user.id}"> <!-- Hidden field to store user ID -->

                <fieldset class="form-group">
                    <label>User Name</label> 
                    <input type="text" class="form-control" name="name" value="${user.name}" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Last Name</label> 
                    <input type="text" class="form-control" name="lastName" value="${user.lastName}">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Email</label> 
                    <input type="email" class="form-control" name="email" value="${user.email}">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Role</label> 
                    <input type="text" class="form-control" name="role" value="${user.role}">
                </fieldset>

              

                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
