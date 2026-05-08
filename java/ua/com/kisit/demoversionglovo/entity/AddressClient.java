package ua.com.kisit.demoversionglovo.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "address_client")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class AddressClient {

    @Id// ОСЬ ЦЬОГО РЯДКА НЕ ВИСТАЧАЄ АБО ВІН НЕПРАВИЛЬНИЙ
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String city;
    private String street;
    private String building;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;
}