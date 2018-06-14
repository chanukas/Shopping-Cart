package com.ijse.shopcart.service;

import java.util.List;

public interface ItemCategoryService extends SuperService {

    public boolean saveItemCategory(String ItemCategory);
    public List<String> viewAllItemCategory();

}
