package com.ijse.shopcart.connection.impl;

import com.ijse.shopcart.connection.ResourceConnection;
import com.ijse.shopcart.constants.Constants;


import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ResourceConnectionImpl implements ResourceConnection {

    private static ResourceConnectionImpl resourceConnection;
    private Connection connection;

    private  ResourceConnectionImpl()throws ClassNotFoundException,SQLException{
        try {
            Class.forName(Constants.DRIVER);
            connection=DriverManager.getConnection(Constants.DB_URL+Constants.DB_NAME,Constants.USERNAME,Constants.PASSWORD);
        } catch (ClassNotFoundException e) {
            throw  e;
        } catch (SQLException e) {
            throw e;
        }
    }

    public static synchronized ResourceConnectionImpl getInstance() throws SQLException,ClassNotFoundException {
        if (resourceConnection == null) {
            resourceConnection = new ResourceConnectionImpl();
            return resourceConnection;
        } else {
            return resourceConnection;
        }
    }

    @Override
    public  Connection getConnection()throws ClassNotFoundException,SQLException{
       return connection;
    }
}
