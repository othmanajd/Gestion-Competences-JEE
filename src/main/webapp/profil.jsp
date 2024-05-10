<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ma.ac.esi.referentielCompetences.model.User" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.ConnectDb" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.Skill" %>

<%
    if(session.getAttribute("User") == null) {
        response.sendRedirect("index.jsp");
        return; // Correction: Utilisation de "return" au lieu de "rturn"
    }
    User user = (User)session.getAttribute("User");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .displayright {
            display: flex;
            justify-content: flex-end; /* Correction: Utilisation de "flex-end" au lieu de "right" */
        }
        .hoverEffect:hover {
            color: rgb(200, 205, 206);
        }
        
        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .profil{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            width: 350px;
            background-color: rgb(43, 117, 235);
            border-radius: 5px;
        }
        .hoverEdit:hover{
            background-color:transparent ;
            border: 2px solid rgb(23,162,184);
        }
        .hoverCh:hover{
            background-color:transparent ;
            border: 2px solid rgb(255,193,7);
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-dark bg-primary displayright" style="width: 100%;">
        <a class="navbar-brand nav-link hoverEffect" href="competances.jsp"><i class="fas fa-list-ul"></i> Compétences</a>
        <a class="navbar-brand nav-link hoverEffect" href="categories.jsp?cate=  "><i class="fas fa-th-large"></i> Catégories</a>
        <a class="navbar-brand nav-link hoverEffect" href="#"> <i class="fas fa-user"></i> Profil</a>
        <a class="navbar-brand nav-link hoverEffect" href="deconnexionServlet"><i class="fas fa-sign-out-alt"></i> Deconnexion</a>
    </nav>
    <div class="profil">
        <img src="profil.png" alt="" width="150px">
        <hr  style="color:rgb(252, 255, 255) ; width:325px; height: 10px;">
        <p style="color: white; font-size: large;">Nom : <%= user.getName() %></p>
        <p style="color: white; font-size: large;">Email : <%= user.getEmail() %></p>
        <p>
            <button type="button" class="btn btn-info hoverEdit" style="margin-right: 10px; color: white; padding: 5px 40px;" onclick="editInfo()">Edit</button>
            <button type="button" class="btn btn-warning hoverCh" style="padding: 5px 15px;color: white;" onclick="changePassword()">Changer Pwd</button>
        </p>
    </div>
    <script>
    function editInfo() {
        window.location.href = "editInfo.jsp"; // Redirection vers editInfo.jsp
    }
    function changePassword() {
        window.location.href = "changePwd.jsp"; // Redirection vers changePwd.jsp
    }
</script>
</body>
</html>