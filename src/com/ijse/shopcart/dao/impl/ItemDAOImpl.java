package com.ijse.shopcart.dao.impl;

import com.ijse.shopcart.connection.ResourceConnectionFactory;
import com.ijse.shopcart.dao.ItemDAO;
import com.ijse.shopcart.model.ItemModel;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl implements ItemDAO {

    Connection connection;

    public ItemDAOImpl() throws SQLException, ClassNotFoundException {
        connection=ResourceConnectionFactory.getInstance().getResourceConnection();
    }

    @Override
    public int insertItem(ItemModel itemModel)throws SQLException {
        try {
            return connection.createStatement().executeUpdate("INSERT INTO ITEM(DESCRIPTION,PRICE,QTY_ON_HAND,ITEM_CATEGORY_ID) " +
                    "VALUES('"+itemModel.getDescription()+"','"+itemModel.getPrice()+"',"+itemModel.getQtyonhand()+","
                    +itemModel.getItemcategory()+")");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int updateItem(ItemModel itemModel)throws SQLException{
        try {
            return connection.createStatement().executeUpdate("UPDATE item SET DESCRIPTION='"+itemModel.getDescription()+"'" +
                    ",PRICE='"+itemModel.getPrice()+"',QTY_ON_HAND="+itemModel.getQtyonhand()+",ITEM_CATEGORY_ID="+itemModel.getItemcategory()+" WHERE ID="+itemModel.getId()+"");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int deleteItem(int id)throws SQLException  {
        try {
            return connection.createStatement().executeUpdate("DELETE FROM item WHERE ID="+id+"");
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public List<ItemModel> showAllItem() throws SQLException {
        List<ItemModel> itemModels=new ArrayList<>();
        try {
            ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM item");
            while (resultSet.next()){
                itemModels.add(new ItemModel(resultSet.getInt(1),resultSet.getString(2),resultSet.getDouble(3),resultSet.getInt(4),resultSet.getInt(5)));
            }
        } catch (SQLException e) {
            throw e;
        }
        return itemModels;
    }

    @Override
    public List<ItemModel> getSelectedItems(String id)throws SQLException {
        List<ItemModel> itemModels=new ArrayList<>();
        ResultSet resultSet = null;
        try {
            resultSet = connection.createStatement().executeQuery("SELECT * FROM item WHERE ITEM_CATEGORY_ID="+id+"");
            while (resultSet.next()){
                itemModels.add(new ItemModel(resultSet.getInt(1),resultSet.getString(2),resultSet.getDouble(3),resultSet.getInt(4),resultSet.getInt(5)));
            }
        } catch (SQLException e) {
            throw e;
        }
        return itemModels;
    }

    @Override
    public int getLastID()throws SQLException {
        int id=0;
        ResultSet resultSet = null;
        try {
            resultSet = connection.createStatement().executeQuery("SELECT ID FROM item ORDER BY id DESC limit 1");
            while (resultSet.next()){
                id=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw e;
        }
        return id;

    }

    @Override
    public int getQtyOnHand(int id)throws SQLException{
        int qtyonhand=0;
        try {
            ResultSet resultSet = connection.createStatement().executeQuery("SELECT QTY_ON_HAND FROM item WHERE ID=" + id + "");
            while (resultSet.next()){
                qtyonhand=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw e;
        }
        return qtyonhand;
    }
}
