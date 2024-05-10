package ma.ac.esi.referentielCompetences.controleur;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.ac.esi.referentielCompetences.model.ConnectDb;

public class SupprimerSkillServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String skillId = request.getParameter("id");
            
            int id = Integer.parseInt(skillId);
            ConnectDb.supprimerSkill(id);
            response.sendRedirect("competances.jsp");
        
    }
}
