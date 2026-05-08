package ua.com.kisit.demoversionglovo.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Table(name = "cuisines")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Cuisine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name; // Наприклад: "Азіатська", "Італійська", "Українська"

    @OneToMany(mappedBy = "cuisine")
    private List<Products> products;
}