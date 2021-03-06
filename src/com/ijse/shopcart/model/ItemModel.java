package com.ijse.shopcart.model;

public class ItemModel {

    private int id;
    private String description;
    private double price;
    private int qtyonhand;
    private int itemcategory;

    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQtyonhand(int qtyonhand) {
        this.qtyonhand = qtyonhand;
    }

    public void setItemcategory(int itemcategory) {
        this.itemcategory = itemcategory;
    }

    public int getId() {

        return id;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getQtyonhand() {
        return qtyonhand;
    }

    public int getItemcategory() {
        return itemcategory;
    }

    public ItemModel(String description, double price, int qtyonhand, int itemcategory) {

        this.description = description;
        this.price = price;
        this.qtyonhand = qtyonhand;
        this.itemcategory = itemcategory;
    }

    public ItemModel(int id, String description, double price, int qtyonhand, int itemcategory) {

        this.id = id;
        this.description = description;
        this.price = price;
        this.qtyonhand = qtyonhand;
        this.itemcategory = itemcategory;
    }

    public ItemModel() {

    }
}
