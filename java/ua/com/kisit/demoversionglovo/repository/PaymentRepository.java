package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.demoversionglovo.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {}
