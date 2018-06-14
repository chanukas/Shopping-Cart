package com.ijse.shopcart.dao;

import java.sql.SQLException;
import java.util.List;

public interface ItemCategoryDAO extends SuperDAO {

    public int insertItemCategory(String ItemCategory)throws SQLException;
    public List<String> showAllItemCategory()throws SQLException;
}
