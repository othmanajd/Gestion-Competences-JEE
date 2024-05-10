<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.User" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.ConnectDb" %>
<%@ page import="ma.ac.esi.referentielCompetences.model.Skill" %>

<%
    if(session.getAttribute("User") == null) {
        response.sendRedirect("index.jsp");
        return; // Correction: Utilisation de "return" au lieu de "rturn"
    }
    User user = (User)session.getAttribute("User"); // Correction: Cast de la session à User
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
    </style>
</head>

<body>
    <nav class="navbar navbar-dark bg-primary displayright">
        <a class="navbar-brand nav-link hoverEffect" href="#"><i class="fas fa-list-ul"></i> Compétences</a>
        <a class="navbar-brand nav-link hoverEffect" href="categories.jsp?cate=  "><i class="fas fa-th-large"></i> Catégories</a>
        <a class="navbar-brand nav-link hoverEffect" href="profil.jsp"> <i class="fas fa-user"></i> Profil</a>
        <a class="navbar-brand nav-link hoverEffect" href="deconnexionServlet"><i class="fas fa-sign-out-alt"></i> Deconnexion</a>
    </nav>
    <div class="mt-5">
        <h3 style="text-align: center; padding: 0 0 10px 0;">Liste des compétences</h3>
        <div style="text-align: center;">
            <a style="text-decoration: none;" href="ajouter.jsp"> <i class="fas fa-plus"></i> Ajouter une Compétence</a>
        </div>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Domaine</th>
                    <th>Niveau</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="skillsTableBody">
            <%
    List<Skill> skills = ConnectDb.getAllSkills();
    for(Skill skill : skills) {
%>
    <tr>
        <td><%= skill.getName() %></td>
        <td><%= skill.getDescription() %></td>
        <td><%= skill.getDomain() %></td>
        <td><%= skill.getLevel() %></td>
        <td>
            <div class="d-flex">
                <a style="margin-right: 10px;" href="edit.jsp?id=<%= skill.getId() %>" class="btn btn-primary btn-sm" role="button">
                       <i class="fas fa-edit"></i> Editer
                </a>
                <a href="#" class="btn btn-danger btn-sm" role="button" onclick="confirmDelete('<%= skill.getId() %>')">
                       <i class="fas fa-trash-alt"></i> Supprimer
                </a>
            </div>
        </td>
    </tr>
<%
    }
%>

            </tbody>
        </table>
    </div>
    
  <script>
    function confirmDelete(skillId) {
        var confirmation = confirm("Voulez-vous vraiment supprimer cette compétence ?");
        if (confirmation) {
            // Rediriger vers la page de suppression avec l'ID de la compétence
            window.location.href = "SupprimerSkillServlet?id=" + skillId;
        }
    }
</script>
</body>
</html>
