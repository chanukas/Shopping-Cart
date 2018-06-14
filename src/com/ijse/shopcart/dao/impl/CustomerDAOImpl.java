package com.ijse.shopcart.dao.impl;

import com.ijse.shopcart.connection.ResourceConnectionFactory;
import com.ijse.shopcart.dao.CustomerDAO;
import com.ijse.shopcart.model.CustomerModel;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAOImpl implements CustomerDAO {

    private Connection connection;

    public CustomerDAOImpl()throws ClassNotFoundException,SQLException {
        try {
            connection=ResourceConnectionFactory.getInstance().getResourceConnection();
        } catch (ClassNotFoundException e) {
           throw e;
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int insertCustomer(CustomerModel customerModel)throws SQLException {
        try {
            return connection.createStatement().executeUpdate("INSERT INTO customer(NAME,MOBILE,USER_NAME,PASSWORD)" +
                    " VALUES('"+customerModel.getName()+"','"+customerModel.getMobile()+"','"+customerModel.getUsername()+"','"+customerModel.getPassword()+"')");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int updateCustomer(CustomerModel customerModel)throws SQLException{
        try {
            return connection.createStatement().executeUpdate("UPDATE customer SET NAME='"+customerModel.getName()+"'" +
                    ",MOBILE='"+customerModel.getMobile()+"',USER_NAME='"+customerModel.getUsername()+"',PASSWORD='"+customerModel.getPassword()+"' WHERE ID="+customerModel.getId()+"");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int deleteCustomer(int id)throws SQLException{
        try {
            return connection.createStatement().executeUpdate("DELETE FROM customer WHERE ID="+id+"");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public List<CustomerModel> showAllCustomer() throws SQLException{
        List<CustomerModel> customerModels=new ArrayList<>();
        ResultSet resultSet = null;
        try {
            resultSet = connection.createStatement().executeQuery("SELECT  * FROM customer");
            while (resultSet.next()){
                customerModels.add(new CustomerModel(resultSet.getInt(1),resultSet.getString(2),
                        resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
            }
        } catch (SQLException e) {
            throw e;
        }
        resultSet.close();
        return customerModels;

    }
}
