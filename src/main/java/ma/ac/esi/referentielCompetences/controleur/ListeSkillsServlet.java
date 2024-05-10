package ma.ac.esi.referentielCompetences.controleur;

import java.io.IOException;
import java.util.List;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.Skill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListeSkillsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Skill> skills;
        try {
            skills = ConnectDb.getAllSkills();

            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.append("[");
            for (Skill skill : skills) {
                jsonBuilder.append("{");
                jsonBuilder.append("\"name\":\"").append(skill.getName()).append("\",");
                jsonBuilder.append("\"description\":\"").append(skill.getDescription()).append("\",");
                jsonBuilder.append("\"domain\":\"").append(skill.getDomain()).append("\",");
                jsonBuilder.append("\"level\":\"").append(skill.getLevel()).append("\"");
                jsonBuilder.append("},");
            }
            if (!skills.isEmpty()) {
                jsonBuilder.deleteCharAt(jsonBuilder.length() - 1);
            }
            jsonBuilder.append("]");

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonBuilder.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
