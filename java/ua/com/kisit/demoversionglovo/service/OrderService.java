package ua.com.kisit.demoversionglovo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.com.kisit.demoversionglovo.entity.*;
import ua.com.kisit.demoversionglovo.repository.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    // Підключаємо наші спеціалізовані сервіси
    private final UserService userService;
    private final AddressService addressService;

    // Репозиторії безпосередньо для замовлень
    private final OrdersRepository orderRepository;
    private final DeliveryRepository deliveryRepository;
    private final PaymentRepository paymentRepository;
    private final ProductsRepository productsRepository;
    private final ProductInOrderRepository productInOrderRepository;

    @Transactional
    public void processNewOrder(String firstName, String lastName, String login, String password,
                                String city, String street, Long deliveryId, Long paymentId,
                                List<Long> productIds) {

        // 1. Користувачем займається UserService
        Users user = userService.findOrCreateUser(firstName, lastName, login, password);

        // 2. Адресою займається AddressService
        AddressClient address = addressService.createAddress(city, street, user);

        // 3. Створюємо основу замовлення
        Orders order = createBaseOrder(user, address, deliveryId, paymentId);

        // 4. Наповнюємо замовлення товарами та розраховуємо вартість
        BigDecimal totalSum = addProductsAndCalculateTotal(order, productIds);

        // 5. Фіксуємо кінцеву суму
        order.setTotal(totalSum);
        orderRepository.save(order);
    }

    private Orders createBaseOrder(Users user, AddressClient address, Long deliveryId, Long paymentId) {
        Orders order = new Orders();
        order.setUser(user);
        order.setAddress(address);
        order.setDate(new Date());
        order.setTotal(BigDecimal.ZERO);

        deliveryRepository.findById(deliveryId).ifPresent(order::setDelivery);
        paymentRepository.findById(paymentId).ifPresent(order::setPayment);

        return orderRepository.save(order);
    }

    private BigDecimal addProductsAndCalculateTotal(Orders order, List<Long> productIds) {
        BigDecimal totalSum = BigDecimal.ZERO;

        if (productIds != null) {
            for (Long prodId : productIds) {
                Products product = productsRepository.findById(prodId).orElse(null);
                if (product != null) {
                    ProductInOrder pio = new ProductInOrder();
                    pio.setOrder(order);
                    pio.setProduct(product);
                    pio.setQuantity(1);
                    productInOrderRepository.save(pio);

                    totalSum = totalSum.add(product.getPrice());
                }
            }
        }
        return totalSum;
    }
}