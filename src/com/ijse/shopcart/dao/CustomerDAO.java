package com.ijse.shopcart.dao;

import com.ijse.shopcart.model.CustomerModel;

import java.sql.SQLException;
import java.util.List;

public interface CustomerDAO extends SuperDAO {

    public int insertCustomer(CustomerModel customerModel)throws SQLException,ClassNotFoundException;
    public int updateCustomer(CustomerModel customerModel)throws SQLException,ClassNotFoundException;
    public int deleteCustomer(int id)throws SQLException,ClassNotFoundException;
    public List<CustomerModel> showAllCustomer()throws SQLException,ClassNotFoundException;
}
