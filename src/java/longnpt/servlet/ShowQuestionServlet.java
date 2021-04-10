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
public class ShowQuestionServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ShowQuestionServlet.class);

    private static final String SUCCESS = "admin.jsp";
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
        String url = SUCCESS;
        List<QuestionDTO> list = null;
        HttpSession session = request.getSession();
        session.setAttribute("FLAG_PAGING", "showAll");
        try {
            String flagUpdate = (String) session.getAttribute("flagUpdate");
            if ("Update Question".equals(flagUpdate)) {
                String txtIdHidden = request.getParameter("txtIdHidden");
                request.setAttribute("ID_HIDDEN", txtIdHidden);
                String content = QuestionDAO.getContentQuestion(txtIdHidden).trim();
                request.setAttribute("CONTENT_QUESTION", content);
                url = UPDATECONTENT;
            } else {
                String btnPage = request.getParameter("btnPage");
                String txtEnd = null;
                if (btnPage != null) {
                    txtEnd = btnPage;
                }
                int indexString = 1;
                if (txtEnd != null) {
                    indexString = Integer.parseInt(txtEnd);
                }
                int count = QuestionDAO.countTable();
                int pageSize = 20, endPage = 0;
                endPage = count / pageSize;
                if (count % pageSize != 0) {
                    endPage++;
                }
                request.setAttribute("END", endPage);
                request.setAttribute("COUNT_NO", indexString);
                //--------------------------

                list = QuestionDAO.getAllQuestion(indexString);
                request.setAttribute("LIST_QUESTION", list);
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
