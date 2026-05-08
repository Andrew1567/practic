document.addEventListener("DOMContentLoaded", () => {

    // Елементи для вибору часу
    const timeOption = document.getElementById("deliveryTimeOption");
    const exactTimeInput = document.getElementById("exactTimeInput");

    // Логіка показу/сховання поля точного часу
    if (timeOption && exactTimeInput) {
        timeOption.addEventListener("change", function() {
            if (this.value === "EXACT") {
                exactTimeInput.classList.remove("d-none");
                exactTimeInput.required = true;
            } else {
                exactTimeInput.classList.add("d-none");
                exactTimeInput.required = false;
                exactTimeInput.value = "";
            }
        });
    }

    // Елементи для оплати та оформлення
    const checkoutBtn = document.getElementById("checkoutBtn");
    const mainOrderForm = document.getElementById("mainOrderForm");
    const paymentSelect = document.getElementById("paymentSelect");
    const processPaymentBtn = document.getElementById("processPaymentBtn");

    // Логіка підтвердження замовлення (відкриття вікна оплати або відправка)
    if (checkoutBtn && mainOrderForm) {
        checkoutBtn.addEventListener("click", function(e) {
            e.preventDefault();

            // Перевірка, чи заповнені всі обов'язкові поля
            if (!mainOrderForm.checkValidity()) {
                mainOrderForm.reportValidity();
                return;
            }

            const selectedText = paymentSelect.options[paymentSelect.selectedIndex].text.toLowerCase();

            // Якщо обрана оплата картою або Google Pay
            if (selectedText.includes("карт") || selectedText.includes("google") || selectedText.includes("pay")) {
                const orderModalEl = document.getElementById('orderModal');
                const orderModal = bootstrap.Modal.getInstance(orderModalEl) || new bootstrap.Modal(orderModalEl);
                orderModal.hide(); // Ховаємо вікно доставки

                // Показуємо вікно оплати
                setTimeout(() => {
                    const cardModalEl = document.getElementById('cardPaymentModal');
                    const cardModal = new bootstrap.Modal(cardModalEl);
                    cardModal.show();
                }, 400);

            } else {
                // Якщо обрана готівка
                alert("Дякуємо за замовлення! Бажаємо смачного! Очікуйте нашого кур'єра. 🍔🚗");
                localStorage.removeItem('cart'); // Очищаємо кошик
                mainOrderForm.submit(); // Відправляємо замовлення
            }
        });
    }

    // Логіка імітації оплати всередині вікна картки
    if (processPaymentBtn) {
        processPaymentBtn.addEventListener("click", function() {
            processPaymentBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Обробка...';
            processPaymentBtn.disabled = true;

            setTimeout(function() {
                alert("✅ Оплата пройшла успішно! Кошти списано. Бажаємо смачного!");
                localStorage.removeItem('cart');
                mainOrderForm.submit();
            }, 1500);
        });
    }
});