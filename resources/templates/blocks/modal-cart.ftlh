<!-- Модальне вікно КОШИК -->
<div class="modal fade" id="cartModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content text-dark">
            <div class="modal-header">
                <h5>Ваш чек</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div id="cartItemsList"></div>
                <hr>
                <div class="d-flex justify-content-between fw-bold fs-5 text-success">
                    <span>Загалом:</span> <span id="cartTotalAmount">0</span> $
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success w-100" id="btnProceed"
                        data-bs-toggle="modal"
                        data-bs-target="<#if user??>#orderModal<#else>#authModal</#if>"
                        disabled>Перейти до оформлення</button>
            </div>
        </div>
    </div>
</div>