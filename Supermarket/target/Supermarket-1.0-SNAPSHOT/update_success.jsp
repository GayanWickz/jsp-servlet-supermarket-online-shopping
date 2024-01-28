<%-- 
    Document   : update_success.jsp
    Created on : Dec 19, 2023, 12:12:42 PM
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
        <%@ include file="Header.jsp" %>
        <h2>Update Successful</h2>
    
    <%-- Retrieve success message  --%>
    <p>${requestScope.successMessage}</p>
    
    <%--redirect to admin.jsp--%>
   <script>
       
        setTimeout(function() {
            window.location.href = 'Admin.jsp';
        }, 3000); 
    </script>
    <%@ include file="footer.jsp" %>
    </body>
</html>
