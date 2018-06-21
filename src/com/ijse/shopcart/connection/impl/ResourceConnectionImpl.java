package com.ijse.shopcart.connection.impl;

import com.ijse.shopcart.connection.ResourceConnection;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ResourceConnectionImpl implements ResourceConnection {

    private static ResourceConnectionImpl resourceConnection;
    private Connection connection;

    private  ResourceConnectionImpl()throws ClassNotFoundException,SQLException{
        try {

            Properties dbProperties = new Properties();
            File dbFile = new File("../settings/settings.properties");
            FileReader dbReader = new FileReader(dbFile);
            dbProperties.load(dbReader);

            String DB_URL = dbProperties.getProperty("DB_URL");
            String DB_NAME = dbProperties.getProperty("DB_NAME");
            String USERNAME = dbProperties.getProperty("USERNAME");
            String PASSWORD = dbProperties.getProperty("PASSWORD");
            String DRIVER = dbProperties.getProperty("DRIVER");


            Class.forName(DRIVER);
            connection=DriverManager.getConnection(DB_URL+DB_NAME,USERNAME,PASSWORD);
        } catch (ClassNotFoundException e) {
            throw  e;
        } catch (SQLException e) {
            throw e;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
