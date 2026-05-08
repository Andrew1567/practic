package ua.com.kisit.demoversionglovo.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.security.Principal;
import ua.com.kisit.demoversionglovo.entity.Products;
import ua.com.kisit.demoversionglovo.entity.Categories; // Додано
import ua.com.kisit.demoversionglovo.repository.*;
import ua.com.kisit.demoversionglovo.service.FileStorageService;
import ua.com.kisit.demoversionglovo.service.CategoryService; // ПІДКЛЮЧЕНО НОВИЙ СЕРВІС

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final ProductsRepository prodRepo;
    private final BrandsRepository brandRepo;
    private final OrdersRepository orderRepo;
    private final UsersRepository usrRepo;
    private final CategoryService categoryService;
    private final FileStorageService fileStorageService;
    private final PasswordEncoder passwordEncoder;


    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("products", prodRepo.findAll());
        model.addAttribute("categories", categoryService.getAllCategories()); // Теж через сервіс
        model.addAttribute("brands", brandRepo.findAll());
        return "admin/dashboard";
    }

    @PostMapping("/product/save")
    public String saveProduct(@ModelAttribute Products product,
                              @RequestParam(value = "imageFile", required = false) MultipartFile file) {
        Products savedProduct = prodRepo.save(product);
        fileStorageService.saveProductImage(file, savedProduct.getId());
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/orders")
    public String orders(Model model, Principal principal) {
        model.addAttribute("orders", orderRepo.findAll());
        if (principal != null) {
            model.addAttribute("user", usrRepo.findByLogin(principal.getName()).orElse(null));
        }
        return "admin/orders";
    }

    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", usrRepo.findAll());
        return "admin/users";
    }

    @PostMapping({"/user/save", "/user/update"})
    public String saveUser(@ModelAttribute ua.com.kisit.demoversionglovo.entity.Users user) {
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        usrRepo.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/categories")
    public String categories(Model model) {
        // Звертаємось до сервісу
        model.addAttribute("categories", categoryService.getAllCategories());
        return "admin/categories";
    }

    @PostMapping("/category/save")
    public String saveCategory(@ModelAttribute Categories category) {
        // Логіка збереження тепер інкапсульована в сервісі
        categoryService.saveCategory(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/category/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        // Логіка видалення також у сервісі
        categoryService.deleteCategory(id);
        return "redirect:/admin/categories";
    }

    // ================= ЗАКЛАДИ (БРЕНДИ) =================
    @GetMapping("/brands")
    public String brands(Model model) {
        model.addAttribute("brands", brandRepo.findAll());
        return "admin/brands";
    }

    @PostMapping("/brand/save")
    public String saveBrand(@ModelAttribute ua.com.kisit.demoversionglovo.entity.Brands brand) {
        brandRepo.save(brand);
        return "redirect:/admin/brands";
    }

    @GetMapping("/brand/delete/{id}")
    public String deleteBrand(@PathVariable Long id) {
        brandRepo.deleteById(id);
        return "redirect:/admin/brands";
    }
}