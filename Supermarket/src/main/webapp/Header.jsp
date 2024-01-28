<%-- 
    Document   : Header.jsp
    Created on : Dec 19, 2023, 10:03:48?AM
    Author     : Gayan Wickz
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Green Mart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    
     

   
    
</head>
<body>
    <header class="header">

        <a href="index.jsp" class="logo"><i class="fas fa-shopping-basket"></i> Green Mart</a>

        <nav class="navbar">
            <a href="index.jsp">Home</a>
            
           <div class="dropdown">
   
    <a href="#">Shop</a>
    
    <div class="dropdown-content">
      
      <a class="asd" href="Vegetables.jsp">Vegetables</a>
      <a href="bakery.jsp">Fresh Fruits</a>
        <a href="Meat.jsp">Fresh Meats</a>
      <a href="Dairy.jsp">Dairy Products</a>
      
      
    </div>
  </div>
          
   <% if (session.getAttribute("email") == null || !java.util.Objects.equals(session.getAttribute("email"), "sureshgayan2001@gmail.com")) { %>
    <a href="About_1.jsp">About</a>
<% } %>

<a href="show_review.jsp">Review</a>
            
           
<% if (java.util.Objects.equals(session.getAttribute("email"), "sureshgayan2001@gmail.com")) { %>
    <a href="Admin.jsp">Admin</a>
<% } %>

    <%
    if (session.getAttribute("email") != null) {
%>
        <a href="Logout" id="logout-btn" class="">Logout</a>
<%
    }
%>
        
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="search-btn" class="fas fa-search"></div>
               
            
          <% 
        String userEmail = (String)session.getAttribute("email");
        String cartButtonId = (userEmail == null) ? "restricted-cart-btn" : "cart-btn";
    %>
    
    <div id="<%= cartButtonId %>" class="fas fa-shopping-cart"></div>
    
            
               <div id="login-btn" class="fas fa-user"></div>
    
</div>
            
            
          
         
  

        <form action="" class="search-form">
            <input type="search" placeholder="Search Here" id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>
        
    </header>
    
     <script>
        const userEmail = "<%= session.getAttribute("email") %>";
    </script>
   <script src="cart.js"></script>
 <script src="js/script.js"></script>
</body>

</html>