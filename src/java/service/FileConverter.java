/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

/**
 *
 * @author Huy Võ
 */
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;

import java.io.File;
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

    // Phương thức mã hóa tệp thành chuỗi base64
    public String encode(File file) {
        try {
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            return Base64.getEncoder().encodeToString(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Phương thức giải mã chuỗi base64 thành tệp
    public void decode(String base64String, String outputPath) {
        byte[] decodedBytes = Base64.getDecoder().decode(base64String);
        try {
            Files.write(new File(outputPath).toPath(), decodedBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
