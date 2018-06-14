package com.ijse.shopcart.service.impl;

import com.ijse.shopcart.dao.DAOFactory;
import com.ijse.shopcart.dao.SuperDAO;
import com.ijse.shopcart.dao.impl.ItemCategoryDAOImpl;
import com.ijse.shopcart.service.ItemCategoryService;

import java.sql.SQLException;
import java.util.List;

public class ItemCategoryServiceImpl implements ItemCategoryService {

    private ItemCategoryDAOImpl itemCategoryDAO;

    public ItemCategoryServiceImpl(){
        try {
            itemCategoryDAO= (ItemCategoryDAOImpl) DAOFactory.getInstance().getDAO(DAOFactory.DAOTypes.ITEMCATEGORY);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean saveItemCategory(String ItemCategory) {
        boolean res=false;
        try {
            itemCategoryDAO= (ItemCategoryDAOImpl) DAOFactory.getInstance().getDAO(DAOFactory.DAOTypes.ITEMCATEGORY);
            if(0<itemCategoryDAO.insertItemCategory(ItemCategory)){
                res=true;
            }
        } catch (SQLException e) {
           e.printStackTrace();
        } catch (ClassNotFoundException e) {
           e.printStackTrace();
        }
        return res;
    }

    @Override
    public List<String> viewAllItemCategory() {
        List<String> strings=null;
        try {
           strings = itemCategoryDAO.showAllItemCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return strings;
    }
}
