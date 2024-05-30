<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ElectroVehicleShop.Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Звіти</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #3D2B1F;
            margin: 0;
            padding: 0;
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
            margin-bottom: 10px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Звіти</h1>
            <asp:GridView ID="GridViewReports" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="SqlDataSourceReports">
                <Columns>
                    <asp:BoundField DataField="order_id" HeaderText="Номер замовлення" ReadOnly="True" SortExpression="order_id" />
                    <asp:BoundField DataField="order_description" HeaderText="Опис замовлення" SortExpression="order_description" />
                    <asp:BoundField DataField="delivery_name" HeaderText="Ім'я доставки" SortExpression="delivery_name" />
                    <asp:BoundField DataField="order_date" HeaderText="Дата замовлення" DataFormatString="{0:d}" SortExpression="order_date" />
                    <asp:BoundField DataField="status_order_name" HeaderText="Статус замовлення" SortExpression="status_order_name" />
                    <asp:BoundField DataField="user_name" HeaderText="Ім'я користувача" SortExpression="user_name" />
                    <asp:BoundField DataField="user_phone" HeaderText="Телефон користувача" SortExpression="user_phone" />
                    <asp:BoundField DataField="transport_id" HeaderText="ID Транспорту" SortExpression="transport_id" />
                    <asp:BoundField DataField="order_details_total_amount" HeaderText="Кількість товару" SortExpression="order_details_total_amount" />
                    <asp:BoundField DataField="total_price" HeaderText="Загальна вартість" SortExpression="total_price" />
                </Columns>
            </asp:GridView>
            <div class="form-control">
                <asp:Button ID="BTBackToAdminPage" runat="server" CssClass="button" Text="Повернутися до адмін панелі" OnClick="BTBackToAdminPage_Click" />
            </div>
            <asp:SqlDataSource ID="SqlDataSourceReports" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT * FROM order_processing_view"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
