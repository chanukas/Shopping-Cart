package com.ijse.shopcart.service;

import com.ijse.shopcart.service.impl.CustomerServiceImpl;
import com.ijse.shopcart.service.impl.ItemCategoryServiceImpl;
import com.ijse.shopcart.service.impl.ItemServiceImpl;

public class ServiceFactory {

    private static ServiceFactory serviceFactory;

    public enum ServiceTypes{
        CUSTOMER,ITEM,ITEMCATEGORY
    }

    private ServiceFactory() {
    }

    public static  ServiceFactory getInstance(){
        if(serviceFactory==null){
            serviceFactory=new ServiceFactory();
        }
        return serviceFactory;
    }

    public SuperService getService(ServiceTypes serviceTypes){
        switch (serviceTypes){
            case CUSTOMER:
                return new CustomerServiceImpl();
            case ITEMCATEGORY:
                return new ItemCategoryServiceImpl();
            case ITEM:
                return new ItemServiceImpl();
                default:
                    return null;
        }
    }
}
