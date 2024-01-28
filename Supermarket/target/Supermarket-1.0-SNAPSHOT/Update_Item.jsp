<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Item</title>
     <link rel="stylesheet" href="add_item.css"/>
</head>
<body>
<%@ include file="Header.jsp" %>




<%
    // Retrieve the item name from the query parameter
    String itemName = request.getParameter("item");
    if (itemName != null) {
        itemName = URLDecoder.decode(itemName, "UTF-8");
    }
%>

<div class="x">
<form action="UpdateItemServlet" method="post" enctype="multipart/form-data">
    
  
    
    <input type="hidden" name="item" value="<%= itemName %>">

   
    <label for="newName">New Item Name:</label>
    <input type="text" id="newName" name="newName" required><br>

    <label for="newPrice">New Price:</label>
    <input type="text" id="newPrice" name="newPrice" required><br>

    <label for="newImage">Choose New Image:</label>
    <input type="file" id="newImage" name="newImage" accept="image/*"><br>

    <label for="newCategory">New Category:</label>
    <input type="text" id="newCategory" name="newCategory" required><br>

    <input type="submit" value="Update Item">
</form>
 </div>
    <%@ include file="footer.jsp" %>
</body>
</html>



