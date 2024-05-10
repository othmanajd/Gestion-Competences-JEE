package ma.ac.esi.referentielCompetences.controleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.referentielCompetences.model.ConnectDb;
import ma.ac.esi.referentielCompetences.model.User;

import java.io.IOException;

public class ChangePwdServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 User user = (User) request.getSession().getAttribute("User");
	     String oldPassword = request.getParameter("oldPassword");
	     String newPassword = request.getParameter("newPassword");
	     String connewPassword = request.getParameter("connewPassword");
	     if (!user.getPassword().equals(oldPassword)) {
	    	 response.sendRedirect("changePwd.jsp");
	         return;
	     }
	     if (!newPassword.equals(connewPassword)) {
	    	 response.sendRedirect("changePwd.jsp");
	    	 return;
	     }
	     user.setPassword(newPassword);
	     ConnectDb.updatePwdUser(user);
	     response.sendRedirect("profil.jsp");
	}

}
