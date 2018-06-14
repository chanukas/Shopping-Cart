package com.ijse.shopcart.dao;

import com.ijse.shopcart.dao.impl.CustomerDAOImpl;
import com.ijse.shopcart.dao.impl.ItemCategoryDAOImpl;
import com.ijse.shopcart.dao.impl.ItemDAOImpl;

import java.sql.SQLException;

public class DAOFactory {

    private static DAOFactory daoFactory;

    public enum DAOTypes{
        ITEM,CUSTOMER,ITEMCATEGORY
    }

    private DAOFactory() {
    }

    public static DAOFactory getInstance(){
        if(daoFactory==null){
            daoFactory=new DAOFactory();
        }
        return daoFactory;
    }

    public SuperDAO getDAO(DAOTypes daoTypes) throws SQLException, ClassNotFoundException {
        switch (daoTypes){
            case ITEM:
                return new ItemDAOImpl();
            case CUSTOMER:
                return new CustomerDAOImpl();
            case ITEMCATEGORY:
                return new ItemCategoryDAOImpl();
                default:
                    return null;
        }
    }
}
