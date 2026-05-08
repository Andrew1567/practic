package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.demoversionglovo.entity.Cuisine;

public interface CuisineRepository extends JpaRepository<Cuisine, Long> {
}