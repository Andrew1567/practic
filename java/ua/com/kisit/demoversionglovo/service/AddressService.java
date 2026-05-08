package ua.com.kisit.demoversionglovo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.com.kisit.demoversionglovo.entity.AddressClient;
import ua.com.kisit.demoversionglovo.entity.Users;
import ua.com.kisit.demoversionglovo.repository.AddressClientRepository;

@Service
@RequiredArgsConstructor
public class AddressService {

    private final AddressClientRepository addressRepository;

    public AddressClient createAddress(String city, String street, Users user) {
        AddressClient address = new AddressClient();
        address.setCity(city);
        address.setStreet(street);
        address.setUser(user);
        return addressRepository.save(address);
    }
}