<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="ElectroVehicleShop.StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>My Awesome Page</title>
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

        .form-group {
            margin-bottom: 10px;
        }

            .form-group label {
                display: block;
                font-weight: bold;
            }

            .form-group input[type="text"],
            .form-group input[type="password"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-group input[type="submit"] {
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

                .form-group input[type="submit"]:hover {
                    background-color: #218838;
                }

        .status {
            font-weight: bold;
            margin-top: 10px;
        }

        .button-enter {
            padding: 10px 20px;
            background-color: #ff5733;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

            .button-enter:hover {
                background-color: #e9451e;
            }

        .form-control {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Меню</h1>
            <table>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Головна (доступна всім)</td>
                    <td>&nbsp;</td>
                    <td>Інтерфейс для входу</td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBMain" runat="server" CssClass="button" OnClick="LBMain_Click">Головна (доступна всім)</asp:LinkButton></td>
                    <td></td>
                    <td>Логин:</td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBRegistration" runat="server" CssClass="button" OnClick="LBRegistration_Click">Реєстрація (доступна всім)</asp:LinkButton></td>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TBLogin" runat="server" CssClass="form-control" TextMode="SingleLine" Height="30px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBCabinet" runat="server" CssClass="button" OnClick="LBCabinet_Click">Мій профіль (зареєстр. корист.)</asp:LinkButton></td>
                    <td>Адмін логін + пароль: an + an</td>
                    <td>Пароль:</td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBCatalog" runat="server" CssClass="button" OnClick="LBCatalog_Click">Каталог (доступна всім)</asp:LinkButton>
                        <td>Користувач логін + пароль: st + st</td>
                        <td>
                            <asp:TextBox ID="TBPassword" runat="server" CssClass="form-control" TextMode="Password" Height="30px"></asp:TextBox>
                            <td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBAdmin" runat="server" CssClass="button" BackColor="Black" OnClick="LBAdmin_Click">Пункт для адміністратора</asp:LinkButton>
                    </td>
                    <td></td>
                    <td>
                        <asp:Button ID="BEnter" runat="server" CssClass="button" Text="Вхід" OnClick="BEnter_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="LBExit" runat="server" CssClass="button" OnClick="LBExit_Click" BackColor="Red">Вийти з акаунту</asp:LinkButton></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1ms" runat="server" CssClass="status"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
