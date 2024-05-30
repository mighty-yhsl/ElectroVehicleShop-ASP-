<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalOffice.aspx.cs" Inherits="ElectroVehicleShop.PersonalOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
            font-weight: 700;
        }

        .auto-style2 {
            height: 22px;
        }

        .auto-style3 {
            height: 22px;
            text-align: center;
        }

        .auto-style4 {
            text-align: center;
        }

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

        .accept-button {
            background-color: #00FF00;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }

        .reject-button {
            background-color: #FF0000; 
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
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
            <h1>Персональний кабінет</h1>
            <table cellspacing="1" width="100%">
                <tr>
                    <td width="15%">&nbsp;</td>
                    <td width="65%"><strong>Зареєстрований користувач:</strong>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        &nbsp;</td>
                    <td width="20%">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><strong>ID-користувача:
                    <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                    </strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LBCurretnOrder" runat="server" Font-Bold="True" CssClass="button" OnClick="LBCurretnOrder_Click">Поточне замовлення</asp:LinkButton>
                    </td>
                    <td class="auto-style3"><strong>Web-сторінка відображення даних особистого кабінету </strong></td>
                    <td class="auto-style2"><strong>Меню</strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBHistoryOrders" runat="server" Font-Bold="True" CssClass="button" OnClick="LBHistoryOrders_Click">Історія замовлень</asp:LinkButton>
                    </td>
                    <td><strong>Зареєстрований користувач:</strong>
                        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                        &nbsp;&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LBView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBView_Click">Стислий перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        <strong>ID-користувача:
                    <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                            &nbsp;&nbsp;&nbsp;&nbsp; Дата:
                    <asp:Literal ID="Literal9" runat="server"></asp:Literal>
                        </strong>
                    </td>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LBShortView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBShortView_Click">Детальний перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LBCreateOrder" runat="server" Font-Bold="True" CssClass="button" OnClick="LBCreateOrder_Click">Оформити замовлення</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE (o.id_order = @id_order) AND (u.id_user = @id_user)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_order" SessionField="id_order" />
                                    <asp:SessionParameter DefaultValue="" Name="id_user" SessionField="id_user" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="auto-style4">
                                ПОТОЧНЕ ЗАМОВЛЕННЯ
                            </div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="У Вас не має поточних замовлень">
                                <Columns>
                                    <asp:BoundField DataField="id_order" HeaderText="Номер замовлення" InsertVisible="False" ReadOnly="True" SortExpression="id_order" />
                                    <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="Дата замовлення" SortExpression="date" />
                                    <asp:BoundField DataField="status_order_name" HeaderText="Статус замовлення" SortExpression="status_order" />
                                    <asp:BoundField DataField="transport_name" HeaderText="Найменування товару" SortExpression="transport_name" />
                                    <asp:BoundField DataField="manufacturer" HeaderText="Bиробник" SortExpression="manufacturer" />
                                    <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                                </Columns>
                            </asp:GridView>
                            <br />
                            Вам пропонується змінити статус &nbsp;замовлення, для цього натиснить на кнопку за вибором<br />
                            ПІДВЕРДИТИ
                        <asp:Button ID="Button1" runat="server" Font-Bold="True" BackColor="#00FF00" Height="18px" OnClick="Button1_Click" Text="Підтвердити замовлення" Width="174px" />
                            &nbsp;&nbsp;&nbsp; або ВІДМОВИТИСЯ&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Font-Bold="True" BackColor="#FF0000" Height="22px" OnClick="Button2_Click" Text="Відмовитися від замовлення" Width="197px" />
                        </asp:Panel>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT u.id_user, o.id_order, o.date, st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE (u.id_user = @id_user)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="id_user" SessionField="id_user" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="auto-style4">
                                ІСТОРІЯ ЗАМОВЛЕНЬ
                            </div>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_order" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="id_order" HeaderText="Номер замовлення" InsertVisible="False" ReadOnly="True" SortExpression="id_order" />
                                    <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="Дата замовлення" SortExpression="date" />
                                    <asp:BoundField DataField="status_order_name" HeaderText="Статус замовлення" SortExpression="status_order_name" />
                                    <asp:BoundField DataField="transport_name" HeaderText="Найменування товару" SortExpression="transport_name" />
                                    <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                    <asp:TemplateField HeaderText="Дії">
                                        <ItemTemplate>
                                            <asp:Button ID="btnAccept" runat="server" Text="ПІДВЕРДИТИ" CssClass="accept-button" CommandName="ButtonY" CommandArgument='<%# Container.DataItemIndex %>' />
                                            <asp:Button ID="btnReject" runat="server" Text="ВІДМОВИТИСЯ" CssClass="reject-button" CommandName="ButtonN" CommandArgument='<%# Container.DataItemIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_user" HeaderText="id_user" InsertVisible="False" ReadOnly="True" SortExpression="id_user" Visible="False" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight: 700">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
