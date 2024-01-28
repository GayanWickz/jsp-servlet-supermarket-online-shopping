<%-- 
    Document   : show_review.jsp
    Created on : Dec 27, 2023, 7:34:49 PM
    Author     : Gayan Wickz
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="style02.css"> 
    </head>
    <body>
        <%@ include file="Header.jsp" %>
        <div class="topic"><h2><font type="arial" size="18px" color="#fff">Reviews</font></h2></div>
      
                 
        <div class="button-container">
    <a href="Add_Review.jsp" class="xyz">Add Your Feedback Here!</a>
</div> 

    <%
    try{
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
     String DB_URL = "jdbc:sqlserver://DESKTOP-HSVEOM2\\SQLEXPRESS;databaseName=GreenMart;encrypt=true;trustServerCertificate=true;";
            String User_Name = "sa";
           String Password = "A123";
     
     
     Connection con = DriverManager.getConnection(DB_URL, User_Name, Password);
      String query = "SELECT * FROM ureview";
            PreparedStatement preparedStatement = con.prepareStatement(query);

           
            ResultSet rs = preparedStatement.executeQuery();

     
     while(rs.next())
     {
     %>
    
     <div class="full-boxer">
            <div class="comment-box">
                <div class="box-top">
                    <div class="Profile">
                        <div class="Name">
                            <strong>Name:- <%= rs.getString("name")%></strong>
                            
                        </div>
                    </div>
                </div>
                <hr color="green">
                <div class="comment">
                    <p>
                        <br>
                        <Strong>Comment:-<%= rs.getString("comment")%></strong>
                    </p>
                </div>
            </div>
        </div>
                    
     <!--end of output-->
                                                 

                                      


                                                <% }

                                                }
                                                 catch(Exception e){


                                                }
                                            %>
       
    
    <!--end of showing reviews -->
   
  <%@ include file="footer.jsp" %>
    </body>
</html>
