package ua.com.kisit.demoversionglovo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.com.kisit.demoversionglovo.entity.Users;
import ua.com.kisit.demoversionglovo.repository.UsersRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        // 1. Шукаємо користувача в БД за логіном
        Users user = usersRepository.findByLogin(login)
                .orElseThrow(() -> new UsernameNotFoundException("Користувача з логіном " + login + " не знайдено"));

        // 2. Передаємо дані у Spring Security
        return User.builder()
                .username(user.getLogin())
                // ВИДАЛЕНО {noop}, бо тепер у нас паролі надійно зашифровані через BCrypt
                .password(user.getPassword())
                .roles(user.getRole().replace("ROLE_", "")) // Security сам підставить префікс ROLE_
                .build();
    }
}