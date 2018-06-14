package com.ijse.shopcart.dao;

import com.ijse.shopcart.model.ItemModel;

import java.sql.SQLException;
import java.util.List;

public interface ItemDAO extends SuperDAO{

    public int insertItem(ItemModel itemModel)throws SQLException;
    public int updateItem(ItemModel itemModel)throws SQLException;
    public int deleteItem(int idS)throws SQLException;
    public List<ItemModel> showAllItem()throws SQLException;

    public List<ItemModel> getSelectedItems(String id)throws SQLException;

}
