package com.ijse.shopcart.service;

import com.ijse.shopcart.dto.CustomerDTO;
import com.ijse.shopcart.dto.ItemDTO;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService extends SuperService {

    public boolean saveCustomer(CustomerDTO customerDTO);
    public boolean removeCustomer(int id);
    public boolean editCustomer(CustomerDTO customerDTO);
    public List<CustomerDTO> viewAllCustomer();

    public boolean checkLogin(String username,String password) throws SQLException;
}
