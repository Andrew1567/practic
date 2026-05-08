// ================= ФУНКЦІЇ ДЛЯ ТОВАРІВ =================
function openAddModal() {
    document.getElementById('productModalLabel').innerText = '📦 Додати новий товар';
    document.getElementById('productForm').reset();
    document.getElementById('productId').value = '';
    document.getElementById('productId').disabled = true;
}

function openEditModal(id, name, price, promotion, promoPrice, categoryId, brandId) {
    document.getElementById('productModalLabel').innerText = '✏️ Редагувати товар #' + id;
    document.getElementById('productId').disabled = false;
    document.getElementById('productId').value = id;
    document.getElementById('productName').value = name;
    document.getElementById('productPrice').value = price;
    document.getElementById('productPromotion').checked = (promotion === 'true');
    document.getElementById('productPromoPrice').value = promoPrice ? promoPrice : '';
    document.getElementById('productCategory').value = categoryId;
    document.getElementById('productBrand').value = brandId;
}

// ================= ФУНКЦІЇ ДЛЯ КАТЕГОРІЙ =================
function openAddCategoryModal() {
    document.getElementById('categoryModalLabel').innerText = '🏷️ Додати нову категорію';
    document.getElementById('categoryForm').reset();
    document.getElementById('categoryId').value = '';
    document.getElementById('categoryId').disabled = true;
}

function openEditCategoryModal(id, name, description) {
    document.getElementById('categoryModalLabel').innerText = '✏️ Редагувати категорію #' + id;
    document.getElementById('categoryId').disabled = false;
    document.getElementById('categoryId').value = id;
    document.getElementById('categoryName').value = name;
    document.getElementById('categoryDesc').value = description;
}

// ================= ФУНКЦІЇ ДЛЯ ЗАКЛАДІВ =================
function openAddBrandModal() {
    document.getElementById('brandModalLabel').innerText = '🏪 Додати новий заклад';
    document.getElementById('brandForm').reset();
    document.getElementById('brandId').value = '';
    document.getElementById('brandId').disabled = true;
}

function openEditBrandModal(id, name, description) {
    document.getElementById('brandModalLabel').innerText = '✏️ Редагувати заклад #' + id;
    document.getElementById('brandId').disabled = false;
    document.getElementById('brandId').value = id;
    document.getElementById('brandName').value = name;
    document.getElementById('brandDesc').value = description;
}

// ================= ФУНКЦІЇ ДЛЯ КОРИСТУВАЧІВ =================
function openAddUserModal() {
    document.getElementById('userModalLabel').innerText = '👤 Додати нового користувача';
    document.getElementById('userForm').reset();
    // Тут ми не чіпаємо ID, бо самого поля ID у формі додавання більше немає
}

function openEditUserRoleModal(id, currentRole) {
    document.getElementById('editUserId').value = id;
    if (currentRole && currentRole.trim() !== '') {
        document.getElementById('editUserRole').value = currentRole;
    } else {
        document.getElementById('editUserRole').value = 'ROLE_USER';
    }
}