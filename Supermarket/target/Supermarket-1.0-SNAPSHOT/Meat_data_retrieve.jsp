<%-- 
    Document   : Meat_data_retrieve
    Created on : Dec 26, 2023, 4:32:41 PM
    Author     : Gayan Wickz
--%>

<%-- 
    Document   : Dairy_data_retrieve
    Created on : Dec 25, 2023, 12:23:31 AM
    Author     : Gayan Wickz
--%>

<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mycompany.supermarket.Items"%>
<%@ page import="com.google.gson.Gson" %>
<%
    try {
       
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";

        
        try (Connection connection = DriverManager.getConnection(DB_URL, User_Name, Password)) {

            // Retrieve data from the database
            String sql = "SELECT Name, Price, ImageData FROM Items WHERE Category = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, "Meats");

                try (ResultSet resultSet = preparedStatement.executeQuery()) {

                    // Create a list to store items
                    ArrayList<Items> items = new ArrayList<>();

                    while (resultSet.next()) {
                        Items item = new Items();
                        item.setItemName(resultSet.getString("Name"));
                         float itemPrice = resultSet.getFloat("Price");
                        item.setItemPrice(itemPrice);
                        byte[] imageData = resultSet.getBytes("ImageData");
                        item.setBase64Image(Base64.getEncoder().encodeToString(imageData));
                        // item.setCategory(resultSet.getString("Category"));

                        // Add the item to the list
                        items.add(item);
                    }

                    // Convert the list to JSON and write it to the response
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    out.print(new com.google.gson.Gson().toJson(items));
                }
            }
        }
    } catch (Exception e) {
        
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
%>

