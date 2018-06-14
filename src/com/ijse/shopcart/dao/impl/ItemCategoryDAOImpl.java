package com.ijse.shopcart.dao.impl;

import com.ijse.shopcart.connection.ResourceConnectionFactory;
import com.ijse.shopcart.dao.ItemCategoryDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemCategoryDAOImpl implements ItemCategoryDAO {

    private Connection connection;

    public ItemCategoryDAOImpl() throws ClassNotFoundException,SQLException{
        try {
            connection=ResourceConnectionFactory.getInstance().getResourceConnection();
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int insertItemCategory(String ItemCategory)throws SQLException {
        try {
           return  connection.createStatement().executeUpdate("INSERT INTO ITEM_CATEGORY(DESCRIPTION) VALUES('"+ItemCategory+"')");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public List<String> showAllItemCategory()throws SQLException{
        List<String> itemCategories=new ArrayList<>();
        ResultSet resultSet = null;
        try {
            resultSet = connection.createStatement().executeQuery("SELECT * FROM item_category");
            while (resultSet.next()){
                itemCategories.add(resultSet.getString(1)+"-"+resultSet.getString(2));
            }
            return itemCategories;
        } catch (SQLException e) {
            throw e;
        }
    }
}
