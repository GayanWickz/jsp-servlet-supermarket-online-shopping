<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Green Mart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">

<style>

body{
    background-image: url(images/bg3.jpg);
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: 100% 100%;
}

</style>


</head>
<body>
    
     <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
     
    <header class="header">

        <a href="index.jsp" class="logo"><i class="fas fa-shopping-basket"></i> Green Mart</a>

        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="shop.jsp">Shop</a>
            <a href="about.jsp">About</a>
            <a href="review.jsp">Review</a>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="search-btn" class="fas fa-search"></div>
            <div id="cart-btn" class="fas fa-shopping-cart"></div>
            <div id="login-btn" class="fas fa-user"></div>
        </div>

        <form action="" class="search-form">
            <input type="search" placeholder="Search Here" id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>

    </header>
 
    <section class="registration" id="registration">

    <div class="registration-container">
        <form action="RegistrationServlet" method="post">
            <h1>Sign Up Form</h1>
            <div class="container">
                <input type="text" placeholder="Enter Your Name" name="name" required>
                <input type="text" placeholder="Enter Email" name="email" required>
                <input type="text" placeholder="Enter Phone Number" name="contact" required>
                <input type="password" placeholder="Enter password" name="pass" required>
                <button type="submit" id="signup-btn">Sign Up</button>
                <label for="remember">
                    <input type="checkbox" checked="cheked"> I agree all statements in <a href="#">Terms of Service</a>
                </label>
            </div>
            <div class="member">
                <button type="button" id="already-btn" onclick="Login()">I have alredy an Account</button>
            </div>
        </form>
    </div>

    </section>

    <div class="space" style="min-height: 120vh;"></div>


    <section class="footer">

        <div class="box-container">
            <div class="box">
                <h3>Quick Links</h3>
                <a href="index.jsp" class="links"><i class="fas fa-arrow-right"></i>Home</a>
                <a href="shop.jsp" class="links"><i class="fas fa-arrow-right"></i>Shop</a>
                <a href="about.jsp" class="links"><i class="fas fa-arrow-right"></i>About</a>
                <a href="review.jsp" class="links"><i class="fas fa-arrow-right"></i>Review</a>
            </div>
    
            <div class="box">
                <h3>Green Mart</h3>
                <p>Connect with us</p>
                <div class="share">
                    <a href="#" class="fab fa-facebook"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-twitch"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                    
                </div>
            </div>
    
            <div class="box">
                <h3>Contact Info</h3>
                <a href="" class="links"> <i class="fas fa-phone"></i> +94 71 412 9863</a>
                <a href="" class="links"> <i class="fas fa-phone"></i> +94 77 252 2466</a>
                <a href="" class="links"> <i class="fas fa-envelope"></i> sahanransika0226@gmail.com</a>
                <a href="" class="links"> <i class="fas fa-map-marker-alt"></i> NSBM, Homagama, Sri Lanka</a>
            </div>
    
            <div class="box">
                <h3>News Letter</h3>
                <p>Subscribe for latest updates</p>
                <input type="email" placeholder="Enter your Email" class="email">
                <input type="submit" value="Subscribe" class="btn">
                <img src="images/paypal.png" class="payment" alt="">
            </div>
        </div>
    
        <div class="credit"> Created by <span>Group A31: Plymouth 11</span>  | all rights reserved </div>
    
    </section>
    
   
    <script src="js/script.js"></script>
    <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script type="text/javascript">
            
            var status = document.getElementById("status").value;
            if(status == "success"){
                swal("Congrats","Account Created Successfully","success");
            }
        
        </script>
    
    </body>
    </html>