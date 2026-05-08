package ua.com.kisit.demoversionglovo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.com.kisit.demoversionglovo.entity.Categories;
import ua.com.kisit.demoversionglovo.repository.CategoriesRepository;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {

    private final CategoriesRepository categoriesRepository;

    public List<Categories> getAllCategories() {
        return categoriesRepository.findAll();
    }
    public void saveCategory(Categories category) {
        categoriesRepository.save(category);
    }
    public void deleteCategory(Long id) {
        categoriesRepository.deleteById(id);
    }
}