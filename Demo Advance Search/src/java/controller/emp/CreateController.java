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
import java.util.ArrayList;
import model.Dept;
import model.Emp;

/**
 *
 * @author Ngo Tung Son
 */
public class CreateController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
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
        DeptDBContext dbDept = new DeptDBContext();
        ArrayList<Dept> depts = dbDept.list();
        request.setAttribute("depts", depts);
        request.getRequestDispatcher("../view/emp/create.jsp").forward(request, response);
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
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_dob = request.getParameter("dob");
        String raw_did = request.getParameter("did");
        // validate inputs
        Emp e = new Emp();
        e.setName(raw_name);
        e.setGender(raw_gender.equals("male"));
        e.setDob(Date.valueOf(raw_dob));
        Dept d = new Dept();
        d.setId(Integer.parseInt(raw_did));
        e.setDept(d);
        
        EmpDBContext db = new EmpDBContext();
        db.insert(e);
        
        //option 1
        //response.getWriter().println("inserted successful!");
        //option 2
        //response.sendRedirect("search");
        //option 3
        request.setAttribute("emp", e);
        request.setAttribute("action", "added");
        request.getRequestDispatcher("../view/emp/insert_confirm.jsp").forward(request, response);
    }

    


}
