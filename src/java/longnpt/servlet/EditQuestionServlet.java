/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnpt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import longnpt.daos.QuestionDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class EditQuestionServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(EditQuestionServlet.class);

    private static final String SUCCESS = "ShowQuestionServlet";
    private static final String ERROR = "invalid.html";
    private static final String UPDATECONTENT = "updateContent.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String btnAction = request.getParameter("btnAction");
            if ("Update Question".equals(btnAction)) {
                String txtIdHidden = request.getParameter("txtIdHidden");
                request.setAttribute("ID_HIDDEN", txtIdHidden);
                String content = QuestionDAO.getContentQuestion(txtIdHidden).trim();
                request.setAttribute("CONTENT_QUESTION", content);
                url = UPDATECONTENT;
            } else if ("Delete This Question".equals(btnAction)) {
                String txtIdHiddenToDelete = request.getParameter("txtIdHiddenToDelete");
                QuestionDAO.deleteQuestion(txtIdHiddenToDelete);
                url = SUCCESS;
            } else if ("Update This Question".equals(btnAction)) {
                String txtIdHidden = request.getParameter("txtIdHidden");
                String txtAnswerToUpdate = request.getParameter("txtAnswerToUpdate");
                String txtSubjectToUpdate = request.getParameter("txtSubjectToUpdate");
                String subjectToUpdate = "";
                if ("Java Web".equals(txtSubjectToUpdate)) {
                    subjectToUpdate = "2";
                } else if ("Java Desktop".equals(txtSubjectToUpdate)) {
                    subjectToUpdate = "1";
                }
                String txtStatusToUpdate = request.getParameter("txtStatusToUpdate");
                QuestionDAO.updateQuestion(txtIdHidden, txtAnswerToUpdate, subjectToUpdate, txtStatusToUpdate);
                url = SUCCESS;
            }
        } catch (Exception e) {
            LOGGER.error("error: ", e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
