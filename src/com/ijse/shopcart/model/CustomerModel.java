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

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {

        return id;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
