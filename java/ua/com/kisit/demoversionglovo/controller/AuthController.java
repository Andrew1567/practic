package ua.com.kisit.demoversionglovo.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder; // Додано
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.com.kisit.demoversionglovo.entity.Users;
import ua.com.kisit.demoversionglovo.repository.UsersRepository;

@Controller
public class AuthController {

    @Autowired
    private UsersRepository usrRepo;

    @Autowired
    private PasswordEncoder passwordEncoder; // Додано для шифрування

    @PostMapping("/register")
    public String register(@RequestParam String firstName, @RequestParam String lastName,
                           @RequestParam String email, @RequestParam String password,
                           HttpSession session, RedirectAttributes redirectAttributes) {

        boolean userExists = usrRepo.findAll().stream()
                .anyMatch(u -> u.getLogin().equals(email));

        if (userExists) {
            redirectAttributes.addFlashAttribute("errorMessage", "Користувач з таким Email вже зареєстрований!");
            return "redirect:/";
        }

        Users user = new Users();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setLogin(email);

        // ШИФРУЄМО ПАРОЛЬ ПЕРЕД ЗБЕРЕЖЕННЯМ
        user.setPassword(passwordEncoder.encode(password));

        // ОБОВ'ЯЗКОВО: Встановлюємо роль, інакше Spring Security не пустить
        user.setRole("ROLE_USER");

        user = usrRepo.save(user);

        redirectAttributes.addFlashAttribute("successMessage", "Реєстрація пройшла успішно! Тепер увійдіть.");
        return "redirect:/";
    }
}