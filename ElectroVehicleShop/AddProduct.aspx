<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ElectroVehicleShop.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Додати новий товар</title>
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

            .form-control label {
                display: block;
                font-weight: bold;
            }

            .form-control input[type="text"],
            .form-control input[type="number"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-control input[type="submit"] {
                padding: 10px 20px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                display: inline-block;
            }

                .form-control input[type="submit"]:hover {
                    background-color: #218838;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Додати новий товар</h1>
            <div class="form-control">
                <label for="ProductName">Назва товару:</label>
                <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductManufacturer">Виробник:</label>
                <asp:TextBox ID="ProductManufacturer" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductSupplier">Постачальник:</label>
                <asp:TextBox ID="ProductSupplier" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductCategory">Категорія:</label>
                <asp:TextBox ID="ProductCategory" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductPrice">Ціна:</label>
                <asp:TextBox ID="ProductPrice" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductDescription">Опис:</label>
                <asp:TextBox ID="ProductDescription" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductImgbig">Зображення в великому форматі:</label>
                <asp:TextBox ID="ProductImgbig" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductImg">Зображення в малому форматі:</label>
                <asp:TextBox ID="ProductImgsmall" runat="server"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductWarrantyDate">Дата виготовлення:</label>
                <asp:TextBox ID="ProductWarrantyDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductSpeed">Максимальна швидкість:</label>
                <asp:TextBox ID="ProductSpeed" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductAmount">Кількість:</label>
                <asp:TextBox ID="ProductAmount" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-control">
                <label for="ProductWeight">Вага:</label>
                <asp:TextBox ID="ProductWeight" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-control">
                <asp:Button ID="AddProductButton" runat="server" Text="Додати товар" CssClass="button" OnClick="AddProductButton_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
