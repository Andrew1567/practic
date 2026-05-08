<!-- ================= МОДАЛКА ТОВАРІВ ================= -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="productForm" action="/admin/product/save" method="post" enctype="multipart/form-data">
                <input type="hidden" id="productId" name="id">

                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold" id="productModalLabel">📦 Додати товар</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Назва товару</label>
                            <input type="text" class="form-control" id="productName" name="name" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Ціна ($)</label>
                            <input type="number" step="0.01" class="form-control" id="productPrice" name="price" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Категорія</label>
                            <select class="form-select" id="productCategory" name="category.id" required>
                                <#list categories as cat>
                                    <option value="${cat.id}">${cat.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Заклад</label>
                            <select class="form-select" id="productBrand" name="brand.id" required>
                                <#list brands as brand>
                                    <option value="${brand.id}">${brand.name}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="col-12 mt-3 mb-2">
                            <label class="form-label fw-bold"><i class="bi bi-image text-success"></i> Фото товару (JPG/PNG)</label>
                            <input type="file" class="form-control" id="productImage" name="imageFile" accept="image/*">
                        </div>

                        <div class="col-12 border-top pt-3 mt-3">
                            <div class="form-check form-switch fs-5">
                                <input class="form-check-input" type="checkbox" id="productPromotion" name="promotion" value="true">
                                <label class="form-check-label fw-bold text-danger">Бере участь в акції 🔥</label>
                            </div>
                        </div>
                        <div class="col-md-6 mt-2">
                            <label class="form-label fw-bold text-danger">Акційна ціна ($)</label>
                            <input type="number" step="0.01" class="form-control border-danger" id="productPromoPrice" name="promoPrice">
                        </div>
                    </div>
                </div>

                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button>
                    <button type="submit" class="btn btn-success fw-bold">💾 Зберегти товар</button>
                </div>
            </form>
        </div>
    </div>
</div>