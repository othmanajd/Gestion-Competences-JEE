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
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center;
    background-color: #f1f1f1;
    flex-direction: column;
    align-items: center;
}
.form-creer-competence{
    background-color:#9ecbf8;
    border-radius: 6px;
    margin: 5px ;
    width:auto;
}
.form-creer-competence h1{
    color: rgb(2, 28, 142);
     text-align: center;
    padding: 0 25px; 
}

.form-creer-competence form{
    width: auto;
    display: flex;
    flex-direction: column;
}
.form-creer-competence input{
    padding: 5px 5px 5px 5px;
    margin: 5px 25px;
    border-radius: 5px;
    border: none;
}
.form-creer-competence textarea{
    padding: 5px 5px 5px 5px;
    margin: 5px 25px;
    border-radius: 5px;
    border: none;
}

.form-creer-competence select{
    padding: 10px 5px 10px 5px;
    margin: 5px 25px;
    border-radius: 5px;
    border: none;
}
.form-creer-competence label{
    color: rgb(60, 60, 60);
    padding: 0 0 0 30px;
    font-weight: bold;
    font-size: large;
}
.form-creer-competence input:focus{
    outline: none;
    border: none;
}
.form-creer-competence  textarea:focus{
    outline: none;
    border: none;
}
.form-creer-competence  select:focus{
    outline: none;
    border: none;
}
.form-creer-competence form button{
    background-color: rgb(37, 122, 234);
    margin: 5px 50px 10px 50px  ;
    padding: 5px 0;
    border-radius: 10px;
    color: azure;
    font-size: larger;
    border: none;
}
.form-creer-competence button:hover{
    background-color: azure;
    color: blue;
    border: 1px solid blue;
    font-size: larger;   
}
#successAlert {
 position: fixed;
 top: 20%;
 left: 50%;
 transform: translateX(-50%);
 z-index: 1050;
 display: none; /* Cachée par défaut */
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
    <div class="form-creer-competence">
        <h1>Ajouter une competence</h1>
        <form action="SkillServlet" method="post">
            <label for="name">Nom de la competence:</label>
            <input type="text" id="name" name="name" required><br>
        
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br>
        
            <label for="level">Niveau requis:</label>
            <select id="level" name="level">
				<option ></option>
                <option value="Debutant">Debutant</option>
                <option value="Intermadiaire">Intermediaire</option>
                <option value="Avance">Avance</option>
            </select><br>
        
            <label for="domain">Domaine:</label>
            <select id="domain" name="domain">
				<option ></option>
                <option value="Sciences de donnees">Sciences de donnees</option>
                <option value="Securite">Securite</option>
                 <option value="Statistiques">Statistiques</option>
            </select><br>
        
            <button type="submit">Ajoute</button>
        </form>
    </div>
</body>
</html>