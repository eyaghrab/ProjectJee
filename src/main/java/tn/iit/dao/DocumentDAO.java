package tn.iit.dao;

import tn.iit.model.DocumentModel;
import tn.iit.utils.JDBCUtils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocumentDAO {

    private static final String INSERT_DOCUMENT_SQL = "INSERT INTO document (pdfFile, dateAjout, dateFin, idEnseignant, nomMatiere, nbCopie, etat) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_DOCUMENT_BY_ID = "SELECT id, pdfFile, dateAjout, dateFin, idEnseignant, nomMatiere, nbCopie, etat FROM document WHERE id = ?";
    private static final String SELECT_ALL_DOCUMENTS = "SELECT * FROM document";
    private static final String DELETE_DOCUMENT_SQL = "DELETE FROM document WHERE id = ?";
    private static final String UPDATE_DOCUMENT_SQL = "UPDATE document SET pdfFile = ?, dateAjout = ?, dateFin = ?, idEnseignant = ?, nomMatiere = ?, nbCopie = ?, etat = ? WHERE id = ?";

    public DocumentDAO() {
    }

    public void insertDocument(DocumentModel document) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DOCUMENT_SQL)) {
            preparedStatement.setBytes(1, document.getPdfFile());
            preparedStatement.setDate(2, new java.sql.Date(document.getDateAjout().getTime()));
            preparedStatement.setDate(3, new java.sql.Date(document.getDateFin().getTime()));
            preparedStatement.setInt(4, document.getIdEnseignant());
            preparedStatement.setString(5, document.getNomMatiere());
            preparedStatement.setInt(6, document.getNbCopie());
            preparedStatement.setBoolean(7, document.isEtat());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    }

    public DocumentModel selectDocument(int id) {
        DocumentModel document = null;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DOCUMENT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                byte[] pdfFile = rs.getBytes("pdfFile");
                java.util.Date dateAjout = rs.getDate("dateAjout");
                java.util.Date dateFin = rs.getDate("dateFin");
                int idEnseignant = rs.getInt("idEnseignant");
                String nomMatiere = rs.getString("nomMatiere");
                int nbCopie = rs.getInt("nbCopie");
                boolean etat = rs.getBoolean("etat");
                document = new DocumentModel(id, pdfFile, dateAjout, dateFin, idEnseignant, nomMatiere, nbCopie, etat);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return document;
    }

    public List<DocumentModel> selectAllDocuments() {
        List<DocumentModel> documents = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DOCUMENTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                byte[] pdfFile = rs.getBytes("pdfFile");
                java.util.Date dateAjout = rs.getDate("dateAjout");
                java.util.Date dateFin = rs.getDate("dateFin");
                int idEnseignant = rs.getInt("idEnseignant");
                String nomMatiere = rs.getString("nomMatiere");
                int nbCopie = rs.getInt("nbCopie");
                boolean etat = rs.getBoolean("etat");
                DocumentModel document = new DocumentModel(id, pdfFile, dateAjout, dateFin, idEnseignant, nomMatiere, nbCopie, etat);
                documents.add(document);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return documents;
    }

    public boolean deleteDocument(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_DOCUMENT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateDocument(DocumentModel document) throws SQLException {
        boolean rowUpdated = false; // Initialize the variable
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_DOCUMENT_SQL)) {
            statement.setBytes(1, document.getPdfFile());
            statement.setDate(2, new java.sql.Date(document.getDateAjout().getTime()));
            statement.setDate(3, new java.sql.Date(document.getDateFin().getTime()));
            statement.setInt(4, document.getIdEnseignant());
            statement.setString(5, document.getNomMatiere());
            statement.setInt(6, document.getNbCopie());
            statement.setBoolean(7, document.isEtat());
            statement.setInt(8, document.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return rowUpdated;
    }
}
