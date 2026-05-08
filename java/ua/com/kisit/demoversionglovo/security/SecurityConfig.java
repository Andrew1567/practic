package ua.com.kisit.demoversionglovo.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // ДОДАНО: Бін для хешування паролів. Тепер AdminController зможе його "бачити"
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // Вимикаємо CSRF для простоти розробки
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/admin/**").hasRole("ADMIN") // Доступ до адмінки тільки адмінам
                        .anyRequest().permitAll() // Усі інші сторінки доступні всім
                )
                .formLogin(login -> login
                        .loginPage("/") // Сторінка входу (у нас це модалка на головній)
                        .loginProcessingUrl("/login") // Шлях, куди форма шле POST запит
                        .usernameParameter("email") // Поле 'name' для логіну в HTML формі
                        .passwordParameter("password") // Поле 'name' для пароля
                        .defaultSuccessUrl("/", true) // Куди кидати після успішного входу
                        .failureUrl("/?error=true") // Куди кидати при помилці
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/")
                        .permitAll()
                );

        return http.build();
    }
}