<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddManufacturer.aspx.cs" Inherits="ElectroVehicleShop.AddManufacturer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Додати производителя</title>
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

        input[type="text"] {
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
            <h1>Додати виробника</h1>
            <div class="form-control">
                <label for="ManufacturerName">Назва виробника:</label>
                <asp:TextBox ID="TBManufacturerName" runat="server" />
            </div>
            <div class="form-control">
                <asp:Button ID="BtnAddManufacturer" runat="server" CssClass="button" Text="Додати виробника" OnClick="BtnAddManufacturer_Click" />
                <asp:Button ID="BtnBackToManufacturers" runat="server" CssClass="button" Text="Повернутися до виробників" OnClick="BtnBackToManufacturers_Click" />
            </div>
        </div>
    </form>
</body>
</html>