
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
@WebServlet(name = "ImageUploadServlet", urlPatterns = {"/ImageUploadServlet"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB max file size
public class ImageUploadServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImageUploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImageUploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String name = request.getParameter("name");
        float price =Float.parseFloat(request.getParameter("price"));
        String category = request.getParameter("category");
        Part filePart = request.getPart("image");
        InputStream inputStream = filePart.getInputStream();
        byte[] imageData = inputStream.readAllBytes();
if ( name == null) {
    PrintWriter out = response.getWriter();
    out.println("name or description or item price is null");
    return;
}
        
        try {
            // Establish database connection
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";
            Connection connection = DriverManager.getConnection(DB_URL, User_Name, Password);
            
            
             String sql = "INSERT INTO Items (Name, Price,ImageData,Category) VALUES (?, ?,?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, name);
                preparedStatement.setFloat(2, price);
                preparedStatement.setBytes(3, imageData);
                 preparedStatement.setString(4, category);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImageUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

      request.setAttribute("successMessage", "Ttem Inserted successfully!");

// Redirect to the JSP page
RequestDispatcher dispatcher = request.getRequestDispatcher("Insert_Success.jsp");
dispatcher.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
