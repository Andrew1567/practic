<!-- Модальне вікно ОФОРМЛЕННЯ -->
<div class="modal fade" id="orderModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content text-dark">
            <div class="modal-header">
                <h5>Куди везти замовлення?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/make-order" method="post" id="mainOrderForm">
                <div class="modal-body">
                    <div id="hiddenProducts"></div>
                    <input type="text" name="city" class="form-control mb-2" placeholder="Місто" required>
                    <input type="text" name="street" class="form-control mb-3" placeholder="Вулиця та номер" required>

                    <!-- БЛОК ВИБОРУ ЧАСУ -->
                    <label class="small text-muted fw-bold">Час доставки:</label>
                    <div class="mb-3">
                        <select class="form-select mb-2" id="deliveryTimeOption" name="timeOption">
                            <option value="ASAP">Якнайшвидше (≈ 45 хв)</option>
                            <option value="EXACT">Обрати точний час</option>
                        </select>
                        <input type="time" name="exactDeliveryTime" id="exactTimeInput" class="form-control d-none">
                    </div>

                    <label class="small text-muted fw-bold">Служба доставки:</label>
                    <select name="deliveryId" class="form-select mb-2">
                        <#list deliveries as d>
                            <option value="${d.id}">${d.name!d.type}</option>
                        </#list>
                    </select>

                    <label class="small text-muted fw-bold">Спосіб оплати:</label>
                    <select name="paymentId" id="paymentSelect" class="form-select">
                        <#list payments as p>
                            <option value="${p.id}">${p.method}</option>
                        </#list>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success w-100" id="checkoutBtn">Підтвердити замовлення</button>
                </div>
            </form>
        </div>
    </div>
</div>