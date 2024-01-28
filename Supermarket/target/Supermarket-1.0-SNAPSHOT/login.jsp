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
            background-image: url(images/bg2.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }
        
        </style>
        
</head>
<body>
    <%@ include file="Header.jsp" %>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
   
    <div class="space" style="min-height: 100vh;"></div>


    <div class="login-container">
        <form action="Login" method="post">
            <h1>Login Form</h1>
            <div class="container">
                <input type="text" placeholder="Enter your Email" name="username" required>
                <input type="password" placeholder="Enter password" name="password" required>
                <button type="submit" id="login-btn">login</button>
                <label for="remember">
                    <input type="checkbox" checked="cheked"> Remember Me
                </label>
                <a href="#" id="forgot-psw">Forgotten Password</a>
            </div>
            <div class="member">
                <button type="button" id="create-btn" onclick="Registration()">Create New Account</button>
            </div>
        </form>
    </div>


    
    
    <script src="js/script.js"></script>
    <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script type="text/javascript">
            
          var status = document.getElementById("status").value;
            if(status == "failed"){
                swal("Sorry","Wrong Username or Password","error");
            }
        
        </script>
    
        <%@ include file="footer.jsp" %>
    </body>
    </html>