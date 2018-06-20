package com.ijse.shopcart.service.impl;

import com.ijse.shopcart.dao.DAOFactory;
import com.ijse.shopcart.dao.impl.ItemDAOImpl;
import com.ijse.shopcart.dto.ItemDTO;
import com.ijse.shopcart.model.ItemModel;
import com.ijse.shopcart.service.ItemService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemServiceImpl implements ItemService {

    private ItemDAOImpl itemDAO;

    public ItemServiceImpl(){
        try {
            itemDAO= (ItemDAOImpl) DAOFactory.getInstance().getDAO(DAOFactory.DAOTypes.ITEM);
        } catch (SQLException e) {
           e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean saveItem(ItemDTO itemDTO) {
        boolean res=false;
        try {
            if(0<itemDAO.insertItem(new ItemModel(itemDTO.getDescription(),itemDTO.getPrice(),itemDTO.getQtyonhand(),itemDTO.getItemcategory()))){
                res=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean removeItem(int id) {
        boolean res=false;
        try {
            if(0<itemDAO.deleteItem(id)){
                res=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean editItem(ItemDTO itemDTO) {
        boolean res=false;
        try {
            if(0<itemDAO.updateItem(new ItemModel(itemDTO.getId(),itemDTO.getDescription(),itemDTO.getPrice(),itemDTO.getQtyonhand(),itemDTO.getItemcategory()))){
                res=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public List<ItemDTO> viewAllItem() {
        List<ItemDTO> itemDTOS=new ArrayList<>();
        try {
            List<ItemModel> itemModels = itemDAO.showAllItem();
            for (ItemModel item:itemModels) {
                itemDTOS.add(new ItemDTO(item.getId(),item.getDescription(),item.getPrice(),item.getQtyonhand(),item.getItemcategory()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itemDTOS;
    }

    @Override
    public List<ItemDTO> getSelectedItem(String id) {
        List<ItemDTO> itemDTOS=new ArrayList<>();
        try {
            List<ItemModel> selectedItems = itemDAO.getSelectedItems(id);
            for (ItemModel item:selectedItems) {
                itemDTOS.add(new ItemDTO(item.getId(),item.getDescription(),item.getPrice(),item.getQtyonhand(),item.getItemcategory()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itemDTOS;
    }

    @Override
    public int getLastID() {
        int id=0;
        try {
            id=itemDAO.getLastID();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public int getQtyOnHand(int id) {
        int curQty=0;
        try {
            curQty=itemDAO.getQtyOnHand(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return curQty;
    }
}
