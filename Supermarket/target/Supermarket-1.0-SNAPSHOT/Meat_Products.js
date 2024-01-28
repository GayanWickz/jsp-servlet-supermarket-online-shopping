
document.addEventListener('DOMContentLoaded', function () {
    const initialCartData = JSON.parse(localStorage.getItem('cart')) || [];
    localStorage.setItem('cart', JSON.stringify(initialCartData));
    fetchData();
});


function fetchData() {
    console.log('Before fetching data');
    fetch('Meat_data_retrieve.jsp')
        .then(response => {
            console.log('Response status:', response.status);
            console.log('Response headers:', response.headers.get('content-type'));

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

           
            const contentLength = response.headers.get('content-length');
            if (contentLength === '0') {
                return []; 
            }

            const contentType = response.headers.get('content-type');
            console.log('Response content type:', contentType); // Add this line

            if (!contentType || !contentType.includes('application/json')) {
                throw new Error('Invalid content type or not JSON');
            }

            return response.json();
        })
        .then(data => {
            console.log('Data received:', data);
            updateHTML(data);
             
        })
        .catch(error => console.error('Error fetching data:', error));
}


function updateHTML(data) {
    console.log('Updating HTML with data:', data);
    const container = document.getElementById('itemContainer');
    container.innerHTML = ""; 

    data.forEach(item => {
        const itemBlock = document.createElement('article');
        itemBlock.className = 'art_2';
        itemBlock.innerHTML = `
            <div class="contents">
                <img src='data:image/jpeg;base64,${item.base64Image}' alt='${item.itemName}'>
                <div class="word">
                    <h>${item.itemName}</h>
                    <p>Rs.${item.itemPrice}</p> <!-- Access itemPrice directly -->
                    <button class="add-to-cart-btn" 
    data-name="${item.itemName}" 
    data-price="${item.itemPrice}" 
    data-image="${item.base64Image}">Add to Cart</button>
                </div>
            </div>
        `;
        container.appendChild(itemBlock);
    });
      setupAddToCartButtons(); 
}





function setupAddToCartButtons() {
    const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');
    addToCartButtons.forEach(button => {
        button.addEventListener('click', function () {
            const itemName = this.getAttribute('data-name');
            const itemPrice = parseFloat(this.getAttribute('data-price'));
            const base64Image = this.getAttribute('data-image');
            addToCart(itemName, itemPrice, base64Image);
        });
    });
}

function addToCart(itemName, itemPrice, base64Image) {
    let cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    cartItems.push({ itemName, itemPrice, base64Image });
    localStorage.setItem('cart', JSON.stringify(cartItems));
    alert('Item added to cart!');
    displayCart(); // Update the cart 
}



