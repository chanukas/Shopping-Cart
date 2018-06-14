<%@ page import="java.util.List" %>
<%@ page import="com.ijse.shopcart.dto.ItemDTO" %><%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-13
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin|Poppins" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <link rel="stylesheet" href="css/sweetalert.css">

    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#" style="font-family: 'Poppins', sans-serif;"><b>S</b>hopping Cart</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="font-family: 'Poppins', sans-serif;">
                    Item Category
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                    <%
                        if(request.getAttribute("itemCategories")==null) {
                            request.setAttribute("iAction", "ShopCartHome");
                            request.getRequestDispatcher("ItemCategoryController").forward(request, response);
                        }else{
                            List<String> stringList= (List<String>) request.getAttribute("itemCategories");
                            for (String itemcategory:stringList) {

                    %>
                    <a class="dropdown-item" href="shop-cart.jsp"><%=itemcategory%></a>

                    <%
                            }
                        }
                    %>

                </div>
            </li>
        </ul>

    </div>
</nav>




    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="images/banner1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/banner2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/banner3.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <section>
        <h2 id="hedding2" style="font-family: 'Amaranth';  text-align: center;" ><b>NEW</b> ARRIVALS </h2>
        <div class="panel panel-info">

            <div style="font-family: 'Amaranth';  text-align: center; font-size: 20px" id="panel-hedding" class="panel-heading"></div>
            <div class="panel-body">
                <div id="get_product">

                </div>

            </div>
        </div>
    </section>



    <%

        if(request.getAttribute("ItemDTOs")==null) {
            request.setAttribute("iAction", "ViewFromShopCart");
            request.getRequestDispatcher("ItemController").forward(request, response);
        }else{
            List<ItemDTO> items= (List<ItemDTO>) request.getAttribute("ItemDTOs");
            for (ItemDTO item:items) {

    %>

    <div class='col-md-4'>
        <div class='panel panel-info'>
            <div class='panel-heading' id='productTitle' ><%=item.getDescription()%></div>
            <div class='panel-body'>
                <img src='images/user.jpg' style='width:250px; height:250px;'/>
            </div>
            <div class='panel-heading'>LKR<%=item.getPrice()%>
                <button pid='$pro_id' pTitle='$pro_title' pImage='$pro_image' pPrice='$pro_price' style='float:right;' id='btnAddToCart' class='btn btn-danger btn-xs'>AddToCart</button>
            </div>
        </div>
    </div>

    <%
            }
        }


    %>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <!-- /.content -->

<!-- /.content-wrapper -->

</body>
</html>
