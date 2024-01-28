package com.mycompany.supermarket;

/**
 *
 * @author Gayan Wickz
 */
public class Items {
    private String itemName;
    private float itemPrice;
    private String base64Image;
    private String category; 

    // Constructor, getters, and setters

    public Items() {
    }

    public Items(String itemName, float itemPrice, String base64Image, String category) {
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.base64Image = base64Image;
        this.category = category;
    }

    // Getters and setters

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public float getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(float itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}