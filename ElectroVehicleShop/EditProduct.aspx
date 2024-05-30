<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="ElectroVehicleShop.EditProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Редагування товару</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #3D2B1F;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 80%;
            margin: 0 auto;
            background-color: #FCD975;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button:active {
            background-color: #0056b3;
            opacity: 0.7;
        }

        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Редагування товару</h1>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                 BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                 CellPadding="4" DataKeyNames="id_transport" DataSourceID="SqlDataSource1"
                 Height="50px" Width="125px">
                 <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                 <Fields>
                     <asp:BoundField DataField="id_transport" HeaderText="ID Товару"
                         InsertVisible="False" ReadOnly="True" SortExpression="id_transport" />
                     <asp:BoundField DataField="name" HeaderText="Назва" SortExpression="name" />
                     <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                     <asp:BoundField DataField="price" HeaderText="Ціна" SortExpression="price" />
                     <asp:BoundField DataField="description" HeaderText="Опис" SortExpression="description" />
                     <asp:BoundField DataField="waranty_start_date" HeaderText="Дата виготовлення" SortExpression="waranty_start_date" />
                     <asp:BoundField DataField="speed" HeaderText="Максимальна швидкість" SortExpression="speed" />
                     <asp:BoundField DataField="weight" HeaderText="Вага" SortExpression="weight" />
                     <asp:CommandField ShowEditButton="True" CancelText="Скасувати" DeleteText="Видалити" EditText="Редагувати" InsertText="Вставити" NewText="Створити" SelectText="Вибір" UpdateText="Оновити" />
                 </Fields>
                 <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                 <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                 <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                 <RowStyle BackColor="White" ForeColor="#330099" />
             </asp:DetailsView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" 
                 SelectCommand="SELECT id_transport, name, price, description, waranty_start_date, speed, weight, m.manufacturer_name AS manufacturer FROM transport t INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE (t.id_transport = @id_transport)"
                 UpdateCommand="UPDATE transport SET name=@name, price=@price, description=@description, waranty_start_date=@waranty_start_date, speed=@speed, weight=@weight WHERE id_transport=@id_transport">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="id_transport" QueryStringField="id_transport" Type="Int32" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="name" Type="String" />
                     <asp:Parameter Name="price" Type="Decimal" />
                     <asp:Parameter Name="description" Type="String" />
                     <asp:Parameter Name="waranty_start_date" Type="DateTime" />
                     <asp:Parameter Name="speed" Type="Int32" />
                     <asp:Parameter Name="weight" Type="Int32" />
                     <asp:Parameter Name="id_transport" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             <asp:Button ID="BBackToProductDescription" runat="server" CssClass="button" Text="Повернутися до товару" OnClick="BBackToProductDescription_Click" />
        </div>
    </form>
</body>
</html>