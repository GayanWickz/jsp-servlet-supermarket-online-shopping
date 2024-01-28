
package com.mycompany.supermarket;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "DeleteItemServlet", urlPatterns = {"/DeleteItemServlet"})

public class DeleteItemServlet extends HttpServlet {

    //I Removed ProcessRequest and doGet method.
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String x = request.getParameter("item");
        
        

        try {
            
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";
            Connection connection = DriverManager.getConnection(DB_URL, User_Name, Password);

            
            String sql = "Delete From Items WHERE Name=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
               
                preparedStatement.setString(1, x);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); 
            response.sendRedirect("Delete_error.jsp"); // Redirect to an error page but there is no page heeeee...
            return;
        }

        request.setAttribute("successMessage", "Delete was successful!");

// Redirect to the JSP page
RequestDispatcher dispatcher = request.getRequestDispatcher("Delete_Success.jsp");
dispatcher.forward(request, response);
    }
}