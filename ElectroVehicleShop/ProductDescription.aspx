<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDescription.aspx.cs" Inherits="ElectroVehicleShop.ProductDescription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<style type="text/css">
    .auto-style1 {
        height: 22px;
    }

    .auto-style2 {
        text-align: center;
    }

    .auto-style3 {
        width: 375px;
    }

    .auto-style4 {
        height: 22px;
        width: 375px;
    }

    .auto-style5 {
        height: 36px;
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
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Детальний огляд товару</h1>
            <table cellspacing="1" width="100%">
                <tr>
                    <td width="15%" class="auto-style1"></td>
                    <td class="auto-style1" colspan="3"><strong>Зареєстрований користувач:</strong>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        &nbsp;</td>
                    <td width="20%" class="auto-style1"><strong>Меню</strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3"><strong>ID-користувача:
                    <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        &nbsp;&nbsp; Дата:
                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        &nbsp;&nbsp; Кількість товарів у кошику:
                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                    </strong></td>
                    <td>
                        <asp:LinkButton ID="LBView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBView_Click">Стислий перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3" class="auto-style2"><strong>Web-сторінка детального огляду обраного&nbsp; товару</strong></td>
                    <td>
                        <asp:LinkButton ID="LBShortView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBShortView_Click">Детальний перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">
                        <asp:Button ID="BEditProduct" runat="server" CssClass="button" BackColor="Black" Text="Редагувати товар" OnClick="BEditProduct_Click" />
                        <asp:Button ID="BDeleteProduct" runat="server" CssClass="button" BackColor="Red" Text="Видалити товар" OnClick="BDeleteProduct_Click" />
                    </td>

                    <td>
                        <asp:LinkButton ID="LBCreateOrder" runat="server" Font-Bold="True" CssClass="button" OnClick="LBCreateOrder_Click">Оформити замовлення</asp:LinkButton>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="BAddToCartUp" runat="server" CssClass="button" OnClick="BAddToCartUp_Click" Text="Додати до кошику" />
                    </td>
                    <td>
                        <asp:Button ID="BCreateOrderUp" runat="server" CssClass="button" OnClick="BCreateOrderUp_Click" Text="Оформити замовлення" />
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="BBackToProductsUp" runat="server" CssClass="button" Text="Повернутися до перегляду товарів" OnClick="BBackToProductsUp_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td colspan="3" class="auto-style5">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT id_transport, name, price, img_big, description, waranty_start_date, speed, weight, m.manufacturer_name AS manufacturer FROM transport t INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE (t.id_transport = @id_transport)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_transport" SessionField="id_transport" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1" colspan="3">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_transport" DataSourceID="SqlDataSource1" Height="50px" Style="margin-top: 0px" Width="125px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" EmptyDataText="Ви не обрали товар для перегляду" ForeColor="Black">
                            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:ImageField DataImageUrlField="img_big" HeaderText="Фото товару">
                                </asp:ImageField>
                                <asp:BoundField DataField="id_transport" HeaderText="Шифр" InsertVisible="False" ReadOnly="True" SortExpression="id_transport" />
                                <asp:BoundField DataField="name" HeaderText="Найменування" SortExpression="name" />
                                <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                <asp:BoundField DataField="price" HeaderText="Ціна" SortExpression="price" />
                                <asp:BoundField DataField="description" HeaderText="Опис" SortExpression="description" />
                                <asp:BoundField DataField="waranty_start_date" HeaderText="Дата виготовлення" SortExpression="waranty_start_date" />
                                <asp:BoundField DataField="speed" HeaderText="Максимальна швидкість" SortExpression="speed" />
                                <asp:BoundField DataField="weight" HeaderText="Вага " SortExpression="weight" />
                            </Fields>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                        </asp:DetailsView>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Button ID="BAddToCartDown" runat="server" CssClass="button" Text="Додати до кошику" OnClick="BAddToCartDown_Click" />
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="BCreateOrderDown" runat="server" CssClass="button" OnClick="BCreateOrderDown_Click" Text="Оформити замовлення" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="BBackToProductsDown" runat="server" CssClass="button" Text="Повернутися до перегляду товарів" OnClick="BBackToProductsDown_Click" />
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1" colspan="3">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
