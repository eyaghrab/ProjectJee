package tn.iit.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import tn.iit.dao.MatiereDAO;
import tn.iit.model.MatiereModel;

@WebServlet("/matiere/*")
public class MatiereServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MatiereDAO matiereDAO;

    public void init() {
        matiereDAO = new MatiereDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertMatiere(request, response);
                    break;
                case "/delete":
                    deleteMatiere(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateMatiere(request, response);
                    break;
                default:
                    listMatieres(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listMatieres(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<MatiereModel> listMatieres = matiereDAO.selectAllMatieres();

        request.setAttribute("listMatieres", listMatieres);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/matierelist.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/matiereform.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        MatiereModel existingMatiere = matiereDAO.selectMatiere(id);
        request.setAttribute("matiere", existingMatiere); // Set the existing matiere as an attribute in the request
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/matiereedit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertMatiere(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        int idEnseignant = Integer.parseInt(request.getParameter("idEnseignant"));
        int nbMax = Integer.parseInt(request.getParameter("nbMax"));

        MatiereModel newMatiere = new MatiereModel(name, idEnseignant, nbMax);
        matiereDAO.insertMatiere(newMatiere);
        response.sendRedirect(request.getContextPath() + "/matiere/list");
    }

    private void updateMatiere(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int idEnseignant = Integer.parseInt(request.getParameter("idEnseignant"));
        int nbMax = Integer.parseInt(request.getParameter("nbMax"));

        MatiereModel matiere = new MatiereModel(id, name, idEnseignant, nbMax);
        matiereDAO.updateMatiere(matiere);
        response.sendRedirect(request.getContextPath() + "/matiere/list");
    }

    private void deleteMatiere(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        matiereDAO.deleteMatiere(id);
        response.sendRedirect(request.getContextPath() + "/matiere/list");
    }
}
