package ua.com.kisit.demoversionglovo.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.kisit.demoversionglovo.repository.ProductsRepository;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final ProductsRepository prodRepo;

    // Відповідає ЛИШЕ за головну сторінку
    @GetMapping("/")
    public String home(@RequestParam(value = "error", required = false) String error, Model model) {

        // Обробка помилки входу
        if (error != null) {
            model.addAttribute("errorMessage", "Невірний Email або пароль!");
        }

        // Відображаємо всі товари
        model.addAttribute("products", prodRepo.findAll());
        model.addAttribute("categoryName", "🍔 Всі пропозиції");

        return "index";
    }
}