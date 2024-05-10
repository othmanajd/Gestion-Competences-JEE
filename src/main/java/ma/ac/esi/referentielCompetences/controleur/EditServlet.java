package ma.ac.esi.referentielCompetences.controleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.Skill;

import java.io.IOException;

public class EditServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	        int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        String description = request.getParameter("description");
	        String level = request.getParameter("level");
	        String domain = request.getParameter("domain");
	        
	       
	        Skill updatedSkill = new Skill(id, name, description, domain, level);
	        
	        
	        ConnectDb.updateSkill(updatedSkill);
	        response.sendRedirect("competances.jsp");
	     

	}
}
