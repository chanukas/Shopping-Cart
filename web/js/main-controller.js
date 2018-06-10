function loadAllCustomers() {
    var ajaxConfig = {
        method: "POST",
        url: "view-all-customer.php",
        async: true,
        data: $("#frmCustomer").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){

        $("#tblCustomers tbody").html("");

        for(var index in response){
            var row = response[index];
            var html = "<tr>" +
                "<td id='id'>" + row[0]  + "</td>" +
                "<td id='name'>" + row[1] + "</td>" +
                "<td id='address'>" + row[2] + "</td>" +
                "<td id='salary'> " + row[3] + "</td>" +
                "</tr>"
            $("#tblCustomers tbody").append(html);
        }
    });
}
loadAllCustomers();

function loadAllItems() {
    var ajaxConfig = {
        method: "POST",
        url: "view-all-item.php",
        async: true,
        data: $("#frmItem").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){

        $("#tblItems tbody").html("");

        for(var index in response){
            var row = response[index];
            var html = "<tr>" +
                "<td id='id'>" + row[0]  + "</td>" +
                "<td id='name'>" + row[1] + "</td>" +
                "<td id='address'>" + row[2] + "</td>" +
                "<td id='salary'> " + row[3] + "</td>" +
                "</tr>"
            $("#tblItems tbody").append(html);
        }
    });
}
loadAllItems();

$("#btnAddCustomer").click(function () {

    var ajaxConfig = {
        method : "POST",
        url: "save-customer.php",
        async: true,
        data: $("#frmCustomer").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Customer has been successfully added..!", "success");

        }else{
            swal("Error!", "Failed to save the customer..!", "error");
        }
    });
});

$("#btnSearch").click(function () {
    var ajaxConfig = {
        method : "GET",
        url: "search-customer.php",
        async: true,
        data: $("#frmCustomer").serialize(),
        dataType: "json"
    }
    $.ajax(ajaxConfig).done(function(response){
        if(response == false){
            swal("Error!", "No Such Customer..!!", "error");
        }else{
            $("#customerName").val(response[1]);
            $("#customerAddress").val(response[2]);
            $("#customerSalary").val(response[3]);
        }
    });
});

$("#btnEditCustomer").click(function () {
    var ajaxConfig = {
        method : "POST",
        url: "modify-customer.php",
        async: true,
        data: $("#frmCustomer").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Customer has been successfully updated..!", "success");

        }else{
            swal("Error!", "Failed to update the customer..!", "error");
        }
    });
});

$("#btnDeleteCustomer").click(function () {
    var ajaxConfig = {
        method : "POST",
        url: "remove-customer.php",
        async: true,
        data: $("#frmCustomer").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Customer has been successfully deleted..!", "success");

        }else{
            swal("Error!", "Failed to delete the customer..!", "error");
        }
    });
});

$("#btnAddItem").click(function () {

    var ajaxConfig = {
        method : "POST",
        url: "save-item.php",
        async: true,
        data: $("#frmItem").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Item has been successfully added..!", "success");
        }else{
            swal("Error!", "Failed to save the item..!", "error");
        }
    });
});

$("#btnSearchItem").click(function () {
    var ajaxConfig = {
        method : "GET",
        url: "search-item.php",
        async: true,
        data: $("#frmItem").serialize(),
        dataType: "json"
    }
    $.ajax(ajaxConfig).done(function(response){
        if(response == false){
            swal("Error!", "No Such Item..!!", "error");
        }else{
            $("#itemDescription").val(response[1]);
            $("#itemQTY").val(response[2]);
            $("#itemUnitPrice").val(response[3]);
        }
    });
});

$("#btnEditItem").click(function () {
    var ajaxConfig = {
        method : "POST",
        url: "modify-item.php",
        async: true,
        data: $("#frmItem").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Item has been successfully updated..!", "success");

        }else{
            swal("Error!", "Failed to update the item..!", "error");
        }
    });
});

$("#btnDeleteItem").click(function () {
    var ajaxConfig = {
        method : "POST",
        url: "remove-item.php",
        async: true,
        data: $("#frmItem").serialize(),
        dataType: "json"
    }

    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Item has been successfully deleted..!", "success");

        }else{
            swal("Error!", "Failed to delete the item..!", "error");
        }
    });
});

$("#itemDescription").change(function () {

    $("#placeOrderAction").val("item");
    $("#itemQty").val("");
    $("#itemUnitPrice").val("");
    var ajaxConfig = {
        method : "POST",
        url: "place-order-detail.php",
        async: true,
        data: $("#frmPlaceOrder").serialize(),
        dataType: "json"
    }
    $.ajax(ajaxConfig).done(function(response){
        if(response == false){
            swal("Error!", "No Such Item..!!", "error");
        }else{
            $("#itemQty").val(response[2]);
            $("#itemUnitPrice").val(response[3]);
            $("#txtitemId").val(response[0]);
        }
    });
});

$("#btnSavePlaceOrder").click(function () {
    var UnitPrice=$("#itemUnitPrice").val();
    var EnterQTY=$("#enterQty").val();
    var html = "<tr>" +
        "<td id='description'>"  + $("#txtitemId").val()+ "</td>" +
        "<input type='hidden' name='txtId[]' value='"+$("#txtitemId").val()+"'> " +
        "<td id='description'>" + $("#itemDescription").val()+ "</td>"+
        "<input type='hidden'  name='txtdescription[]' value='"+$("#itemDescription").val()+"'> " +
        "<td id='itemqty'>" + $("#itemQty").val() + "</td>" +
        "<input type='hidden' name='txtItemQty[]' value='"+$("#itemQty").val()+"'> " +
        "<td id='itemunitprice'>" +UnitPrice+ "</td>" +
        "<input type='hidden' name='txtUnitPrice[]' value='"+UnitPrice+"'> " +
        "<td id='total'> " + UnitPrice*EnterQTY+ "</td>" +
        "<input type='hidden' name='txtTotal[]' value='"+UnitPrice*EnterQTY+"'> " +
        "</tr>";
    $("#tblPlaceOrder tbody").append(html);

});
function InsertNewRow () {
    var table = document.getElementById ("tblCustomers");
    var row = table.insertRow (1);
    var cell = row.insertCell (0);
    cell.innerHTML = "New row";
}

$("#btnPlaceOrder").click(function () {
    $("#placeOrderAction").val("placeorder");
    // var orderid=$("#orderId").val();
    // var date=$("#SelectDate").val();
    // var customerID=$("#selectCustomerID").val().substr(1);


    // $("#tblPlaceOrder tbody tr input").each( function(){
    //
    //  array=$(this).val();
    // });

    var ajaxConfig = {
        method : "POST",
        url: "place-order-detail.php",
        async: true,
        data: $("#frmPlaceOrder").serialize(),
        dataType: "json"
    };


    $.ajax(ajaxConfig).done(function(response){
        if (response == true){

            swal("Successfully!", "Order has been successfully Added..!", "success");

        }else{
            swal("Error!", "Failed to added the order..!", "error");
        }
    });



});



