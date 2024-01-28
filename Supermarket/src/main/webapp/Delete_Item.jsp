<%-- 
    Document   : Delete_Item.jsp
    Created on : Dec 6, 2023, 4:06:32 PM
    Author     : Gayan Wickz
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Item</title>
</head>
<body>

<h2>Delete Item</h2>



<%
    
    String itemName = request.getParameter("item");
    if (itemName != null) {
        itemName = URLDecoder.decode(itemName, "UTF-8");
    }
%>


<form action="DeleteItemServlet" method="post">
    
 
    
    <input type="hidden" name="item" value="<%= itemName %>">

    

    <input type="submit" value="Delete Item">
</form>

</body>
</html>



