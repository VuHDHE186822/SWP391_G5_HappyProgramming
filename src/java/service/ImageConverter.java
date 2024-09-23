/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.util.Base64;

/**
 *
 * @author Huy Võ
 */
public class ImageConverter {

    private static ImageConverter instance = null;

    public static ImageConverter gI() {
        if (instance == null) {
            instance = new ImageConverter();
        }
        return instance;
    }
    
    public String encode(byte[] data) {
        byte[] encodeBase64 = Base64.getEncoder().encode(data);
        String out = "";
        try {
           out = new String(encodeBase64, "UTF-8");
        } catch(Exception e) {
            e.printStackTrace();
        }
        return out;
    }
    
    public byte[] decode(String base64String) {
        return Base64.getDecoder().decode(base64String);
    }
}
