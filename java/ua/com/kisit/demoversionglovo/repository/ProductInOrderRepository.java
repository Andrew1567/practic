package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.demoversionglovo.entity.ProductInOrder;

public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {}