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

@WebServlet(name = "UpdateItemServlet", urlPatterns = {"/UpdateItemServlet"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB max file size
public class UpdateItemServlet extends HttpServlet {

    //I Removed ProcessRequest and doGet method.
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String x = request.getParameter("item");
        
        //Getting data from the Update Form(item name to update)
        String nName = request.getParameter("newName");
       
         float newPrice =Float.parseFloat(request.getParameter("newPrice"));
        String newCategory = request.getParameter("newCategory");
        Part filePart = request.getPart("newImage");

        // if there is no image, its ridirect to another jsp.
        if (filePart == null) {
            response.sendRedirect("update_error.jsp"); 
            return;
        }

        try {
            
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";
            
            Connection connection = DriverManager.getConnection(DB_URL, User_Name, Password);

           
            String sql = "UPDATE Items SET Name = ?, Price = ?, ImageData = ?, Category = ? WHERE Name=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, nName);
                preparedStatement.setFloat(2, newPrice);

                // Update the image only if a new image is provided
                if (filePart.getSize() > 0) {
                    InputStream inputStream = filePart.getInputStream();
                    byte[] newImageData = inputStream.readAllBytes();
                    preparedStatement.setBytes(3, newImageData);
                } else {
                    // Keep the existing image data if no new image is provided
                    preparedStatement.setBytes(3, request.getParameter("currentImageData").getBytes());
                }

                preparedStatement.setString(4, newCategory);
                preparedStatement.setString(5, x);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); 
            response.sendRedirect("update_error.jsp"); // Redirect to an error page
            return;
        }

       request.setAttribute("successMessage", "Update was successful!");

// Redirect to the JSP page
RequestDispatcher dispatcher = request.getRequestDispatcher("update_success.jsp");
dispatcher.forward(request, response);

    }
}