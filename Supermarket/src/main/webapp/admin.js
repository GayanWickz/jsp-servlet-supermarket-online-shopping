document.addEventListener('DOMContentLoaded', function () {
    fetchData();
});

function fetchData() {
    fetch('Admin_Data_Retrive.jsp')
        .then(response => {
            console.log('Response status:', response.status);
            console.log('Response headers:', response.headers.get('content-type'));

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            const contentType = response.headers.get('content-type');
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
    const tableBody = document.getElementById('itemTableBody');
    tableBody.innerHTML = ""; // Clear existing content

    data.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.itemName}</td>
            <td>${item.itemPrice}</td>
            <td><img src='data:image/jpeg;base64,${item.base64Image}' alt='${item.itemName}'></td>
            <td>${item.category}</td>
            <td><button class="edit" onclick="editItem('${item.itemName}')">Edit</button>
                <button class="delete" onclick="DeleteItem('${item.itemName}')">Delete</button>
     </td>
        `;
        tableBody.appendChild(row);
    });
}

function editItem(itemName) {
    // Navigate to UpdateItem.jsp ,with the item name as a query parameter
    window.location.href = 'Update_Item.jsp?item=' + encodeURIComponent(itemName);
}

function DeleteItem(itemName) {
    // confirmation alert
    var isConfirmed = confirm("Are you sure you want to delete " + itemName + "?");

    
    if (isConfirmed) {
        
        window.location.href = 'Delete_Item.jsp?item=' + encodeURIComponent(itemName);
    }
   
    else {
       
    }
}
