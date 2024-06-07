package tn.iit.model;

public class UtilisateurModel {
    private int id; // New field
    private String name;
    private String lastName;
    private String email;
    private String role;
    private String password;

    // Constructors
    public UtilisateurModel() {
        this.id = 0; // Default value for id
        this.name = "";
        this.lastName = "";
        this.email = "";
        this.role = "";
        this.password = "";
    }

    public UtilisateurModel(String name, String lastName, String email, String role, String password) {
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
        this.password = password;
    }
    public UtilisateurModel(int id,String name, String lastName, String email, String role, String password) {
    	 this.id = id;
    	this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
        this.password = password;
    }
    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Override toString method to include id
    @Override
    public String toString() {
        return "UtilisateurModel [id=" + id + ", name=" + name + ", lastName=" + lastName + ", email=" + email
                + ", role=" + role + ", password=" + password + "]";
    }
}
