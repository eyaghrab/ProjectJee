package tn.iit.dao;

import tn.iit.model.MatiereModel;
import tn.iit.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MatiereDAO {

    private static final String INSERT_MATIERE_SQL = "INSERT INTO matiere (name, idEnseignant, nbmax) VALUES (?, ?, ?);";
    private static final String SELECT_MATIERE_BY_ID = "SELECT name, idEnseignant, nbmax FROM matiere WHERE id = ?";
    private static final String SELECT_ALL_MATIERES = "SELECT * FROM matiere";
    private static final String DELETE_MATIERE_SQL = "DELETE FROM matiere WHERE id = ?";
    private static final String UPDATE_MATIERE_SQL = "UPDATE matiere SET name = ?, idEnseignant = ?, nbmax = ? WHERE id = ?";

    public MatiereDAO() {
    }

    public void insertMatiere(MatiereModel matiere) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MATIERE_SQL)) {
            preparedStatement.setString(1, matiere.getName());
            preparedStatement.setInt(2, matiere.getIdEnseignant());
            preparedStatement.setInt(3, matiere.getNbMax());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    }

    public MatiereModel selectMatiere(int id) {
        MatiereModel matiere = null;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MATIERE_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                int idEnseignant = rs.getInt("idEnseignant");
                int nbMax = rs.getInt("nbmax");
                matiere = new MatiereModel(id, name, idEnseignant, nbMax);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return matiere;
    }

    public List<MatiereModel> selectAllMatieres() {
        List<MatiereModel> matieres = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MATIERES);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int idEnseignant = rs.getInt("idEnseignant");
                int nbMax = rs.getInt("nbmax");
                MatiereModel matiere = new MatiereModel(id, name, idEnseignant, nbMax);
                matieres.add(matiere);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return matieres;
    }

    public boolean deleteMatiere(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MATIERE_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateMatiere(MatiereModel matiere) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_MATIERE_SQL)) {
            statement.setString(1, matiere.getName());
            statement.setInt(2, matiere.getIdEnseignant());
            statement.setInt(3, matiere.getNbMax());
            statement.setInt(4, matiere.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
