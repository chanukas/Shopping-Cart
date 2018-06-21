<%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-19
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<% if(session.getAttribute("CustomerName")==null){
    response.sendRedirect("customer-login.jsp");
}else{
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/cart.css">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping cart | v1</title>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

</head>
<body>

<div class="container">
    <form action="ItemController">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">Product</th>
            <th style="width:10%">Price</th>
            <th style="width:8%">Quantity</th>
            <th style="width:22%" class="text-center">Subtotal</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>

        <%

            double total=0;

            if(request.getAttribute("lastID")==null) {
                request.setAttribute("iAction", "LastIDFromCart");
                request.getRequestDispatcher("ItemController").forward(request, response);
            }else {
                Integer id = (Integer) request.getAttribute("lastID");


                Cookie[] cookies = request.getCookies();
                String otpCookie = null;

                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        Cookie cookie = cookies[i];
                        for (int j = 0; j <= id+1; j++) {
                            if (cookie.getName().equals(j + "")) {

                                String[] split = cookie.getValue().split("/");


        %>
        <tr id="itemTR<%=cookie.getName()%>">
            <td data-th="Product">
                <div class="row">
                    <div class="col-sm-10">
                        <h4 class="nomargin"><%=split[1]%></h4>

                    </div>
                </div>

            </td>

            <td data-th="Price">LKR :<%=split[2]%></td>

            <%

                Integer qtyonhnad=null;

                if(request.getAttribute("QtyOnHand")==null) {
                    request.setAttribute("iAction", "QtyOnHndFromCart");
                    request.setAttribute("id", cookie.getName());
                    request.getRequestDispatcher("ItemController").forward(request, response);
                }else {

                     qtyonhnad= (Integer) request.getAttribute("QtyOnHand");
                }

            %>
            <td data-th="Quantity">
                <input type="number" min = "0" max="<%=qtyonhnad%>"  readonly id="qty<%=cookie.getName()%>" class="form-control text-center" onclick="addSubTotal<%=cookie.getName()%>()" value="<%=split[0]%>">
            </td>
            <td data-th="Subtotal" class="text-center" id="subTotal<%=cookie.getName()%>">LKR :<%=Double.parseDouble(split[2])*Integer.parseInt(split[0])%></td>
            <td class="actions" data-th="">
                <button class="btn btn-danger btn-sm" type="button" id="btnDelete<%=cookie.getName()%>"><i class="fa fa-trash-o"></i></button>
            </td>

        </tr>

        <script>

            $("#btnDelete<%=cookie.getName()%>").click(function () {
                var total=$("#subTotal<%=cookie.getName()%>").html().split(":");
                $('#itemTR<%=cookie.getName()%>').remove();
                document.cookie = <%=cookie.getName()%> + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';

                var sub=$("#total>strong").html().split(":");

                var grandTotal=parseFloat(sub[1]-total[1]);
                $("#total>strong").html("Total : " + grandTotal + ".00");
            });

            var curQTY<%=cookie.getName()%>=$("#qty<%=cookie.getName()%>").val();

            function addSubTotal<%=cookie.getName()%>() {
               var qty=$("#qty<%=cookie.getName()%>").val();
               $("#subTotal<%=cookie.getName()%>").html("LKR :"+(qty*(<%=Double.parseDouble(split[2])%>))+".0");

               if(qty>curQTY<%=cookie.getName()%>) {

                   var sub = $("#total>strong").html().split(":");
                   var total = (<%=Double.parseDouble(split[2])%>+parseFloat(sub[1]));

                   $("#total>strong").html("Total : " + total + ".00");
                   $("#total>strong").addClass("animated fadeIn");

                   curQTY<%=cookie.getName()%> = qty;
               }
               if(qty<curQTY<%=cookie.getName()%> && qty>=0){
                   var sub=$("#total>strong").html().split(":");
                   var total=(parseFloat(sub[1])-<%=Double.parseDouble(split[2])%>);

                   $("#total>strong").html("Total : "+total+".00");
                   $("#total>strong").addClass("animated pulse");
                   curQTY<%=cookie.getName()%>=qty;
               }

            }

        </script>

        <%
                                total+=Double.parseDouble(split[2]);

                            }
                        }
                   }
                }
            }
        %>

        </tbody>
        <tfoot>
        <tr>
            <td><a href="shopping-cart.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center" id="total"><strong>Total : <%=total%></strong></td>
            <td><button type="submit" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></button></td>
        </tr>
        </tfoot>
    </table>
        <input type="text" value="ItemCart" name="iAction" hidden>
    </form>
</div>

<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

</body>
</html>
<%}%>