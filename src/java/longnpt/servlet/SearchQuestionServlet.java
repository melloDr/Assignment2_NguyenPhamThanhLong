/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longnpt.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longnpt.daos.QuestionDAO;
import longnpt.dtos.QuestionDTO;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class SearchQuestionServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(SearchQuestionServlet.class);

    private static final String ERROR = "invalid.html";
    private static final String SUCCESS = "admin.jsp";

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
        List<QuestionDTO> list = null;
        HttpSession session = request.getSession();
        session.setAttribute("FLAG_PAGING", "search");
        String txtSearchQuestion = request.getParameter("txtSearchQuestion");
        session.setAttribute("searchQuestion", txtSearchQuestion);
        String txtSearchQuestionBy = request.getParameter("txtSearchQuestionBy");
        session.setAttribute("searchQuestionBy", txtSearchQuestionBy);
        String searchBy = null;
        if ("Question name".equals(txtSearchQuestionBy)) {
            searchBy = "question";
        } else if ("Question status".equals(txtSearchQuestionBy)) {
            searchBy = "status";
        } else if ("Question subject".equals(txtSearchQuestionBy)) {
            searchBy = "s.name";
        }
        try {
            String btnPage = request.getParameter("btnPage");
            String txtEnd = null;
            if (btnPage != null) {
                txtEnd = btnPage;
            }
            int indexString = 1;
            if (txtEnd != null) {
                indexString = Integer.parseInt(txtEnd);
            }
            int count = QuestionDAO.countSearchQuestion(searchBy, txtSearchQuestion);
            int pageSize = 20, endPage = 0;
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            request.setAttribute("END", endPage);
            request.setAttribute("COUNT_NO", indexString);
            //---------------------

            list = QuestionDAO.searchQuestion(searchBy, txtSearchQuestion,indexString);
            request.setAttribute("LIST_QUESTION", list);
            url = SUCCESS;
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
