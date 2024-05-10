package ma.ac.esi.referentielCompetences.controleur;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.User;

public class ServletController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session=request.getSession();

        String email = request.getParameter("email"); 
        String password = request.getParameter("password");
        User user = ConnectDb.findUser(email, password); 

        if (user != null) {
        	session.setAttribute("User",user);
            response.sendRedirect("competances.jsp");
        } else {
        	response.sendRedirect("index.jsp");
        }
    }
}
