package com.ijse.shopcart.service;

import com.ijse.shopcart.dto.ItemDTO;

import java.sql.SQLException;
import java.util.List;

public interface ItemService extends SuperService {

    public boolean saveItem(ItemDTO itemDTO);
    public boolean removeItem(int id);
    public boolean editItem(ItemDTO itemDTO);
    public List<ItemDTO> viewAllItem();

    public List<ItemDTO> getSelectedItem(String Id);
    public int  getLastID()throws SQLException;

}
