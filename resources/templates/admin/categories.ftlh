<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8"><title>Категорії - Адмінка</title><link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body class="bg-light">
<#include "../blocks/navbar.ftlh">
<div class="container-fluid mt-4 mb-5"><div class="row px-3">
        <#include "blocks/sidebar.ftlh">
        <div class="col-md-10"><div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h4 class="mb-0 fw-bold"><i class="bi bi-tags text-warning"></i> Категорії меню</h4>
                    <button class="btn btn-info text-white fw-bold shadow-sm" data-bs-toggle="modal" data-bs-target="#categoryModal" onclick="openAddCategoryModal()">
                        <i class="bi bi-plus-lg me-1"></i> Додати категорію
                    </button>
                </div>
                <div class="card-body p-0"><table class="table table-hover align-middle mb-0"><thead class="table-light"><tr><th class="ps-4">ID</th><th>Назва категорії</th><th>Опис</th><th class="text-end pe-4">Дії</th></tr></thead><tbody>
                        <#list categories as cat>
                            <tr>
                                <td class="ps-4 text-muted">#${cat.id}</td><td class="fw-bold">${cat.name}</td><td>${cat.description!''}</td>
                                <td class="text-end pe-4">
                                    <div class="btn-group btn-group-sm shadow-sm">
                                        <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#categoryModal" onclick="openEditCategoryModal('${cat.id}', '${cat.name?js_string}', '${(cat.description!'')?js_string}')"><i class="bi bi-pencil-square"></i></button>
                                        <a href="/admin/category/delete/${cat.id}" class="btn btn-outline-danger" onclick="return confirm('Ви впевнені?');"><i class="bi bi-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </#list>
                        </tbody></table></div>
            </div></div>
    </div></div>


<div class="modal fade" id="categoryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="categoryForm" action="/admin/category/save" method="post">
                <input type="hidden" id="categoryId" name="id">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title fw-bold" id="categoryModalLabel">🏷️ Додати категорію</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3"><label class="form-label fw-bold">Назва категорії</label><input type="text" class="form-control" id="categoryName" name="name" required></div>
                    <div class="mb-3"><label class="form-label fw-bold">Опис</label><textarea class="form-control" id="categoryDesc" name="description" rows="3"></textarea></div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button><button type="submit" class="btn btn-info fw-bold text-white">💾 Зберегти</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/admin.js?v=2"></script>
</body></html>