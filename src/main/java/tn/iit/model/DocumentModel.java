package tn.iit.model;
import java.util.Date;

public class DocumentModel {
    private int id;
    private byte[] pdfFile;
    private Date dateAjout;
    private Date dateFin;
    private int idEnseignant;
    private String nomMatiere;
    private int nbCopie;
    private boolean etat;

    // Constructors
    public DocumentModel() {
    }

    public DocumentModel(int id, byte[] pdfFile, Date dateAjout, Date dateFin, int idEnseignant, String nomMatiere, int nbCopie, boolean etat) {
        this.id = id;
        this.pdfFile = pdfFile;
        this.dateAjout = dateAjout;
        this.dateFin = dateFin;
        this.idEnseignant = idEnseignant;
        this.nomMatiere = nomMatiere;
        this.nbCopie = nbCopie;
        this.etat = etat;
    }
    
    public DocumentModel(byte[] pdfFile, Date dateAjout, Date dateFin, int idEnseignant, String nomMatiere, int nbCopie, boolean etat) {
        this.pdfFile = pdfFile;
        this.dateAjout = dateAjout;
        this.dateFin = dateFin;
        this.idEnseignant = idEnseignant;
        this.nomMatiere = nomMatiere;
        this.nbCopie = nbCopie;
        this.etat = etat;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(byte[] pdfFile) {
        this.pdfFile = pdfFile;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public int getIdEnseignant() {
        return idEnseignant;
    }

    public void setIdEnseignant(int idEnseignant) {
        this.idEnseignant = idEnseignant;
    }

    public String getNomMatiere() {
        return nomMatiere;
    }

    public void setNomMatiere(String nomMatiere) {
        this.nomMatiere = nomMatiere;
    }

    public int getNbCopie() {
        return nbCopie;
    }

    public void setNbCopie(int nbCopie) {
        this.nbCopie = nbCopie;
    }

    public boolean isEtat() {
        return etat;
    }

    public void setEtat(boolean etat) {
        this.etat = etat;
    }
}
