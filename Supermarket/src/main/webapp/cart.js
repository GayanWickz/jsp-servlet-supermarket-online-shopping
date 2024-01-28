
function displayCart() {
    const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    const cartContainer = document.getElementById('cart-container');
    const totalContainer = document.querySelector('.cart-total');

    
    cartContainer.innerHTML = "";

    cartItems.forEach(item => {
        if (item && item.base64Image && item.itemName && item.itemPrice) {
            const product = document.createElement('div');
            product.className = 'product';

            product.innerHTML = `
                <img src='data:image/jpeg;base64,${item.base64Image}'>
                <div class="product-info">
                    <h3 class="product-name">${item.itemName}</h3>
                    <h4 class="product-price">Rs. ${item.itemPrice}</h4>
                    <p class="product-quantity">Qnt: <input type="number" min="1" max="100" value="1" name=""></p>
                    <p class="product-remove">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        <span class="remove" onclick="removeFromCart('${item.itemName}')">Remove</span>
                    </p>
                </div>
            `;

            cartContainer.appendChild(product);
        } else {
            console.error('Invalid item:', item);
        }
    });

    updateCartTotal(cartItems, totalContainer);
}

function updateCartTotal(cartItems, totalContainer) {
    const totalPrice = cartItems.reduce((total, item) => total + item.itemPrice, 0);

    totalContainer.innerHTML = `
        <p>
            <span>Total Price</span>
            <span id="totalSpan">Rs. ${totalPrice.toFixed(2)}</span>
        </p>
        <p>
            <span>Number of Items</span>
            <span>${cartItems.length}</span>
        </p>
        <p>
            <span>You Save</span>
            <span id="savingsSpan">Rs. 0.00</span>
        </p>
        <a href="#" id="paypal-button-container">Proceed to Checkout</a><br><br><br><br><br><br><br><br>
        <a href="#" id="proceedToCheckout" onclick="ClearCart()">Clear Cart</a>
    `;

    document.getElementById('paypal-button-container').addEventListener('click', function() {
        const totalSpanElement = document.getElementById('totalSpan');
        const totalValueForCheckout = totalSpanElement.innerHTML;
        proceedToCheckout(totalValueForCheckout);
    });
}

function removeFromCart(itemName) {
    let cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    cartItems = cartItems.filter(item => item.itemName !== itemName);
    localStorage.setItem('cart', JSON.stringify(cartItems));
    displayCart(); // Update the cart display after remove
}

// function clear cart 
function ClearCart() {
    // Update the cart display before removal
    displayCart();
    //This is used for Clear the cart
    localStorage.removeItem('cart');
   
}

// Call displayCart() when the page loads 
document.addEventListener('DOMContentLoaded', function () {
    displayCart();
     console.log(userEmail);
     
      
});


// checkout function 
function proceedToCheckout(totalValue) {
  
   
  const totalPrice = parseFloat(totalValue.replace('Rs. ', '')); 


    // Send order information to the server
    fetch('create_order', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'total=' + encodeURIComponent(totalPrice)
    })
    .then(response => response.text())
    .then(orderId => {
        // Create a PayPal button using the order ID from the server
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    id: orderId, 
                    purchase_units: [{
                        amount: {
                            currency_code: 'USD',
                            value: totalPrice.toFixed(2),
                        }
                    }]
                });
            },
            // following lines used to pop up alert message.
            onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                // successful message 
                alert('Transaction completed by ' + details.payer.name.given_name);
               
               setTimeout(sendEmailToServer, 5000);
            });
            
        },
        
        onError: function(err) {
           
            console.error(err);
        }
        }).render('#paypal-button-container');
    })
    .catch(error => {
        console.error('Error creating order:', error);
    });
    
}






//Email Sending function


function sendEmailToServer() {
    fetch('Email_Servlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'email=' + encodeURIComponent(userEmail)
    })
    .then(response => response.text())
    .then(responseData => {
        // Handle the response if needed
        console.log('Email sent to server:', responseData);
    })
    .catch(error => {
        console.error('Error sending email to server:', error);
    });
}



// Call displayCart() when the page loads 
document.addEventListener('DOMContentLoaded', function () {
    displayCart();
    console.log(userEmail);

    
    const logoutLink = document.getElementById('logout-btn');
    if (logoutLink) {
        logoutLink.addEventListener('click', function (event) {
            event.preventDefault(); 
            ClearCart();
            
            window.location.href = 'Logout'; 
        });
    }
});