package ua.com.kisit.demoversionglovo.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.kisit.demoversionglovo.entity.Users;
import ua.com.kisit.demoversionglovo.repository.UsersRepository;
import ua.com.kisit.demoversionglovo.service.OrderService;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private UsersRepository usrRepo;

    @Autowired
    private OrderService orderService;

    @PostMapping("/make-order")
    public String makeOrder(@RequestParam String city, @RequestParam String street,
                            @RequestParam Long deliveryId, @RequestParam Long paymentId,
                            @RequestParam(required = false) List<Long> productIds,
                            HttpSession session) {

        // 1. Беремо юзера з сесії
        Users sessionUser = (Users) session.getAttribute("user");
        if (sessionUser == null) return "redirect:/";

        // 2. КЛЮЧОВИЙ МОМЕНТ: Знаходимо ЖИВОГО юзера в базі за його ID
        // Це гарантує, що Hibernate розуміє: цей юзер вже існує і створювати нового НЕ ТРЕБА.
        Users realUser = usrRepo.findById(sessionUser.getId())
                .orElseThrow(() -> new RuntimeException("Користувача не знайдено"));

        // 3. Передаємо в сервіс дані ВЖЕ ІСНУЮЧОГО користувача
        orderService.processNewOrder(
                realUser.getFirstName(),
                realUser.getLastName(),
                realUser.getLogin(),
                realUser.getPassword(),
                city,
                street,
                deliveryId,
                paymentId,
                productIds
        );

        return "redirect:/";
    }
}