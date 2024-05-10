package ma.ac.esi.referentielCompetences.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ConnectDb {
    private static final String URL = "jdbc:mysql://localhost:3306/competency_framework";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static User findUser(String email, String password) {
        User user = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            String query = "SELECT * FROM Users WHERE email= ? AND password = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // User found, create User object
                user = new User( resultSet.getInt("id"), resultSet.getString("email"), resultSet.getString("password"),resultSet.getString("username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        return user;
    }

    public static Boolean addSkill(Skill skill) {
        String sql = "INSERT INTO skills (name, description, domain, level) VALUES(?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, skill.getName());
            pstmt.setString(2, skill.getDescription());
            pstmt.setString(3, skill.getDomain());
            pstmt.setString(4, skill.getLevel());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static Boolean addUser(User user) {
    	Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
 
            connection = getConnection();
            String sql = "INSERT INTO Users (username, email, password) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.executeUpdate();
            return true;
        } catch (Exception e) {
            
            e.printStackTrace();
        } 
        return false;
        }
    public static List<Skill> getSkillsCatecorie(String categorie) {
        List<Skill> skills = new ArrayList<>();
        String cate = "%" + categorie + "%"; // Ajoutez les caractères génériques de pourcentage
        String sql = "SELECT * FROM skills WHERE domain LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cate);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Skill skill = new Skill();
                    skill.setId(rs.getInt("id"));
                    skill.setName(rs.getString("name"));
                    skill.setDescription(rs.getString("description"));
                    skill.setDomain(rs.getString("domain"));
                    skill.setLevel(rs.getString("level"));
                    skills.add(skill);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skills;
    }

    public static List<String> getAllDomains() {
        List<String> domains = new ArrayList<>();
        String sql = "SELECT DISTINCT domain FROM skills";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                String domain = rs.getString("domain");
                domains.add(domain);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return domains;
    }
        public static List<Skill> getAllSkills() {
        	 List<Skill> skills = new ArrayList<>();
        	 String sql = "SELECT * FROM skills";
        	 try (Connection conn = getConnection();
        	 Statement stmt = conn.createStatement();

        	 ResultSet rs = stmt.executeQuery(sql)) {
        	 while (rs.next()) {
        	 Skill skill = new Skill();
        	 skill.setId(rs.getInt("id"));
        	 skill.setName(rs.getString("name"));
        	 skill.setDescription(rs.getString("description"));
        	 skill.setDomain(rs.getString("domain"));
        	 skill.setLevel(rs.getString("level"));
        	 skills.add(skill);
        	 }
        	 } catch (SQLException e) {
        	 e.printStackTrace();
        	 }
        	 return skills;
        	 }
        public static void supprimerSkill(int id) {
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            try {
                connection = getConnection();
                String sql = "DELETE FROM skills WHERE id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        public static Skill getSkill(int id) {
            Skill skill = null;
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                connection = getConnection();
                String sql = "SELECT * FROM skills WHERE id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    skill = new Skill();
                    skill.setId(resultSet.getInt("id"));
                    skill.setName(resultSet.getString("name"));
                    skill.setDescription(resultSet.getString("description"));
                    skill.setDomain(resultSet.getString("domain"));
                    skill.setLevel(resultSet.getString("level"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return skill;
        }
        public static void updateSkill(Skill skill) {
            try  {
            	Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement("UPDATE skills SET name = ?, description = ?, domain = ?, level = ? WHERE id = ?");
                pstmt.setString(1, skill.getName());
                pstmt.setString(2, skill.getDescription());
                pstmt.setString(3, skill.getDomain());
                pstmt.setString(4, skill.getLevel());
                pstmt.setInt(5, skill.getId());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        public static void updateUser(User user) {
        	Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
            	conn = getConnection();
                String sql = "UPDATE users SET name = ?, email = ? WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getEmail());
                stmt.setInt(3, user.getId()); 
                stmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        public static void updatePwdUser(User user) {
        	 Connection conn = null;
             PreparedStatement stmt = null;
             
             try {
                 conn = getConnection(); 
                 String sql = "UPDATE users SET password = ? WHERE id = ?";
                 stmt = conn.prepareStatement(sql);
                 stmt.setString(1, user.getPassword());
                 stmt.setInt(2, user.getId());
                 stmt.executeUpdate();
             } catch (Exception e) {
                 e.printStackTrace();
             } 
     }

        

   
    
    	
    
}
