<nav class="navbar navbar-glovo mb-4 shadow-sm" style="background-color: #00a082;">
    <div class="container d-flex justify-content-between p-2">
        <h2 class="m-0 text-white fw-bold">GLOVO</h2>
        <input type="text" id="searchInput" class="form-control w-50" placeholder="Пошук страви...">
        <div class="d-flex align-items-center">
            <#if user??>
                <span class="text-white me-3 fw-bold">Привіт, ${user.firstName!''}!</span>

                <!-- НОВЕ: Цю кнопку бачить ТІЛЬКИ адміністратор -->
                <#if user.role == "ROLE_ADMIN">
                    <a href="/admin/dashboard" class="btn btn-sm btn-warning fw-bold me-3 shadow-sm">👑 Адмін-панель</a>
                </#if>

                <a href="/logout" class="btn btn-sm btn-outline-light me-3">Вийти</a>
            <#else>
                <button class="btn btn-outline-light me-3" data-bs-toggle="modal" data-bs-target="#authModal">🔑 Увійти / Реєстрація</button>
            </#if>
            <button class="btn btn-outline-light position-relative" data-bs-toggle="modal" data-bs-target="#cartModal">
                🛒 Кошик <span id="cartCountBadge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger d-none">0</span>
            </button>
        </div>
    </div>
</nav>