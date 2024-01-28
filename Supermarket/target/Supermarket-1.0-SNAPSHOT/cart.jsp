<!DOCTYPE html>
<html>

<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="cart.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- This block make the email available to cart.js -->
    <script>
        const userEmail = "<%= session.getAttribute("email") %>";
    </script>
    <script src="cart.js"></script>
    
    

</head>

<body>
   <%@ include file="Header.jsp" %>
    <div class="container">
        <h1></h1>

        <div class="cart">
            <div class="products" id="cart-container">
                <!-- Cart items will be dynamically added here -->
            </div>

            <div class="cart-total">
                <!-- Total is dynamically added here -->
                <!-- Paypal button dynamically added here using cart.js -->
            </div>
        </div>
    </div>

  
    <script src="https://www.paypal.com/sdk/js?client-id=AZovmUB7eg8d5w4cgxO3AbgrZYDASxGOOiPcPasso9CDNARErdnzBkRN97snU5_kPSsy_Jh8tsV1iNPm&currency=USD"></script>
  <script src="cart.js"></script>
  <%@ include file="footer.jsp" %>
</body>

</html>