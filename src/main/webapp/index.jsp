<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <style>
body{
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center;
    background-color: #f1f1f1;
}
.form-titre{
    background-color:#9ecbf8;
    border-radius: 6px;
    margin: 25px 0 0 0;
    
}
.form-titre h1{
    color: rgb(2, 28, 142);
    text-align: center;
}
.form-titre form{
    width: 350px;
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
}
.form-titre form button{
    background-color: rgb(37, 122, 234);
    margin: 7px 50px 10px 50px  ;
    padding: 10px 0;
    border-radius: 10px;
    color: azure;
    font-size: larger;
    border: none;
}
.form-titre form button:hover{
    background-color: azure;
    color: blue;
    border: 1px solid blue;
    font-size: larger;   
}
a{
    text-decoration: none;
}
p{
	margin: 0 0 10px 30px;
}
    </style>
</head>
<body>
    <div class="form-titre" style="top: 20%;">
        <h1>Connexion</h1>
        <form action="ServletController" method="post">
            <label for="email">Adresse e-mail:</label>
            <input type="email" id="email" name="email" placeholder="Entrer votre email..." required><br>
        
            <label for="password">Mot de passe:</label>
            <input type="password" id="password" name="password" placeholder="Entrer votre mot de psse..."required><br>
            <label for="show-password">
                <input type="checkbox" id="show-password"> Afficher le mot de passe
            </label>
            <button type="submit">Connexion</button>
        </form>
        <p>vous n'avez pas de compte <a href="Inscription.jsp">click ici</a></p>
</div>
<script>
    document.getElementById('show-password').addEventListener('change', function() {
    var passwordInput = document.getElementById('password');
    if (this.checked) {
        passwordInput.type = 'text';
    } else {
        passwordInput.type = 'password';
        
    }
});
</script>
</body>
</html>
