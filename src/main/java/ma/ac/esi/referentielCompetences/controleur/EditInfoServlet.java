package ma.ac.esi.referentielCompetences.controleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.User;

import java.io.IOException;

public class EditInfoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        User user = (User) request.getSession().getAttribute("User");
        user.setName(username);
        user.setEmail(email);
        ConnectDb.updateUser(user);
        response.sendRedirect("profil.jsp");
	}
        
}
