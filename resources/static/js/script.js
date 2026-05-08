// Функція для кнопки кошика
function openCart() {
    alert("Перехід до кошика...");
}

// Обробка натискання "Додати в кошик"
document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.btn-add-cart');

    buttons.forEach(button => {
        button.addEventListener('click', function() {
            const productName = this.getAttribute('data-name');
            console.log("Додано в кошик: " + productName);
            this.innerText = "Додано ✓";
            this.classList.replace('btn-success', 'btn-secondary');
        });
    });
});