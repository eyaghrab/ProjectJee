package tn.iit.model;


public class MatiereModel {
    private int id; // New field
    private String name;
    private int idEnseignant; // Changed idenseignat to camelCase
    private int nbMax; // Changed nmbmax to camelCase

    // Constructors
    public MatiereModel() {
        this.id = 0; // Default value for id
        this.name = "";
        this.idEnseignant = 0;
        this.nbMax = 0;
    }

    public MatiereModel(String name, int idEnseignant, int nbMax) {
        this.name = name;
        this.idEnseignant = idEnseignant;
        this.nbMax = nbMax;
    }

    public MatiereModel(int id, String name, int idEnseignant, int nbMax) {
        this.id = id;
        this.name = name;
        this.idEnseignant = idEnseignant;
        this.nbMax = nbMax;
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

    public int getIdEnseignant() {
        return idEnseignant;
    }

    public void setIdEnseignant(int idEnseignant) {
        this.idEnseignant = idEnseignant;
    }

    public int getNbMax() {
        return nbMax;
    }

    public void setNbMax(int nbMax) {
        this.nbMax = nbMax;
    }

    // Override toString method to include id
    @Override
    public String toString() {
        return "MatiereModel [id=" + id + ", name=" + name + ", idEnseignant=" + idEnseignant + ", nbMax=" + nbMax + "]";
    }
}
