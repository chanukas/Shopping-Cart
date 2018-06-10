package com.ijse.shopcart.connection;



import java.sql.Connection;
import java.sql.SQLException;

public interface ResourceConnection {

    public Connection getConnection()throws ClassNotFoundException,SQLException;
}
