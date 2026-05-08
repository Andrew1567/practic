<!-- ЛІВЕ МЕНЮ (Категорії, Акції, Заклади) -->
<div class="col-md-3">
    <h4 class="mb-3">Категорії</h4>
    <div class="list-group shadow-sm">
        <a href="/" class="list-group-item list-group-item-action fw-bold text-success">🍔 Всі пропозиції</a>
        <#list categories as cat>
            <a href="/category/${cat.id}" class="list-group-item list-group-item-action">${cat.name}</a>
        </#list>
    </div>

    <!-- Кнопка Акції -->
    <div class="list-group shadow-sm mt-3">
        <a href="/promotions" class="list-group-item list-group-item-action fw-bold text-danger">🔥 Акції та розпродаж</a>
    </div>

    <!-- Блок Заклади (Бренди) -->
    <h4 class="mb-3 mt-4">Заклади</h4>
    <div class="list-group shadow-sm mb-4">
        <#if brands??>
            <#list brands as brand>
                <a href="/brand/${brand.id}" class="list-group-item list-group-item-action">🏪 ${brand.name}</a>
            </#list>
        </#if>
    </div>
</div>