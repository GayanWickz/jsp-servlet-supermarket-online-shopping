/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.supermarket;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gayan Wickz
 */
@WebServlet(name = "review", urlPatterns = {"/review"})
public class review extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String name = request.getParameter("name");
        String review = request.getParameter("review");
        RequestDispatcher dispatcher = null;
      
       Connection con =null;
      try{
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";
         
         
         con = DriverManager.getConnection(DB_URL, User_Name, Password);
         
          
          PreparedStatement pst = con.prepareStatement("insert into ureview(name,comment) values(?,?)  ");
         
          
          pst.setString(1, name);
           pst.setString(2, review);
         
          
         int rowCount = pst.executeUpdate();
         dispatcher = request.getRequestDispatcher("show_review.jsp");
         
         if (rowCount>0){
             
             request.setAttribute("status","success");   
         }
         else{
             
              request.setAttribute("status","failed");   
         }
         
         dispatcher.forward(request, response);
    }
      catch(Exception e){
          e.printStackTrace();
      }
      finally{
           try {
               con.close();
           } catch (SQLException ex) {
               Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
           }
    } 
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
