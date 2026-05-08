<!-- Модальне вікно АВТОРИЗАЦІЇ -->
<div class="modal fade" id="authModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content text-dark">
            <div class="modal-header">
                <h5>Авторизація</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3">
                    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#loginTab">Вхід</a></li>
                    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#regTab">Реєстрація</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="loginTab">
                        <form action="/login" method="post">
                            <input type="email" name="email" class="form-control mb-2" placeholder="Email" required>
                            <input type="password" name="password" class="form-control mb-3" placeholder="Пароль" required>
                            <button type="submit" class="btn btn-success w-100">Увійти</button>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="regTab">
                        <form action="/register" method="post">
                            <input type="text" name="firstName" class="form-control mb-2" placeholder="Ім'я" required>
                            <input type="text" name="lastName" class="form-control mb-2" placeholder="Прізвище" required>
                            <input type="email" name="email" class="form-control mb-2" placeholder="Email" required>
                            <input type="password" name="password" class="form-control mb-3" placeholder="Пароль" required>
                            <button type="submit" class="btn btn-primary w-100">Зареєструватися</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>