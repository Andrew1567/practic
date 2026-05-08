package ua.com.kisit.demoversionglovo.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ua.com.kisit.demoversionglovo.repository.BrandsRepository;
import ua.com.kisit.demoversionglovo.repository.CategoriesRepository;
import ua.com.kisit.demoversionglovo.repository.ProductsRepository;

@Controller
@RequiredArgsConstructor
public class ProductFilterController {

    private final ProductsRepository prodRepo;
    private final CategoriesRepository catRepo;
    private final BrandsRepository brandRepo;

    @GetMapping("/category/{id}")
    public String byCategory(@PathVariable Long id, Model model) {
        model.addAttribute("products", prodRepo.findByCategoryId(id));
        catRepo.findById(id).ifPresent(c -> model.addAttribute("categoryName", "Категорія: " + c.getName()));
        return "index";
    }

    @GetMapping("/brand/{brandId}")
    public String byBrand(@PathVariable Long brandId, Model model) {
        model.addAttribute("products", prodRepo.findByBrandId(brandId));
        brandRepo.findById(brandId).ifPresent(b -> model.addAttribute("categoryName", "Заклад: " + b.getName()));
        return "index";
    }

    @GetMapping("/promotions")
    public String promotions(Model model) {
        model.addAttribute("products", prodRepo.findByIsPromotionTrue());
        model.addAttribute("categoryName", "🔥 Акції та розпродаж");
        return "index";
    }
}