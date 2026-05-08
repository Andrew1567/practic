package ua.com.kisit.demoversionglovo.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service // Ця анотація каже Spring, що це допоміжний сервіс
public class FileStorageService {

    // Винесли сюди всю логіку збереження фотографії
    public void saveProductImage(MultipartFile file, Long productId) {
        if (file != null && !file.isEmpty()) {
            try {
                String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/images/products/";
                File uploadFolder = new File(uploadDir);
                if (!uploadFolder.exists()) {
                    uploadFolder.mkdirs();
                }

                Path path = Paths.get(uploadDir + productId + ".jpg");
                Files.write(path, file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}