package tn.iit.dao;

import tn.iit.model.UtilisateurModel;
import tn.iit.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAO {
    private static final String INSERT_USERS_SQL = "INSERT INTO utilisateur (name, lastName, email, role, password) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT name, lastName, email, role FROM utilisateur WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM utilisateur";
    private static final String DELETE_USERS_SQL = "DELETE FROM utilisateur WHERE id = ?";
    private static final String UPDATE_USERS_SQL = "UPDATE utilisateur SET name = ?, lastName = ?, email = ?, role = ? WHERE id = ?";

    public void insertUser(UtilisateurModel user) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
    }

    public UtilisateurModel selectUser(int id) {
        UtilisateurModel user = null;
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String role = rs.getString("role");
                user = new UtilisateurModel(id, name, lastName, email, role, null);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return user;
    }

    public List<UtilisateurModel> selectAllUsers() {
        List<UtilisateurModel> users = new ArrayList<>();
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS); 
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String role = rs.getString("role");
                String password = rs.getString("password");
                UtilisateurModel user = new UtilisateurModel(id, name, lastName, email, role, password);
                users.add(user);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        }
    }

    public boolean updateUser(UtilisateurModel user) throws SQLException {
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getRole());
            statement.setInt(5, user.getId());
            return statement.executeUpdate() > 0;
        }
    }

    public UtilisateurModel loginUser(String email, String password) {
        UtilisateurModel user = null;
        try (Connection connection = JDBCUtils.getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM utilisateur WHERE email = ? AND password = ?")) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String lastName = rs.getString("lastName");
                String role = rs.getString("role");
                user = new UtilisateurModel(id, name, lastName, email, role, password);
            }
        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }
        return user;
    }
}
