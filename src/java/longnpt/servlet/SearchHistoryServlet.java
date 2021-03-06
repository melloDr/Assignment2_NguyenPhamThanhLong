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
import longnpt.daos.HistoryDAO;
import longnpt.dtos.HistoryDTO;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class SearchHistoryServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(SearchHistoryServlet.class);

    private static final String ERROR = "invalid.html";
    private static final String SUCCESS = "resultExam.jsp";

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
        HttpSession session = request.getSession();
        try {
            String txtSearchHistory = (String) request.getParameter("txtSearchHistory");
            int idSub = 0;
            if ("Java Desktop".equals(txtSearchHistory)) {
                idSub = 1;
            } else if ("Java Web".equals(txtSearchHistory)) {
                idSub = 2;
            }
            String userID = (String) session.getAttribute("LOGIN_ID");
            String btnPage = request.getParameter("btnPage");
            String txtEnd = null;
            if (btnPage != null) {
                txtEnd = btnPage;
            }
            int indexString = 1;
            if (txtEnd != null) {
                indexString = Integer.parseInt(txtEnd);
            }
            int count = HistoryDAO.countHistory(userID, idSub);
            int pageSize = 20, endPage = 0;
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            request.setAttribute("END", endPage);
            request.setAttribute("COUNT_NO", indexString);
            //---------------------
            List<HistoryDTO> list = null;
            list = HistoryDAO.getExamQuestion(userID, idSub);
            session.setAttribute("LIST_HISTORY", list);
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
