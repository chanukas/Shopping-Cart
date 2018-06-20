package com.ijse.shopcart.controller;



import com.ijse.shopcart.dto.ItemDTO;
import com.ijse.shopcart.service.ServiceFactory;
import com.ijse.shopcart.service.impl.ItemCategoryServiceImpl;
import com.ijse.shopcart.service.impl.ItemServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

public class ItemController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();

        ItemServiceImpl itemService= (ItemServiceImpl) ServiceFactory.getInstance().getService(ServiceFactory.ServiceTypes.ITEM);

        String iAction = req.getParameter("iAction");

        if(iAction==null){
            iAction="noAction";
        }

        if(iAction.equals("addItem")){
            String[] selectItemCategory = req.getParameter("SelectItemCategory").split("-");
            if(itemService.saveItem(new ItemDTO(req.getParameter("itemDescription"),Double.parseDouble(req.getParameter("itemPrice")),
                    Integer.parseInt(req.getParameter("itemQTYOnHand")),Integer.parseInt(selectItemCategory[0])))){

                out.println("<script type=\"text/javascript\">");
                out.println("location='add-item.jsp';");
                out.println("alert('Item has been successfully added..!');");
                out.println("</script>");
            }
        }

        if(iAction.equals("deleteItem")){
            if(itemService.removeItem(Integer.parseInt(req.getParameter("itemID")))){
                out.println("<script type=\"text/javascript\">");
                out.println("location='delete-item.jsp';");
                out.println("alert('Item has been successfully deleted..!');");
                out.println("</script>");
            }
        }

        if(iAction.equals("editItem")){
            String[] selectItemCategory = req.getParameter("SelectItemCategory").split("-");
            if(itemService.editItem(new ItemDTO(Integer.parseInt(req.getParameter("itemID")),req.getParameter("itemDescription"),
                    Double.parseDouble(req.getParameter("itemUnitPrice")),Integer.parseInt(req.getParameter("itemQTY")),Integer.parseInt(selectItemCategory[0])))){

                out.println("<script type=\"text/javascript\">");
                out.println("location='edit-item.jsp';");
                out.println("alert('Item has been successfully updated..!');");
                out.println("</script>");
            }
        }

        if(req.getAttribute("iAction")!=null){
            if(req.getAttribute("iAction").equals("ViewAllItem")){
                req.setAttribute("ItemDTOs",itemService.viewAllItem());
                req.getRequestDispatcher("view-all-item.jsp").forward(req,resp);
            }

            if(req.getAttribute("iAction").equals("ViewFromShopCart")){
                req.setAttribute("ItemDTOs",itemService.viewAllItem());
                req.getRequestDispatcher("shopping-cart.jsp").forward(req,resp);
            }

            if(req.getAttribute("iAction").equals("LastIDFromCart")){
                req.setAttribute("lastID",itemService.getLastID());
                req.getRequestDispatcher("cart.jsp").forward(req,resp);
            }

            if(req.getAttribute("iAction").equals("QtyOnHndFromCart")){
               String itemid =(String) req.getAttribute("id");
               req.setAttribute("QtyOnHand",itemService.getQtyOnHand(Integer.parseInt(itemid)));
               req.getRequestDispatcher("cart.jsp").forward(req,resp);
            }

            if(req.getAttribute("iAction").equals("QtyOnHndFromShopCart")){
                String itemid =(String) req.getAttribute("id");
                req.setAttribute("QtyOnHand",itemService.getQtyOnHand(Integer.parseInt(itemid)));
                req.getRequestDispatcher("shopping-cart.jsp").forward(req,resp);
            }
        }

        if(req.getParameter("ItemCategory")!=null){
            req.setAttribute("ItemDTOs",itemService.getSelectedItem(req.getParameter("ItemCategory")));
            req.getRequestDispatcher("shopping-cart.jsp").forward(req,resp);
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
