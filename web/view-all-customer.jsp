<%@ page import="java.util.List" %>
<%@ page import="com.ijse.shopcart.dto.CustomerDTO" %><%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-10
  Time: 1:04 PM
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
    <!-- DataTables -->
    <link rel="stylesheet" href="css/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="css/_all-skins.min.css">


    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


    <!--fonts-->
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                All Customers
                <small>Following Table Shows All Saved Customers.</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">View All Customers</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- /.box -->

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">View All Customers</h3>
                        </div>
                        <!-- /.box-header -->
                        <form id="frmCustomer">
                            <div class="box-body">
                                <table id="tblItems" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Customer ID</th>
                                        <th>Customer Name</th>
                                        <th>Customer Mobile</th>
                                        <th>Customer UserName</th>
                                        <th>Customer Password</th>

                                    </tr>
                                    </thead>

                                    <tbody>

                                    <%
                                        if(request.getAttribute("customerDTOS")==null) {
                                            request.setAttribute("cAction", "ViewAllCustomer");
                                            request.getRequestDispatcher("CustomerController").forward(request, response);
                                        }else{
                                            List<CustomerDTO> customerDTOS= (List<CustomerDTO>) request.getAttribute("customerDTOS");
                                            for (CustomerDTO customer:customerDTOS) {

                                    %>

                                    <tr>
                                        <td><%=customer.getId()%></td>
                                        <td><%=customer.getName()%></td>
                                        <td><%=customer.getMobile()%></td>
                                        <td><%=customer.getUsername()%></td>
                                        <td><%=customer.getPassword()%></td>
                                    </tr>

                                    <%
                                            }

                                        }
                                    %>

                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
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
<!-- Bootstrap 3.3.7 -->
<script src="js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="js/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="css/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="js/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<!-- page script -->
<script>
    $(function () {
        $('#tblItems').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })
</script>


</body>
</html>
