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
.form-titre{
    background-color:#9ecbf8;
    border-radius: 6px;
    margin-top: 15px;
    
}
.form-titre h3{
    color: rgb(2, 28, 142);
    text-align: center;
    padding:10px 15px;
}
.form-titre form{
    width: auto;
    display: flex;
    flex-direction: column;
}


.form-titre form label{
    color: rgb(60, 60, 60);
    padding: 0 0 0 30px;
    font-weight: bold;
    font-size: large;
}
.form-titre form input{
    padding: 10px 5px 10px 5px;
    margin: 5px 25px;
    border-radius: 5px;
    border: none;
}
.form-titre form input:focus{
    outline: none;
    border: none;
}
.form-titre form input::placeholder {
    color: #2a2a2a; /* Changez la couleur selon votre choix */
}
#conpassword{
    margin: 0 25px;
    flex-direction: column;
}
.form-titre form button{
    background-color: rgb(37, 122, 234);
    margin: 7px 50px 10px 50px  ;
    padding: 10px 0;
    border-radius: 10px;
    color: azure;
    font-size: larger;
    border: none;
    text-align: center;
    
}
.form-titre form button:hover{
    background-color: azure;
    color: blue;
    border: 1px solid blue;
    font-size: larger;   
}
    </style>
</head>

<body>
    <nav class="navbar navbar-dark bg-primary displayright" style="width: 100%;">
        <a class="navbar-brand nav-link hoverEffect" href="competances.jsp"><i class="fas fa-list-ul"></i> Compétences</a>
        <a class="navbar-brand nav-link hoverEffect" href="categories.jsp?cate=  "><i class="fas fa-th-large"></i> Catégories</a>
        <a class="navbar-brand nav-link hoverEffect" href="profil.jsp"> <i class="fas fa-user"></i> Profil</a>
        <a class="navbar-brand nav-link hoverEffect" href="deconnexionServlet"><i class="fas fa-sign-out-alt"></i> Deconnexion</a>
    </nav>
    <div class="form-titre" style="top:25%">
        <h3 >Mettre à jour les informations</h3>
        <form action="EditInfoServlet" method="post">
            <label for="username">Nom d'utilisateur:</label>
            <input type="text" id="username" name="username" placeholder="Entrer votre nom..." value =<%= user.getName() %> required><br>
        
            <label for="email">Adresse e-mail:</label>
            <input type="email" id="email" name="email" placeholder="Entrer votre email..." value =<%= user.getEmail() %> required><br>
            <button type="submit">Mettre à jour</button>
        </form>
</div>
</body>
</html>
