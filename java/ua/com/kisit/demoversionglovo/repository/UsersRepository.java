package ua.com.kisit.demoversionglovo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.com.kisit.demoversionglovo.entity.Users;
import java.util.Optional;

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {

    Users findFirstByLoginAndPassword(String login, String password);

    Optional<Users> findByLogin(String login);

}