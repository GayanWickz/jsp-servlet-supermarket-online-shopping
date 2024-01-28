      <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Green Mart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    
   <link rel="stylesheet" href="snowfall.css">
<script src="snowfall.js" defer></script>
  
    
   <%@ include file="Header.jsp" %>  
</head>
<body>
   
     
      



        <div class="slider">

            <div class="myslider fade" style="display: block;">
                <div class="content">
                    <h1>Fresh is our passion</h1>
                    <p>visit our Green Mart</p>
                </div>
               <img src="images/3.jpg" style="width: 100%; height: 100%;">
            </div>

            
            <div class="myslider fade">
                <div class="content">
                    <h1>Fresh is our passion</h1>
                    <p>visit our Green Mart</p>
                </div>
               <img src="images/3.jpg" style="width: 100%; height: 100%;">
            </div>

            
            <div class="myslider fade">
                <div class="content">
                    <h1>Everything at one place</h1>
                    <p>visit our Green Mart</p>
                </div>
               <img src="images/1.jpg" style="width: 100%; height: 100%;">
            </div>

            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <div class="dotsbox" style="text-align: center;">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
            </div>

        </div>

        <section class="features" id="features">

            <h1 class="heading"> Our <span>features</span></h1>

            <div class="box-container">

                <div class="box">
                    <img src="images/4.jpg" alt="">
                    <h3>Fresh and Organic</h3>
                    <p> Fresh is our passion and we provided healthy organic vegetables and fruits</p>
                </div>

                <div class="box">
                    <img src="images/5.png" alt="">
                    <h3>Easy Payments</h3>
                    <p> Fresh is our passion and we provided healthy organic vegetables and fruits</p>
                </div>

                <div class="box">
                    <img src="images/6.jpg" alt="">
                    <h3>Free Delivery</h3>
                    <p> Fresh is our passion and we provided healthy organic vegetables and fruits</p>
                </div>

            </div>

        </section>

        <section class="categories" id="categories">

            <h1 class="heading"> Product <span>categories</span></h1>

            <div class="box-container">

               <div class="box">
                        <img src="images/7.jpeg" alt="">
                        <h3>Vegetables</h3>
                        <p>upto 45% off</p>
                        <a href="Vegetables.jsp" class="btn">shop now</a>
                </div>
    
                 <div class="box">
                        <img src="images/8.jpeg" alt="">
                        <h3>Fresh Fruits</h3>
                        <p>upto 45% off</p>
                        <a href="bakery.jsp" class="btn">shop now</a>
                </div>

                <div class="box">
                    <img src="images/9.jpeg" alt="">
                    <h3>Dairy Products</h3>
                    <p>upto 45% off</p>
                    <a href="Dairy.jsp" class="btn">shop now</a>
                </div>

                <div class="box">
                    <img src="images/10.jpeg" alt="">
                    <h3>Fresh Meats</h3>
                    <p>upto 45% off</p>
                    <a href="Meat.jsp" class="btn">shop now</a>
                </div>
                
            </div>

        </section>

     <script>
        const userEmail = "<%= session.getAttribute("email") %>";
    </script>
   
    <script src="cart.js"></script>
     <script src="js/script.js"></script>
    
    <%@ include file="footer.jsp" %> 
</body>
</html>