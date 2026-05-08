package ua.com.kisit.demoversionglovo.entity;

import jakarta.persistence.*;
import lombok.*;

import org.springframework.data.relational.core.mapping.Table;

import java.util.List;

@Entity
@Table(name = "brands")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Brands {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String description;

    @OneToMany(mappedBy = "brand")
    private List<Products> products;
}