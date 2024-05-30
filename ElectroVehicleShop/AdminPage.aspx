<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ElectroVehicleShop.AdminPage" %>

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

        .button:active {
            background-color: #0056b3;
            opacity: 0.7;
        }

        .button-enter:hover {
            background-color: #e9451e;
        }

        .send-button {
            background-color: #00FF00;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }

        .complete-button {
            background-color: #FF0000;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }

        .form-control {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Адмін панель</h1>
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBMain" runat="server" CssClass="button" OnClick="LBMain_Click">Головна (доступна всім)</asp:LinkButton>
                    </td>
                    <td colspan="2">
                        <asp:Label ID="Label1ms" runat="server" CssClass="status"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBRegistration" runat="server" CssClass="button" OnClick="LBRegistration_Click">Реєстрація (доступна всім)</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBStatusInProcess" runat="server" CssClass="button" BackColor="#FF8000" OnClick="LBStatusInProcess_Click">В обробці</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBSortByDateDesc" runat="server" CssClass="button" OnClick="LBSortByDateDesc_Click">Нові</asp:LinkButton>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBCabinet" runat="server" CssClass="button" OnClick="LBCabinet_Click">Кабінет (тільки зареєстр. корист.)</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBStatusCompleted" runat="server" CssClass="button" BackColor="Red" OnClick="LBStatusCompleted_Click">Завершено</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBSortByDateAsce" runat="server" CssClass="button" OnClick="LBSortByDateAsce_Click">Старі</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBAdmin" runat="server" CssClass="button" BackColor="Black" OnClick="LBAdmin_Click">Пункт для адміністратора</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBStatusSent" runat="server" CssClass="button" BackColor="#17a2b8" OnClick="LBStatusSent_Click">Відправлено</asp:LinkButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBAllUsers" runat="server" CssClass="button" OnClick="LBAllUsers_Click">Всі Користувачі</asp:LinkButton>
                        <asp:LinkButton ID="LBReports" runat="server" CssClass="button" OnClick="LBReports_Click">Звіти</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBStatusConfirmed" runat="server" CssClass="button" BackColor="Green" OnClick="LBStatusConfirmed_Click">Підтверджено</asp:LinkButton>
                    </td>
                </tr>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer"></asp:SqlDataSource>
                <tr>
                    <td>
                        <div class="auto-style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Всі замовлення
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_order" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="id_order" HeaderText="Номер замовлення" InsertVisible="False" ReadOnly="True" SortExpression="id_order" />
                                <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="Дата замовлення" SortExpression="date" />
                                <asp:BoundField DataField="status_order_name" HeaderText="Статус замовлення" SortExpression="status_order_name" />
                                <asp:BoundField DataField="transport_name" HeaderText="Найменування товару" SortExpression="transport_name" />
                                <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                <asp:TemplateField HeaderText="Дії">
                                    <ItemTemplate>
                                        <asp:Button ID="btnSend" runat="server" Text="ВІДПРАВЛЕНО" CommandName="ButtonY" CommandArgument='<%# Container.DataItemIndex %>' CssClass="send-button" />
                                        <asp:Button ID="btnComplete" runat="server" Text="ЗАВЕРШЕНО" CommandName="ButtonN" CommandArgument='<%# Container.DataItemIndex %>' CssClass="complete-button" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                            </Columns>
                        </asp:GridView>

                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
