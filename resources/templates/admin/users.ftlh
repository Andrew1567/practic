<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Користувачі - Адмінка</title>
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
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h4 class="mb-0 fw-bold"><i class="bi bi-people text-warning me-2"></i> Зареєстровані користувачі</h4>
                    <button type="button" class="btn btn-success fw-bold shadow-sm" data-bs-toggle="modal" data-bs-target="#userModal" onclick="openAddUserModal()">
                        <i class="bi bi-person-plus me-1"></i> Додати користувача
                    </button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Ім'я</th>
                                <th>Прізвище</th>
                                <th>Логін (Email)</th>
                                <th>Роль</th>
                                <th class="text-end pe-4">Дії</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users as u>
                                <tr>
                                    <td class="ps-4 text-muted">#${u.id}</td>
                                    <td class="fw-bold">${u.firstName!''}</td>
                                    <td>${u.lastName!''}</td>
                                    <td>${u.login!''}</td>
                                    <td>
                                        <#if u.role?? && u.role == 'ROLE_ADMIN'>
                                            <span class="badge bg-danger">ROLE_ADMIN</span>
                                        <#elseif u.role?? && u.role == 'ROLE_MANAGER'>
                                            <span class="badge bg-warning text-dark">ROLE_MANAGER</span>
                                        <#elseif u.role??>
                                            <span class="badge bg-primary">${u.role}</span>
                                        <#else>
                                            <span class="badge bg-secondary">USER</span>
                                        </#if>
                                    </td>
                                    <td class="text-end pe-4">
                                        <button type="button" class="btn btn-sm btn-outline-primary shadow-sm"
                                                data-bs-toggle="modal" data-bs-target="#userRoleModal"
                                                onclick="openEditUserRoleModal('${u.id}', '${u.role!''}')">
                                            <i class="bi bi-person-gear"></i> Роль
                                        </button>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="userForm" action="/admin/user/save" method="post">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold" id="userModalLabel">👤 Додати користувача</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Логін (Email)</label>
                        <input type="text" class="form-control" id="userLogin" name="login" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Пароль</label>
                        <input type="password" class="form-control" id="userPassword" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Роль</label>
                        <select class="form-select" id="userRole" name="role" required>
                            <option value="ROLE_USER">ROLE_USER (Клієнт)</option>
                            <option value="ROLE_MANAGER">ROLE_MANAGER (Менеджер)</option>
                            <option value="ROLE_ADMIN">ROLE_ADMIN (Адміністратор)</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button>
                    <button type="submit" class="btn btn-success fw-bold">💾 Зберегти</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="userRoleModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="userRoleForm" action="/admin/user/update-role" method="post">
                <input type="hidden" id="editUserId" name="id">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"> Права доступу</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold text-muted">Оберіть нову роль:</label>
                        <select class="form-select border-primary" id="editUserRole" name="role" required>
                            <option value="ROLE_USER">ROLE_USER</option>
                            <option value="ROLE_MANAGER">ROLE_MANAGER</option>
                            <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Скасувати</button>
                    <button type="submit" class="btn btn-primary fw-bold">💾 Зберегти</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/admin.js"></script>
</body>
</html>