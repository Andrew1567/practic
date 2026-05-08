<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Demo Glovo - Доставка</title>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><circle cx=%2250%22 cy=%2250%22 r=%2250%22 fill=%22%2300a082%22/><text x=%2250%22 y=%2270%22 font-family=%22Arial%22 font-size=%2260%22 font-weight=%22bold%22 fill=%22white%22 text-anchor=%22middle%22>G</text></svg>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <script>const isLoggedIn = <#if user??>true<#else>false</#if>;</script>
</head>
<body>

<#include "blocks/navbar.ftlh">

<div class="container">

    <#if errorMessage??>
        <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
            <strong>Помилка!</strong> ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </#if>
    <#if successMessage??>
        <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
            <strong>Супер!</strong> ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </#if>

    <div class="row">
        <!-- ПІДКЛЮЧАЄМО ЛІВЕ МЕНЮ З ОКРЕМОГО ФАЙЛУ -->
        <#include "blocks/sidebar.ftlh">

        <!-- ОСНОВНА ЧАСТИНА З ТОВАРАМИ -->
        <div class="col-md-9">
            <h4 class="mb-3 text-success fw-bold">
                <#if categoryName??>${categoryName}<#else>🍔 Всі пропозиції</#if>
            </h4>

            <div class="row" id="productsGrid">
                <#list products as prod>
                    <div class="col-md-4 mb-4 product-item">
                        <div class="card h-100 shadow-sm border-0 product-card position-relative">

                            <#if prod.promotion && prod.promoPrice??>
                                <span class="badge bg-danger position-absolute top-0 start-0 m-2 p-2 z-1 shadow-sm">АКЦІЯ</span>
                            </#if>

                            <div class="card-body text-center p-4">
                                <h5 class="card-title fw-bold">${prod.name}</h5>
                                <img src="/images/products/${prod.id}.jpg"
                                     class="card-img-top mb-3 rounded shadow-sm"
                                     style="height: 180px; object-fit: cover;"
                                     alt="${prod.name}"
                                     onerror="this.onerror=null; this.src='https://placehold.co/400x300?text=Смакота';">

                                <#if prod.promotion && prod.promoPrice??>
                                    <p class="text-success fs-5 fw-bold mb-2">
                                        <span class="text-muted text-decoration-line-through fs-6 me-2">${prod.price} $</span>
                                        ${prod.promoPrice} $
                                    </p>
                                    <button type="button" class="btn btn-success w-100" onclick="addItem(this)" data-id="${prod.id?c}" data-name="${prod.name}" data-price="${prod.promoPrice?c}">Додати в кошик</button>
                                <#else>
                                    <p class="text-success fs-5 fw-bold mb-2">${prod.price} $</p>
                                    <button type="button" class="btn btn-success w-100" onclick="addItem(this)" data-id="${prod.id?c}" data-name="${prod.name}" data-price="${prod.price?c}">Додати в кошик</button>
                                </#if>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>

<#include "blocks/modals.ftlh">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/cart.js"></script>
<script src="/js/checkout.js"></script>
</body>
</html>