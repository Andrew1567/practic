<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <title>Адмін-панель - Demo Glovo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body class="bg-light">

<!-- Головна шапка -->
<#include "../blocks/navbar.ftlh">

<div class="container-fluid mt-4 mb-5">
    <div class="row px-3">

        <!-- Підключаємо ліве меню адмінки -->
        <#include "blocks/sidebar.ftlh">

        <!-- ОСНОВНА ЧАСТИНА (ТАБЛИЦЯ ТОВАРІВ) -->
        <div class="col-md-10">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                    <h4 class="mb-0 fw-bold"><i class="bi bi-list-ul me-2 text-warning"></i> Управління товарами</h4>
                    <button type="button" class="btn btn-success fw-bold shadow-sm" data-bs-toggle="modal" data-bs-target="#productModal" onclick="openAddModal()">
                        <i class="bi bi-plus-lg me-1"></i> Додати товар
                    </button>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Фото</th>
                                <th>Назва</th>
                                <th>Категорія</th>
                                <th>Заклад</th>
                                <th>Ціна</th>
                                <th>Акція</th>
                                <th class="text-end pe-4">Дії</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list products as prod>
                                <tr>
                                    <td class="ps-4 text-muted">#${prod.id}</td>
                                    <td>
                                        <img src="/images/products/${prod.id}.jpg" alt="${prod.name}" class="rounded shadow-sm" style="width: 50px; height: 50px; object-fit: cover;" onerror="this.src='https://placehold.co/50x50?text=Смакота';">
                                    </td>
                                    <td class="fw-bold">${prod.name}</td>
                                    <td><span class="badge bg-light text-dark border">${prod.category.name}</span></td>
                                    <td><span class="badge bg-light text-dark border"><i class="bi bi-shop"></i> ${prod.brand.name}</span></td>
                                    <td class="fw-bold text-success">${prod.price} $</td>
                                    <td>
                                        <#if prod.promotion>
                                            <span class="badge bg-danger">Так (${prod.promoPrice!} $)</span>
                                        <#else>
                                            <span class="badge bg-secondary">Ні</span>
                                        </#if>
                                    </td>
                                    <td class="text-end pe-4">
                                        <div class="btn-group btn-group-sm shadow-sm" role="group">
                                            <button type="button" class="btn btn-outline-primary" title="Редагувати"
                                                    data-bs-toggle="modal" data-bs-target="#productModal"
                                                    onclick="openEditModal('${prod.id}', '${prod.name?js_string}', '${prod.price?c}', '${prod.promotion?c}', '${(prod.promoPrice!'')}', '${prod.category.id}', '${prod.brand.id}')">
                                                <i class="bi bi-pencil-square"></i>
                                            </button>
                                            <a href="/admin/product/delete/${prod.id}" class="btn btn-outline-danger" title="Видалити" onclick="return confirm('Ви впевнені, що хочете видалити цей товар?');">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-white py-3 text-muted text-center">
                    Всього товарів у базі: <strong>${products?size}</strong>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Підключаємо всі модальні вікна адмінки -->
<#include "blocks/modals.ftlh">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Підключаємо зовнішній файл зі скриптами адмінки -->
<script src="/js/admin.js"></script>

</body>
</html>