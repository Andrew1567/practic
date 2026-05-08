package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.demoversionglovo.entity.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {}