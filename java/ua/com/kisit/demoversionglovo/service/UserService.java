package ua.com.kisit.demoversionglovo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.com.kisit.demoversionglovo.entity.Users;
import ua.com.kisit.demoversionglovo.repository.UsersRepository;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UsersRepository usersRepository;

    public boolean getLogin(String login, String pass) {
        Users user = usersRepository.findFirstByLoginAndPassword(login, pass);
        return user != null;
    }

    public Users getUserByCredentials(String login, String pass) {
        return usersRepository.findFirstByLoginAndPassword(login, pass);
    }

    // ДОДАНО: Метод для пошуку або реєстрації клієнта під час замовлення
    public Users findOrCreateUser(String firstName, String lastName, String login, String password) {
        return usersRepository.findByLogin(login).orElseGet(() -> {
            Users newUser = new Users();
            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setLogin(login);
            newUser.setPassword(password);
            newUser.setRole("ROLE_USER");
            return usersRepository.save(newUser);
        });
    }
}