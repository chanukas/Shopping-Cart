package com.ijse.shopcart.controller;

import com.ijse.shopcart.dto.CustomerDTO;
import com.ijse.shopcart.service.ServiceFactory;
import com.ijse.shopcart.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();

        String cAction = req.getParameter("cAction");

        if(cAction==null){
            cAction="noAction";
        }

        CustomerServiceImpl customerService= (CustomerServiceImpl) ServiceFactory.getInstance().getService(ServiceFactory.ServiceTypes.CUSTOMER);

        if(cAction.equals("SaveCustomer")){
            if(customerService.saveCustomer(new CustomerDTO(req.getParameter("customerName"),req.getParameter("customerMobile"),
                    req.getParameter("customerUserName"),req.getParameter("customerPassword")))){

                out.println("<script type=\"text/javascript\">");
                out.println("location='add-customer.jsp';");
                out.println("alert('Customer has been successfully added..!');");
                out.println("</script>");
            }
        }

        if(cAction.equals("DeleteCustomer")){
            if(customerService.removeCustomer(Integer.parseInt(req.getParameter("customerID")))){
                out.println("<script type=\"text/javascript\">");
                out.println("location='delete-customer.jsp';");
                out.println("alert('Customer has been successfully deleted..!');");
                out.println("</script>");
            }
        }

        if(cAction.equals("EditCustomer")){
            if(customerService.editCustomer(new CustomerDTO(Integer.parseInt(req.getParameter("customerID")),req.getParameter("customerName"),
                    req.getParameter("customerMobile"),req.getParameter("customerUserName"),req.getParameter("customerPassword")))){

                out.println("<script type=\"text/javascript\">");
                out.println("location='edit-customer.jsp';");
                out.println("alert('Customer has been successfully updated..!');");
                out.println("</script>");
            }
        }

        if(cAction.equals("Login")){
            if(customerService.checkLogin(req.getParameter("username"),req.getParameter("pass"))){
               req.getSession().setAttribute("CustomerName",req.getParameter("username"));
               resp.sendRedirect("shopping-cart.jsp");
            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("location='customer-login.jsp';");
                out.println("alert('Invalid username or password try again..!');");
                out.println("</script>");
            }
        }

        if(req.getAttribute("cAction")!=null) {
            if (req.getAttribute("cAction").equals("ViewAllCustomer")) {
                req.setAttribute("customerDTOS", customerService.viewAllCustomer());
                req.getRequestDispatcher("view-all-customer.jsp").forward(req, resp);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dopost");
    }
}
