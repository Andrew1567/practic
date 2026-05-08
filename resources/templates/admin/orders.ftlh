<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Замовлення - Адмінка</title>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body class="bg-light">

<#include "../blocks/navbar.ftlh">

<div class="container-fluid mt-4 mb-5">
    <div class="row px-3">

        <#include "blocks/sidebar.ftlh">

        <div class="col-md-10">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h4 class="mb-0 fw-bold"><i class="bi bi-cart-check text-warning me-2"></i> Список замовлень</h4>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Клієнт</th>
                                <th>Місто та Вулиця</th>
                                <th>Сума</th>
                                <th>Дата</th>
                                <th>Дії</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list orders as order>
                                <tr>
                                    <td class="ps-4 text-muted">#${order.id}</td>
                                    <td class="fw-bold">${order.user.firstName!''} ${order.user.lastName!''}</td>

                                    <td>
                                        <#if order.address??>
                                            ${order.address.city}, ${order.address.street}
                                        <#else>
                                            <span class="text-muted">Без адреси</span>
                                        </#if>
                                    </td>

                                    <td class="text-success fw-bold">${order.total} $</td>
                                    <td>${order.date?string('dd.MM.yyyy HH:mm')}</td>

                                    <!-- Кнопка, яка відкриває деталі -->
                                    <td>
                                        <button class="btn btn-sm btn-outline-info fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#orderDetails${order.id}">
                                            <i class="bi bi-list-ul"></i> Деталі
                                        </button>
                                    </td>
                                </tr>

                                <!-- ПРИХОВАНИЙ РЯДОК З ТОВАРАМИ -->
                                <tr class="collapse" id="orderDetails${order.id}">
                                    <td colspan="6" class="bg-white p-4 border-bottom shadow-inner">
                                        <h6 class="fw-bold text-muted mb-3"><i class="bi bi-bag"></i> Вміст замовлення #${order.id}:</h6>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <ul class="list-group list-group-flush border rounded">
                                                    <!-- ТУТ ЗМІНЕНО НА order.items -->
                                                    <#if order.items?? && order.items?has_content>
                                                        <#list order.items as pio>
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    <span>
                                                                        <i class="bi bi-check2 text-success me-2"></i>
                                                                        ${pio.product.name}
                                                                        <span class="badge bg-secondary ms-2">x ${pio.quantity} шт</span>
                                                                    </span>
                                                                <span class="fw-bold">${pio.product.price} $</span>
                                                            </li>
                                                        </#list>
                                                    <#else>
                                                        <li class="list-group-item text-muted">Немає деталей про товари.</li>
                                                    </#if>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-white py-3 text-muted text-center">
                    Всього замовлень: <strong>${orders?size}</strong>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>