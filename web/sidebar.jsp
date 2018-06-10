<%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-09
  Time: 10:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="images/user.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
            <p>Chanuka Sandaruwan</p>
            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
    </div>
    <!-- search form -->

    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>

        <li><a href="add-itemcategory.jsp"><i class="fa fa-book"></i> <span>Add Item Category</span></a></li>

        <li class="treeview">
            <a href="#">
                <i class="fa fa-cart-arrow-down"></i>
                <span>Manage Items</span>
                <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
            </a>
            <ul class="treeview-menu">
                <li><a href="add-item.jsp"><i class="fa fa-book"></i>Add Item</a></li>
                <li><a href="edit-Item.jsp"><i class="fa fa-edit"></i>Edit Item</a></li>
                <li><a href="delete-item.jsp"><i class="fa fa-recycle"></i>Delete Item</a></li>
                <li><a href="view-all-item.jsp"><i class="fa fa-table"></i>View All Item</a></li>
            </ul>
        </li>

        <li class="treeview">
            <a href="#">
                <i class="fa fa-user"></i>
                <span>Manage Customers</span>
                <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
            </a>
            <ul class="treeview-menu">
                <li><a href="add-customer.jsp"><i class="fa fa-book"></i>Add Customer</a></li>
                <li><a href="edit-customer.jsp"><i class="fa fa-edit"></i>Edit Customer</a></li>
                <li><a href="delete-customer.jsp"><i class="fa fa-recycle"></i>Delete Customer</a></li>
                <li><a href="view-all-customer.jsp"><i class="fa fa-table"></i>View All Customer</a></li>
            </ul>
        </li>


    </ul>
</section>
<!-- /.sidebar -->
