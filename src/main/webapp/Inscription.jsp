<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
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
    margin: 10px;
    border-radius: 6px;
    
}
.form-titre h1{
    color: rgb(2, 28, 142);
    padding-left: 120px;
    margin: 0px;
}
.form-titre form{
    width: 400px;
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
    padding: 5px 5px 5px 5px;
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
    margin: 7px 50px 5px 50px  ;
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
    </style>
</head>
<body>
    <div class="form-titre">
        <h1>Inscription</h1>
        <form action="RegisterServlet" method="post">
            <label for="username">Nom d'utilisateur:</label>
            <input type="text" id="username" name="username" placeholder="Entrer votre nom..." required><br>
        
            <label for="email">Adresse e-mail:</label>
            <input type="email" id="email" name="email" placeholder="Entrer votre email..." required><br>
        
            <label for="password">Mot de passe:</label>
            <input type="password" id="password" name="password" placeholder="Entrer votre mot de psse..."required><br>

            <label for="conpassword">Confirmer Mot de passe:</label>
            <input type="password" id="conpassword" name="conpassword" placeholder="confirmer votre nom..." required><br>

            <label for="show-password">
                <input type="checkbox" id="show-password"> Afficher le mot de passe
            </label>
            <button type="submit">S'inscrire</button>
        </form>
</div>
<script >
    document.getElementById('show-password').addEventListener('change', function() {
    var passwordInput = document.getElementById('password');
    var conpasswordInput = document.getElementById('conpassword');
    if (this.checked) {
        passwordInput.type = 'text';
        conpasswordInput.type='text';
        connewPassword.type='text';
        newPassword.type='text';
        oldPassword.type='text';
    } else {
        passwordInput.type = 'password';
        conpasswordInput.type='password';
        connewPassword.type = 'password';
        newPassword.type = 'password';
        oldPassword.type = 'password';
    }
});
</script>
</body>
</html>
