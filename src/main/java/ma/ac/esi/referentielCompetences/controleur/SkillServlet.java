package ma.ac.esi.referentielCompetences.controleur;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.Skill;

public class SkillServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String level = request.getParameter("level");
        String domain = request.getParameter("domain");
        Skill skill=new Skill(name,description,level,domain);
        Boolean add= ConnectDb.addSkill(skill);
        if(add) {
        	request.setAttribute("message", "La compétence a été ajoutée avec succès.");
        }
        else{
        	request.setAttribute("erreur", "Erreur lors de l'ajout de la compétence.");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("competances.jsp");
        dispatcher.forward(request, response);
    }
}


