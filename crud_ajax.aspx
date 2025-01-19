<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crud_ajax.aspx.cs" Inherits="ProductsWeb.crud_ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
     <div style="padding:20px">
        <h3>Product System</h3>  
        <form id="form1" runat="server">       

        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>ID:
                </td>
                <td>
                    <asp:TextBox ID="txtID" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>Code:
                </td>
                <td>
                    <asp:TextBox ID="txtCode" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>Name:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Description:
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" />
                </td>
            </tr>

            <tr>
                <td>Sell Date:
                </td>
                <td>
                    <div>
                       <asp:Calendar ID="datePicker" runat="server" Visible="false" OnSelectionChanged="datePicker_SelectionChanged"></asp:Calendar>
                    </div>
                    <asp:TextBox ID="txtSellDate" runat="server" />
                    <asp:LinkButton ID="lnkPickDate" runat="server" OnClick="lnkPickDate_Click">Get Sell Date</asp:LinkButton>
                </td>
            </tr>


            <tr>
                <td>Select File:
                </td>
                <td>
                    <input type="file" id="files" />
                    <button type="button" id="btnUpload" class="btn btn-primary">Upload</button>
                    <asp:TextBox ID="txtUploadFileName" runat="server" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <input type="button" class="btn btn-primary" name="btnSave" id="btnSave" value="Save" />
                    <input type="button" class="btn btn-primary" name="btnSave" id="btnUpdate" value="Update" />
                    <input type="button" class="btn btn-primary" name="btnSave" id="btnDelete" value="Delete" />
                </td>
            </tr>
        </table>
        <hr />

        <div class="col-lg-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Search By Code or Name</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group col-lg-4">
                        <input type="text" name="txtSearch" id="txtSearch" class="form-control" placeholder="Type code or name" required="" />
                    </div>

                    <div class="form-group col-lg-4">
                        <button type="button" id="btnSearch" class="btn btn-primary">Search</button>
                    </div>
               </div>
           </div>
        </div>

        <hr />
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false"
            AutoGenerateSelectButton="true"
            HeaderStyle-BackColor="#3AC0F2"
            DataKeyNames="ProductId"
            AllowPaging="True"
            PageSize="4"
            AllowSorting="True"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" OnPageIndexChanging="gvProducts_PageIndexChanging" OnSorting="gvProducts_Sorting" OnSelectedIndexChanged="gvProducts_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="SellDate" HeaderText="SellDate" SortExpression="SellDate" DataFormatString="{0:dd-M-yyyy}" />

