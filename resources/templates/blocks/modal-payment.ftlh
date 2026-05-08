<!-- Модальне вікно ОПЛАТИ КАРТКОЮ -->
<div class="modal fade" id="cardPaymentModal" tabindex="-1" aria-labelledby="cardPaymentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="cardPaymentModalLabel">💳 Оплата замовлення</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-muted mb-3">Введіть реквізити картки для безпечної оплати.</p>
                <div class="mb-3">
                    <label class="form-label">Номер картки</label>
                    <input type="text" class="form-control" placeholder="XXXX XXXX XXXX XXXX" maxlength="19">
                </div>
                <div class="row">
                    <div class="col-6">
                        <label class="form-label">Термін дії</label>
                        <input type="text" class="form-control" placeholder="ММ/РР" maxlength="5">
                    </div>
                    <div class="col-6">
                        <label class="form-label">CVV</label>
                        <input type="password" class="form-control" placeholder="***" maxlength="3">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button>
                <button type="button" class="btn btn-success" id="processPaymentBtn">Оплатити</button>
            </div>
        </div>
    </div>
</div>