package com.ijse.shopcart.service.impl;

import com.ijse.shopcart.dao.DAOFactory;
import com.ijse.shopcart.dao.impl.CustomerDAOImpl;
import com.ijse.shopcart.dto.CustomerDTO;
import com.ijse.shopcart.dto.ItemDTO;
import com.ijse.shopcart.model.CustomerModel;
import com.ijse.shopcart.service.CustomerService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    private CustomerDAOImpl customerDAO;

    public CustomerServiceImpl() {
        try {
            customerDAO= (CustomerDAOImpl) DAOFactory.getInstance().getDAO(DAOFactory.DAOTypes.CUSTOMER);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean saveCustomer(CustomerDTO customerDTO) {
        boolean res=false;
        try {
            if(0<customerDAO.insertCustomer(new CustomerModel(customerDTO.getName(),customerDTO.getMobile(),customerDTO.getUsername(),customerDTO.getPassword()))){
                res=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean removeCustomer(int id) {
        boolean res=false;
        try {
            if(0<customerDAO.deleteCustomer(id)){
                res=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean editCustomer(CustomerDTO customerDTO) {
        boolean res=false;
        try {
           if(0<customerDAO.updateCustomer(new CustomerModel(customerDTO.getId(),customerDTO.getName(),customerDTO.getMobile(),customerDTO.getUsername(),customerDTO.getPassword()))){
               res=true;
           }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public List<CustomerDTO> viewAllCustomer() {
        List<CustomerDTO> customerDTOS=new ArrayList<>();
        try {
            List<CustomerModel> customerModels = customerDAO.showAllCustomer();
            for (CustomerModel customer:customerModels) {
                customerDTOS.add(new CustomerDTO(customer.getId(),customer.getName(),customer.getMobile(),customer.getUsername(),customer.getPassword()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerDTOS;
    }

    @Override
    public boolean checkLogin(String username, String password)  {
        boolean result=false;
        try {
            result=customerDAO.checkLogin(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
