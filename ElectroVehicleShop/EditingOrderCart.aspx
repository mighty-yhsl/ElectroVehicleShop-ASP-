<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditingOrderCart.aspx.cs" Inherits="ElectroVehicleShop.EditingOrderCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Кошик</title>
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

        .status {
            font-weight: bold;
            margin-top: 10px;
        }

        .increase-button {
            background-color: #00FF00;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }

        .decrease-button {
            background-color: #FF0000;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }

        .delete-button {
            background-color: #000000;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Кошик</h1>
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
                    <td><strong>Меню</strong></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style3"><strong>Web-сторінка відображення кошика та оформлення замовлення</strong></td>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LBView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBView_Click">Стислий перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LBShortView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBShortView_Click">Детальний перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LBCreateOrder" runat="server" Font-Bold="True" CssClass="button" OnClick="LBCreateOrder_Click">Оформити замовлення</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBPersonalCabinet" runat="server" Font-Bold="True" CssClass="button" OnClick="LBPersonalCabinet_Click">Особистий кабінет</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_transport" EmptyDataText="У Вашому кошику замовлення немає обраних товарів" OnRowCommand="GridView1_RowCommand" Style="font-weight: 700">
                            <Columns>
                                <asp:BoundField DataField="id_transport" HeaderText="Шифр товару" />
                                <asp:BoundField DataField="name" HeaderText="Найменування товару" />
                                <asp:BoundField DataField="price" HeaderText="Ціна за од." />
                                <asp:BoundField DataField="total_amount" HeaderText="Кількість, од." />
                                <asp:BoundField DataField="cost" HeaderText="Вартість, грн." />
                                <asp:ButtonField ButtonType="Button" CommandName="ButtonGr1" HeaderText="Змінити кількість +" Text="Збільшити +">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" CommandName="ButtonGr2" HeaderText="Змінити кількість -" Text="Зменшити -">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:ButtonField ButtonType="Button" CommandName="ButtonGr3" HeaderText="Видалити з кошика" Text="Видалити">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center" style="font-weight: 700">
                        <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="BCreateOrder" runat="server" OnClick="BCreateOrder_Click" CssClass="button" Text="Оформити замовлення" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="id_orderod" HeaderText="Код замовлення" ReadOnly="True" SortExpression="id_orderod" InsertVisible="False" />
                                <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="Дата замовлення" SortExpression="date" />
                                <asp:BoundField DataField="name" HeaderText="Найменування товару" SortExpression="name" />
                                <asp:BoundField DataField="total_amount" HeaderText="Кількість товару" SortExpression="total_amount" />
                                <asp:BoundField DataField="price" HeaderText="Ціна товару за од." SortExpression="price" />
                                <asp:BoundField DataField="manufacturer" HeaderText="Компанія виробник" SortExpression="manufacturer" />
                                <asp:BoundField DataField="fk_status_order" HeaderText="Статус замовлення" SortExpression="fk_status_order" Visible="False" />
                                <asp:BoundField DataField="fk_transport" HeaderText="fk_transport" SortExpression="fk_transport" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="font-weight: 700">
                        <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT od.id_orderod, o.[date], od.fk_transport, od.total_amount, t.name AS transport_name, t.price, m.manufacturer_name, st.status_order_name FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer INNER JOIN status_order st ON o.fk_status_order = st.id_status_order;">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_orderod" SessionField="id_orderod" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
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
