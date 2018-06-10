package com.ijse.shopcart.model;

public class CustomerModel {

    private int id;
    private String name;
    private String mobile;
    private String username;
    private String password;

    public CustomerModel(String name, String mobile, String username, String password) {
        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
    }

    public CustomerModel(int id, String name, String mobile, String username, String password) {

        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
    }

    public CustomerModel() {

    }


}
