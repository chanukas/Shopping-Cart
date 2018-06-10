package com.ijse.shopcart.dto;

public class CustomerDTO {

    private int id;
    private String name;
    private String mobile;
    private String username;
    private String password;

    public CustomerDTO(int id, String name, String mobile, String username, String password) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
    }

    public CustomerDTO(String name, String mobile, String username, String password) {

        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
    }

    public CustomerDTO() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
