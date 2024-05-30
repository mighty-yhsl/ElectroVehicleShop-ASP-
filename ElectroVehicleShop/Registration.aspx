<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ElectroVehicleShop.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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

            .button:active {
                background-color: #0056b3;
                opacity: 0.7;
            }

            .button:hover {
                background-color: #0056b3;
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
            <h1>Реєстрація</h1>
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBMain" runat="server" CssClass="button" OnClick="LBMain_Click">Головна (доступна всім)</asp:LinkButton>
                    </td>
                    <td>Логін:&nbsp;
                <asp:TextBox ID="TBLogin" runat="server" Width="120px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BCheckLogin" runat="server" Text="Перевірити логін" CssClass="button" Width="135px" OnClick="BCheckLogin_Click" Height="30px" />
                        &nbsp;&nbsp;
                <asp:Label ID="LabelCheck" runat="server" CssClass="status"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="Label1ms" runat="server" CssClass="status"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBRegistration" runat="server" CssClass="button" OnClick="LBRegistration_Click">Реєстрація (доступна всім)</asp:LinkButton></td>
                    </td>
                    <td>Пароль:&nbsp;&nbsp;&nbsp; 
                <asp:TextBox ID="TBPassword" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp; Роль:&nbsp;&nbsp;
                 <asp:DropDownList ID="DropDownListRole" runat="server" Enabled="false">
                     <asp:ListItem Value="3" Text="Користувач" Selected="True"></asp:ListItem>
                     <asp:ListItem Value="1" Text="Адмін"></asp:ListItem>
                 </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;
                        <br />
                        Адреса:&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TBAddress" runat="server" Width="120px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 19px">
                        <asp:LinkButton ID="LBCabinet" runat="server" CssClass="button" OnClick="LBCabinet_Click" Height="22px">Мій профіль (зареєстр. корист.)</asp:LinkButton>
                    </td>
                    <td style="height: 19px">Прізвище:&nbsp;
                    <asp:TextBox ID="TBSurName" runat="server" Width="120px"></asp:TextBox>
                        &nbsp;Ім&#39;я:&nbsp;
                <asp:TextBox ID="TBName" runat="server" Width="120px"></asp:TextBox>
                    </td>
                    <td style="height: 19px"></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBAdmin" runat="server" CssClass="button" OnClick="LBAdmin_Click" BackColor="Black" Height="22px">Пункт для адміністратора</asp:LinkButton>
                    </td>
                    <td align="center">Мобільний телефон у форматі +380ХХХХХХХХХ&nbsp;
                <asp:TextBox ID="TBPhone" runat="server" Width="178px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">
                        <asp:Button ID="BRegister" runat="server" Text="Зареєструватись" CssClass="button"
                            Width="142px" OnClick="BRegister_Click" Height="30px" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

