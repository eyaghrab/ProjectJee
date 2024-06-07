package tn.iit.web;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import tn.iit.dao.DocumentDAO;
import tn.iit.model.DocumentModel;

@WebServlet("/document/*")
@MultipartConfig
public class DocumentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DocumentDAO documentDAO;

    public void init() {
        documentDAO = new DocumentDAO();
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
                    insertDocument(request, response);
                    break;
                case "/delete":
                    deleteDocument(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateDocument(request, response);
                    break;
                case "/list":
                    listDocuments(request, response);
                    break;
                default:
                    listDocuments(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/documentform.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        DocumentModel existingDocument = documentDAO.selectDocument(id);
        request.setAttribute("document", existingDocument);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/documentedit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertDocument(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String nomMatiere = request.getParameter("nomMatiere");
        int idEnseignant = Integer.parseInt(request.getParameter("idEnseignant"));
        int nbCopie = Integer.parseInt(request.getParameter("nbCopie"));
        boolean etat = Boolean.parseBoolean(request.getParameter("etat"));
        String dateFinString = request.getParameter("dateFin");
        Date dateFin = null;
        if (dateFinString != null && !dateFinString.isEmpty()) {
            try {
                dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Part filePart = request.getPart("pdfFile");
        InputStream inputStream = filePart.getInputStream();

        try {
            byte[] pdfFile = inputStream.readAllBytes();
            DocumentModel newDocument = new DocumentModel(pdfFile, new Date(), dateFin, idEnseignant, nomMatiere, nbCopie, etat);
            documentDAO.insertDocument(newDocument);
            response.sendRedirect(request.getContextPath() + "/document/list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error uploading file: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        } finally {
            inputStream.close();
        }
    }

    private void updateDocument(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nomMatiere = request.getParameter("nomMatiere");
        int idEnseignant = Integer.parseInt(request.getParameter("idEnseignant"));
        int nbCopie = Integer.parseInt(request.getParameter("nbCopie"));
        boolean etat = Boolean.parseBoolean(request.getParameter("etat"));
        String dateFinString = request.getParameter("dateFin");
        Date dateFin = null;
        if (dateFinString != null && !dateFinString.isEmpty()) {
            try {
                dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Part filePart = request.getPart("pdfFile");
        InputStream inputStream = filePart.getInputStream();

        try {
            byte[] pdfFile = inputStream.readAllBytes();
            DocumentModel document = new DocumentModel(id, pdfFile, new Date(), dateFin, idEnseignant, nomMatiere, nbCopie, etat);
            documentDAO.updateDocument(document);
            response.sendRedirect(request.getContextPath() + "/document/list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error uploading file: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        } finally {
            inputStream.close();
        }
    }

    private void deleteDocument(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            documentDAO.deleteDocument(id);
            response.sendRedirect(request.getContextPath() + "/document/list");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting document: " + e.getMessage());
            try {
				request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
    }

    private void listDocuments(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<DocumentModel> listDocuments = documentDAO.selectAllDocuments();
        request.setAttribute("listDocuments", listDocuments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/documentlist.jsp");
        dispatcher.forward(request, response);
    }
}
