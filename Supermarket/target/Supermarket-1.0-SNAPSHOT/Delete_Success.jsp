<%-- 
    Document   : Delete_Success
    Created on : Dec 19, 2023, 12:51:58 PM
    Author     : Gayan Wickz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h2>Delete Successfully!</h2>
    
    
    <p>${requestScope.successMessage}</p>
    
  
   <script>
       
        setTimeout(function() {
            window.location.href = 'Admin.jsp';
        }, 3000); 
    </script>
    </body>
</html>
