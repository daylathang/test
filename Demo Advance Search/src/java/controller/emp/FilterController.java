/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.emp;

import dal.DeptDBContext;
import dal.EmpDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author Ngo Tung Son
 */
public class FilterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");//M F All
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        String raw_did = request.getParameter("did");//ALL d1 d2... dN
        
        //validate
        Integer id = (raw_id != null&&raw_id.length()>0)?new Integer(raw_id):null;
        String name = (raw_name!=null && raw_name.length()>0)?raw_name:null;
        Boolean gender = (raw_gender !=null && raw_gender.length()>0
                &&!raw_gender.equals("all"))?raw_gender.equals("male"):null;
        Date from = (raw_from!=null && raw_from.length()>0)
                ?Date.valueOf(raw_from):null;
        Date to = (raw_to!=null && raw_to.length()>0)
                ?Date.valueOf(raw_to):null;
        Integer did = (raw_did != null&&raw_did.length()>0&&!raw_did.equals("-1"))?new Integer(raw_did):null;
        DeptDBContext dbDept = new DeptDBContext();
        request.setAttribute("depts", dbDept.list());
        EmpDBContext dbEmp = new EmpDBContext();
        request.setAttribute("emps", dbEmp.filter(id, name, gender, from, to, did));
        request.getRequestDispatcher("../view/emp/filter.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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

    


}
