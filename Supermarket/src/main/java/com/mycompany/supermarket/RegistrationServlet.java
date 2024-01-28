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



@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       String uname = request.getParameter("name");
       String uemail = request.getParameter("email");
       String upwd = request.getParameter("pass");
       String umobile = request.getParameter("contact");
       RequestDispatcher dispatcher = null;
      
       Connection con =null;
      try{
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
        String User_Name = "sa";
        String Password = "A123";
            //.....
            con = DriverManager.getConnection(DB_URL, User_Name, Password);
          
          PreparedStatement pst = con.prepareStatement("insert into users(uname,upwd,uemail,umobile) values(?,?,?,?) ");
          pst.setString(1, uname);
          pst.setString(2, upwd);
          pst.setString(3, uemail);
          pst.setString(4, umobile);
          
         int rowCount = pst.executeUpdate();
         dispatcher = request.getRequestDispatcher("registration.jsp");
         
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
    }

}
