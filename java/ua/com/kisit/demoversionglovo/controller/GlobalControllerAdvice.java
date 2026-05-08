package ua.com.kisit.demoversionglovo.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import ua.com.kisit.demoversionglovo.repository.*;

@ControllerAdvice // Каже Spring'у: "Виконуй цей код перед кожним запитом"
@RequiredArgsConstructor
public class GlobalControllerAdvice {

    private final CategoriesRepository catRepo;
    private final BrandsRepository brandRepo;
    private final DeliveryRepository delRepo;
    private final PaymentRepository payRepo;
    private final UsersRepository usrRepo;

    @ModelAttribute // Цей метод автоматично додасть всі ці дані в будь-який HTML шаблон
    public void addGlobalAttributes(Model model, HttpSession session) {

        // 1. Авторизація
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            usrRepo.findByLogin(auth.getName()).ifPresent(u -> session.setAttribute("user", u));
        }

        // 2. Спільні дані для меню та модальних вікон
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("categories", catRepo.findAll());
        model.addAttribute("brands", brandRepo.findAll());
        model.addAttribute("deliveries", delRepo.findAll());
        model.addAttribute("payments", payRepo.findAll());
    }
}