package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.demoversionglovo.entity.Products;
import java.util.List;

public interface ProductsRepository extends JpaRepository<Products, Long> {
    List<Products> findByCategoryId(Long categoryId);

    // ТЕПЕР ШУКАЄМО ТОВАРИ ПО БРЕНДУ (ЗАКЛАДУ)
    List<Products> findByBrandId(Long brandId);

    // Для акцій
    List<Products> findByIsPromotionTrue();
}