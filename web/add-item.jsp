<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-10
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Shopping cart | v1</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="css/_all-skins.min.css">

    <link rel="stylesheet" href="css/sweetalert.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <![endif]-->

    <!--fonts-->
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <script src="js/js/jquery.min.js"></script>

    <script>
        $(function addHederAndSidebar () {
            $("#header").load('header.jsp');
            $("#leftbar").load('sidebar.jsp');
            console.log("sidebar");
        });

    </script>

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header" id="header">

    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar" id="leftbar">

    </aside>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Add Item
                <small>Fill The Following Form To Add New Item.</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Add Item</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add Item Form</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" id="frmItem" action="ItemController">
                    <div class="box-body">


                        <div class="form-group">
                            <label for="itemDescription" class="col-sm-2 control-label">Description</label>

                            <div class="col-sm-10">
                                <input class="form-control" id="itemDescription" name="itemDescription" placeholder="Description">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="itemPrice" class="col-sm-2 control-label">Price</label>

                            <div class="col-sm-10">
                                <input class="form-control" id="itemPrice" name="itemPrice" placeholder="itemPrice">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="itemQTYOnHand" class="col-sm-2 control-label">QTY On Hand</label>

                            <div class="col-sm-10">
                                <input class="form-control" name="itemQTYOnHand"   id="itemQTYOnHand" placeholder="itemQTYOnHand">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="SelectItemCategory" class="col-sm-2 control-label">Select Item Category</label>

                            <div class="col-sm-10">
                                <input list="itemCategoris" class="form-control" id="SelectItemCategory" name="SelectItemCategory" placeholder="Any">
                            </div>
                            <datalist id="itemCategoris">
                                <%
                                    if(request.getAttribute("itemCategories")==null) {
                                        request.setAttribute("iAction", "ViewAllItemCategory");
                                        request.getRequestDispatcher("ItemCategoryController").forward(request, response);
                                    }else{
                                        List<String> stringList= (List<String>) request.getAttribute("itemCategories");
                                        for (String itemcategory:stringList) {

                                %>
                                <option value="<%=itemcategory%>"></option>

                                <%
                                        }
                                    }
                                %>

                            </datalist>
                        </div>

                    </div>

                    <input type="text" name="iAction" value="addItem" hidden>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="submit" class="btn btn-info pull-right" id="btnAddCustomer">Add Item</button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>

            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b style="font-family: 'Amaranth', sans-serif;">JACSS</b>
        </div>
        <strong>Copyright &copy; 2018 <b style="color: red">IJSE</b> </strong> All rights
        reserved.
    </footer>


    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="js/jquery.min.js"></script>

<script src="js/main-controller.js" ></script>
<script src="js/sweetalert.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>

</body>
</html>


