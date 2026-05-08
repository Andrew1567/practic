package ua.com.kisit.demoversionglovo.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "products")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private BigDecimal price;
    private boolean isPromotion;
    private BigDecimal promoPrice;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Categories category;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brands brand;

    // ДОДАНО: Зв'язок із Кухнями
    @ManyToOne
    @JoinColumn(name = "cuisine_id")
    private Cuisine cuisine;
}