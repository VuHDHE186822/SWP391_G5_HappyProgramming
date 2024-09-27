package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;

public class FileConverter {

    private static FileConverter instance = null;

    public static FileConverter getInstance() {
        if (instance == null) {
            instance = new FileConverter();
        }
        return instance;
    }

    public String encode(File file) {
        try {
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            return Base64.getEncoder().encodeToString(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Phương thức giải mã Base64 về file
    public File decode(String base64String, String fileName) {
        try {
            byte[] fileBytes = Base64.getDecoder().decode(base64String);
            File file = new File(fileName);
            try (FileOutputStream fos = new FileOutputStream(file)) {
                fos.write(fileBytes);
            }
            return file; // Trả về file đã tạo
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}