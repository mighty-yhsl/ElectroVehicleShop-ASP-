<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="ElectroVehicleShop.AddSupplier" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Додати постачальника</title>
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
            margin-bottom: 10px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .form-control {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Додати постачальника</h1>
            <div class="form-control">
                <label for="ManufacturerName">Назва постачальника:</label>
                <asp:TextBox ID="TBManufacturerName" runat="server" />
            </div>
            <div class="form-control">
                <label for="SupplierCountry">Країна постачальника:</label>
                <asp:DropDownList ID="DDSupplierCountry" runat="server">
                    <asp:ListItem Text="Україна" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Киргизстан" Value="2"></asp:ListItem>
                    <asp:ListItem Text="США" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Канада" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Великобританія" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-control">
                <label for="SupplierAddress">Адреса постачальника:</label>
                <asp:TextBox ID="TBSupplierAddress" runat="server" />
            </div>
            <div class="form-control">
                <label for="SupplierRegistrationDate">Дата реєстрації постачальника:</label>
                <asp:TextBox ID="TBSupplierRegistrationDate" runat="server" />
            </div>
            <div class="form-control">
                <label for="SupplierEmail">Електронна пошта постачальника:</label>
                <asp:TextBox ID="TBSupplierEmail" runat="server" />
            </div>
            <div class="form-control">
                <label for="SupplierPhone">Телефон постачальника:</label>
                <asp:TextBox ID="TBSupplierPhone" runat="server" />
            </div>
            <div class="form-control">
                <label for="SupplierRating">Рейтинг постачальника:</label>
                <asp:TextBox ID="TBSupplierRating" runat="server" />
            </div>
            <div class="form-control">
                <asp:Button ID="BtnAddManufacturer" runat="server" CssClass="button" Text="Додати постачальника" OnClick="BtnAddManufacturer_Click" />
                <asp:Button ID="BtnBackToManufacturers" runat="server" CssClass="button" Text="Повернутися до постачальників" OnClick="BtnBackToManufacturers_Click" />
            </div>
        </div>
    </form>
</body>
</html>