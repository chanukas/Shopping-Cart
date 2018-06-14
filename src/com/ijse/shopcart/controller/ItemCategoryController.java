package com.ijse.shopcart.controller;





import com.ijse.shopcart.service.ServiceFactory;
import com.ijse.shopcart.service.SuperService;
import com.ijse.shopcart.service.impl.ItemCategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ItemCategoryController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        PrintWriter out=resp.getWriter();
        ItemCategoryServiceImpl itemCategoryService= (ItemCategoryServiceImpl) ServiceFactory.getInstance().getService(ServiceFactory.ServiceTypes.ITEMCATEGORY);

        if(req.getAttribute("iAction")!=null) {
            if (req.getAttribute("iAction").equals("ViewAllItemCategory")) {
                List<String> itemCategorys = itemCategoryService.viewAllItemCategory();
                req.setAttribute("itemCategories", itemCategorys);
                req.getRequestDispatcher("add-item.jsp").forward(req, resp);
            }

            if (req.getAttribute("iAction").equals("EditItemCategory")) {
                List<String> itemCategorys = itemCategoryService.viewAllItemCategory();
                req.setAttribute("itemCategories", itemCategorys);
                req.getRequestDispatcher("edit-item.jsp").forward(req, resp);
            }

            if (req.getAttribute("iAction").equals("ShopCartHome")) {
                List<String> itemCategorys = itemCategoryService.viewAllItemCategory();
                req.setAttribute("itemCategories", itemCategorys);
                req.getRequestDispatcher("shop-cart.jsp").forward(req, resp);
            }
        }


        if(req.getParameter("itemDescription")!=null) {
            if (itemCategoryService.saveItemCategory(req.getParameter("itemDescription"))) {
                out.println("<script type=\"text/javascript\">");
                out.println("location='add-itemcategory.jsp';");
                out.println("alert('ItemCategory has been successfully addedd..!');");
                out.println("</script>");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DoPost");
    }
}
