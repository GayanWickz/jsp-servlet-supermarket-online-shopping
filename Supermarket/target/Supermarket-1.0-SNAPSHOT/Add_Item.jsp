<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Green Mart</title>
   
      <link rel="stylesheet" href="add_item.css"/>
      
</head>
<body>
   
<%@ include file="Header.jsp" %>

    <div class="x">
<form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
    <label>  <h2>Insert New Item</h2></label>
    <label for="name">Name</label>
    <input type="text" id="name" name="name" required><br>

    <label for="description">Price</label>
    <input type="text" id="price" name="price" rows="4" required><br>

    <label for="image">Choose Image</label>
    <input type="file" id="image" name="image" accept="image/*" required><br>
     
    <label for="category">Category</label>
    <input type="text" id="category" name="category" rows="4" required><br>
    
    <input type="submit" value="Add Item">
</form>
    </div>

    
    
    
    
    <%@ include file="footer.jsp" %>
        
    </body>
    </html>