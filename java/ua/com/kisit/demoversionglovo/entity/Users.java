package ua.com.kisit.demoversionglovo.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@jakarta.persistence.Table(name = "users")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String firstName;
    private String lastName;
    private String login;
    private String password;

    // НОВЕ ПОЛЕ: Роль користувача (за замовчуванням звичайний клієнт)
    @Column(name = "role")
    private String role = "ROLE_USER";

    @OneToMany(mappedBy = "user")
    private List<AddressClient> addresses;

    @OneToMany(mappedBy = "user")
    private List<Orders> orders;
}