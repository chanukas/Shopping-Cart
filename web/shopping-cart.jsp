<%@ page import="java.util.List" %>
<%@ page import="com.ijse.shopcart.dto.ItemDTO" %><%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-18
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Shopping cart | v1</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style5.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amaranth" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3 class="animated bounceInLeft"><b style="font-size: 30px; color: black">S</b>hopping Cart</h3>
        </div>

        <ul class="list-unstyled components">
            <p class="animated zoomIn"><b>Item Category</b></p>

            <%
                if(request.getAttribute("itemCategories")==null) {
                    request.setAttribute("iAction", "ViewAllItemCategoryForShpCart");
                    request.getRequestDispatcher("ItemCategoryController").forward(request, response);
                }else{
                    List<String> stringList= (List<String>) request.getAttribute("itemCategories");
                    for (String itemcategory:stringList) {

                        String[] split = itemcategory.split("-");
            %>

            <li class="animated zoomIn">
                <a href="ItemController?ItemCategory=<%=split[0]%>"><%=itemcategory%></a>
            </li>


        <%
                }
            }

        %>
        </ul>


    </nav>

    <!-- Page Content Holder -->
    <div id="content">

        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="cart.jsp" id="cartIcon" class="fas fa-shopping-cart" style="font-size: 30px"></a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <h2 class=" animated lightSpeedIn">NEW ARRIVALS</h2>

        <%
            if(request.getAttribute("ItemDTOs")==null) {
                request.setAttribute("iAction", "ViewFromShopCart");
                request.getRequestDispatcher("ItemController").forward(request, response);
            }else{
                List<ItemDTO> items= (List<ItemDTO>) request.getAttribute("ItemDTOs");
                for (ItemDTO item:items) {

        %>

        <div class='col-md-4 animated fadeInUpBig'>
            <div class='panel panel-info'>
                <div class='panel-heading' id='productTitle<%=item.getId()%>' ><%=item.getDescription()%></div>
                <div class='panel-body' id="p-body<%=item.getId()%>">
                    QTY <label tempQTY="0" id="qty<%=item.getId()%>">0</label>
                </div>
                <input type="text" value="<%=item.getId()%>" id="itemid" hidden>
                <input type="text" id="itemPrice<%=item.getId()%>" value="<%=item.getPrice()%>" hidden>
                <div class='panel-heading'>LKR : <%=item.getPrice()%>
                    <button pid='<%=item.getId()%>' style='float:right;' id='<%=item.getId()%>' class='btn btn-danger btn-xs'>AddToCart</button>
                </div>
            </div>

            <input type="text" value="<%=item.getQtyonhand()%>" id="qtyonhand<%=item.getId()%>" hidden>

            <script>
                $("#<%=item.getId()%>").click(function () {
                    var test=parseInt($("#qty<%=item.getId()%>").attr("tempQTY"));
                    console.log(test);
                    var qtyonhand=parseInt($("#qtyonhand<%=item.getId()%>").val());
                    if(test < qtyonhand ){
                        $("#qty<%=item.getId()%>").text(test+1);
                        $("#qty<%=item.getId()%>").attr("tempQTY",test+1);

                        var d = new Date();
                        d.setTime(d.getTime() + (7*24*60*60*1000));
                        var expires = "expires="+ d.toUTCString();
                        document.cookie = <%=item.getId()%> + "=" +(parseInt(test)+1).toString()+ "-"+ $("#productTitle<%=item.getId()%>").text()+ "-" +$("#itemPrice<%=item.getId()%>").val()+";"+expires+";path=/";
                    }
                });

                var cookiearray;
                var pairArray;
                cookiearray= document.cookie.split(';');
                for (var i = 0; i < cookiearray.length; ++i) {
                    pairArray = cookiearray[i].split('=');
                    if(pairArray[1]!=undefined) {
                        if(pairArray[0] == <%=item.getId()%>){
                           var itemarray =pairArray[1].split("-");
                           $("#qty<%=item.getId()%>").text(itemarray[0]);
                            $("#qty<%=item.getId()%>").attr("tempQTY",itemarray[0]);
                        }
                    }
                }
            </script>

        </div>

        <%
                }
            }


        %>
    </div>
</div>


<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/controller.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $(this).toggleClass('active');
        });
    });

</script>
</body>
</html>