let cart = JSON.parse(localStorage.getItem('cart')) || [];

function updateUI() {
    const list = document.getElementById("cartItemsList");
    const total = document.getElementById("cartTotalAmount");
    const nextBtn = document.getElementById("btnProceed");
    const hidden = document.getElementById("hiddenProducts");
    const badge = document.getElementById("cartCountBadge");

    if (nextBtn) nextBtn.disabled = cart.length === 0;

    if (badge) {
        badge.innerText = cart.length;
        if (cart.length > 0) {
            badge.classList.remove("d-none");
        } else {
            badge.classList.add("d-none");
        }
    }

    let html = "", inputs = "", sum = 0;

    cart.forEach((v, i) => {
        sum += v.price;
        html += `<div class="d-flex justify-content-between mb-2 border-bottom pb-1">
                    <span>${v.name}</span>
                    <button type="button" class="btn btn-sm btn-danger" onclick="removeCartItem(${i})">X</button>
                 </div>`;
        inputs += `<input type="hidden" name="productIds" value="${v.id}">`;
    });

    if (list) list.innerHTML = html || "Кошик порожній";
    if (hidden) hidden.innerHTML = inputs;
    if (total) total.innerText = sum.toFixed(2);
}

window.removeCartItem = function(i) {
    cart.splice(i, 1);
    localStorage.setItem('cart', JSON.stringify(cart));
    updateUI();
};

window.addItem = function(btn) {
    cart.push({
        id: btn.getAttribute('data-id'),
        name: btn.getAttribute('data-name'),
        price: parseFloat(btn.getAttribute('data-price'))
    });
    localStorage.setItem('cart', JSON.stringify(cart));
    updateUI();

    const oldText = btn.innerText;
    btn.innerText = "В кошику ✅";
    btn.classList.replace("btn-success", "btn-secondary");
    setTimeout(() => {
        btn.innerText = oldText;
        btn.classList.replace("btn-secondary", "btn-success");
    }, 800);
};

document.addEventListener("DOMContentLoaded", () => {
    updateUI();

    // Пошук товарів
    const searchInput = document.getElementById("searchInput");
    if (searchInput) {
        searchInput.addEventListener("input", function() {
            let v = this.value.toLowerCase();
            document.querySelectorAll(".product-item").forEach(el => {
                el.style.display = el.innerText.toLowerCase().includes(v) ? "" : "none";
            });
        });
    }
});