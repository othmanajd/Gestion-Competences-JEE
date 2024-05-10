package ma.ac.esi.referentielCompetences.model;

public class User {
	 private int id;
	    private String email;
	    private String password;
	    private String name;

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public User(int id, String email, String password, String name) {
			super();
			this.id = id;
			this.email = email;
			this.password = password;
			this.name = name;
		}

		public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public User(String email, String password, String name) {
	        this.email = email;
	        this.password = password;
	        this.name = name;
	    }

	    public User(String email, String password) {
	        this.email = email;
	        this.password = password;
	    }



	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }
}
