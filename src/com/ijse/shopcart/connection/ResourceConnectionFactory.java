package com.ijse.shopcart.connection;

import com.ijse.shopcart.connection.impl.ResourceConnectionImpl;

import java.sql.Connection;
import java.sql.SQLException;

public class ResourceConnectionFactory {

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