<%--                <asp:TemplateField HeaderText="SellDate" SortExpression="SellDate">    
                <ItemTemplate>    
                    <asp:Label ID="lblSellDate" runat="server" Text ='<%#Eval("SellDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>--%>

                <asp:BoundField DataField="ImageLink" HeaderText="ImageLink" SortExpression="ImageLink" />
            </Columns>
            <PagerSettings
                Mode="Numeric"
                PageButtonCount="4"
            />
        </asp:GridView>
    </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

    <script type="text/javascript">

        //$.ajax({
        //    type: "POST",
        //    url: "crud_ajax.aspx/GetResult",
        //    data: '{variable: 123456 }',
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (response) {
        //        alert(response.d);
        //    },
        //    failure: function(response) {
        //        alert(response.d);
        //    }
        //});
  
    </script>

    <script>
        $("#btnUpload").on('click', function () {
            var formData = new FormData();
            var fileUpload = $('#files').get(0);
            var files = fileUpload.files;
            for (var i = 0; i < files.length; i++) {
                console.log(files[i].name);
                formData.append(files[i].name, files[i]);
            }
            $.ajax({
                url: "UploadService.asmx//UploadFiles",
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    alert('success' + data);
                },
                error: function (data) {
                    alert('error' + data);
                },
            });
        });
    </script>

    <script type="text/javascript">
      
        $(function () {
            function getGrid()
            {
                alert("getGrid");
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "CrudService.asmx/BindDatatable",
                    data: "{}",
                    dataType: "json",
                    success: function (data) {
                        populateGrid(data);
                    },
                    error: function (result) {
                        alert("Error");
                    }
                });
            }

            function populateGrid(data) {
                $("[id*=gvProducts] tr").not($("[id*=gvProducts] tr:first-child")).remove();
                for (var i = 0; i < data.d.length; i++) {
                    //var SellDate = moment(data.d[i].SellDate, 'DD-M-YYYY').toDate();
                    var SellDate = moment(data.d[i].SellDate).format('DD-MM-YYYY');
                    $("#gvProducts").append("<tr><td>" + "&nbsp;" + "</td><td>" + data.d[i].ProductId + "</td><td>" + data.d[i].Code + "</td><td>" + data.d[i].Name + "</td><td>" + data.d[i].Description + "</td><td>" + SellDate + "</td><td>" + data.d[i].ImageLink + "</td></tr>");
                }
            }

            function populateSearchGrid(data) {
                $("[id*=gvProducts] tr").not($("[id*=gvProducts] tr:first-child")).remove();
                for (var i = 0; i < data.d.length; i++) {
                    var SellDate = moment(data.d[i].SellDate).format('DD-MM-YYYY');
                    $("#gvProducts").append("<tr><td>" + "&nbsp;" + "</td><td>" + data.d[i].ProductId + "</td><td>" + data.d[i].Code + "</td><td>" + data.d[i].Name + "</td><td>" + data.d[i].Description + "</td><td>" + SellDate + "</td><td>" + data.d[i].ImageLink + "</td></tr>");
                }
            }

             $("#btnSave").click(function () {
                 var product = {};
                 product.code = $("#txtCode").val();
                 product.name = $("#txtName").val();
                 product.description = $("#txtDescription").val();
                 product.sellDate = $("#txtSellDate").val();
                 product.ImageLink = '';
                 $.ajax({
                     type: "POST",
                     url: "CrudService.asmx/SaveProduct",
                     data: '{objProduct: ' + JSON.stringify(product) + '}',
                     dataType: "json",
                     contentType: "application/json; charset=utf-8",
                     success: function (data) {
                         alert("product has been added successfully." + data.d);
                         getGrid();
                     },
                     error: function (r) {
                         alert("Error while inserting data" + r.responseText );
                     }
                 });
                 return false;
             });

            $("#btnUpdate").click(function () {
                var product = {};
                product.productId = parseInt($("#txtID").val());
                product.code = $("#txtCode").val();
                product.name = $("#txtName").val();
                product.description = $("#txtDescription").val();
                product.sellDate = $("#txtSellDate").val();
                product.ImageLink = '';
                $.ajax({
                    type: "POST",
                    url: "CrudService.asmx/UpdateProductWithId",
                    data: '{objProduct: ' + JSON.stringify(product) + '}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        alert("product has been updated successfully." + data.d);
                        getGrid();
                    },
                    error: function (r) {
                        alert("Error while updating data" + r.responseText);
                    }
                });
                return false;
            });


            $("#btnDelete").click(function () {
                var productId = parseInt($("#txtID").val());
                $.ajax({
                    type: "POST",
                    url: "CrudService.asmx/DeleteProduct",
                    data: "{productId:'" + productId + "'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        alert("product has been deleted successfully." + data.d);
                        populateGrid(data);
                    },
                    error: function (r) {
                        alert("Error while deleting data" + r.responseText);
                    }
                });
                return false;
            });

            $("#btnSearch").click(function () {
                var search = $("#txtSearch").val();
                $.ajax({
                    type: "POST",
                    url: "CrudService.asmx/GetProductByNameOrCode",
                    data: "{str:'" + search + "'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        populateSearchGrid(data);
                    },
                    error: function (r) {
                        alert("Error" + r.responseText);
                    }
                });
                return false;
            });


         });

    </script>
</body>
</html>
