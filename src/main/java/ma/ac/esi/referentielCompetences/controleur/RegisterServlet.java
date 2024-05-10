package ma.ac.esi.referentielCompetences.controleur;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.User;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String conpassword = request.getParameter("conpassword");
        if(!password.equals(conpassword)) {
        	response.sendRedirect("Inscription.html");
        }
        else {
            User newUser = new User(email,password , username );
            Boolean add=ConnectDb.addUser(newUser);
            if(add) {
            	request.setAttribute("message", "La compétence a été ajoutée avec succès.");
            }
            else{
            	request.setAttribute("erreur", "Erreur lors de l'ajout de la compétence.");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/SkillCrud.jsp");
            dispatcher.forward(request, response);
           
        }
    }
}
