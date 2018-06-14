package com.ijse.shopcart.connection;

import com.ijse.shopcart.connection.impl.ResourceConnectionImpl;

import java.sql.Connection;
import java.sql.SQLException;

public class ResourceConnectionFactory {

    private static ResourceConnectionFactory resourceConnectionFactory;

    private ResourceConnectionFactory() {
    }

    public static ResourceConnectionFactory getInstance(){
        if(resourceConnectionFactory==null){
            resourceConnectionFactory=new ResourceConnectionFactory();
        }
        return resourceConnectionFactory;
    }

    public Connection getResourceConnection()throws ClassNotFoundException,SQLException{
        try {
            return ResourceConnectionImpl.getInstance().getConnection();
        } catch (ClassNotFoundException e) {
           throw e;
        } catch (SQLException e) {
            throw e;
        }
    }
}
