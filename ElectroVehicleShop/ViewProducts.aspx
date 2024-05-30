<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ElectroVehicleShop.ViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }

        .auto-style2 {
            height: 21px;
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
            <h1>Каталог</h1>
            <div class="form-group">
                <label for="searchTextBox">Пошук товару:</label>
                <asp:TextBox ID="searchTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="searchButton" runat="server" Text="Пошук" CssClass="button" OnClick="SearchButton_Click" />
            </div>
            <table cellspacing="1" width="100%">
                <tr>
                    <td width="15%"><strong>Фільтри</strong></td>
                    <td width="65%"><strong>Зареєстрований користувач:</strong>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                        &nbsp;</td>
                    <td width="20%"><strong>Меню</strong></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBAllManufacturer" runat="server" Font-Bold="True" CssClass="button" OnClick="LBAllManufacturer_Click">Всі виробники</asp:LinkButton>
                    </td>
                    <td class="auto-style1"><strong>ID-користувача:
                    <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        &nbsp;&nbsp;&nbsp;&nbsp; Дата:
                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                    </strong></td>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBView_Click">Стислий перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBSamsung" runat="server" Font-Bold="True" CssClass="button" OnClick="LBSamsung_Click">SAMSUNG</asp:LinkButton>
                    </td>
                    <td class="auto-style3"><strong>Web-сторінка стислого перегляду товарів</strong></td>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LBShortView" runat="server" Font-Bold="True" CssClass="button" OnClick="LBShortView_Click">Детальний перегляд</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBApple" runat="server" Font-Bold="True" CssClass="button" OnClick="LBApple_Click">APPLE</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBAddNewProduct" runat="server" Font-Bold="True" CssClass="button" BackColor="Black" PostBackUrl="~/AddProduct.aspx" OnClick="LBAddNewProduct_Click">Додати новий товар</asp:LinkButton>
                        <asp:LinkButton ID="LBCategories" runat="server" Font-Bold="True" CssClass="button" PostBackUrl="~/Categories.aspx" OnClick="LBCategories_Click">Категорії</asp:LinkButton>
                        <asp:LinkButton ID="LBManufacturers" runat="server" Font-Bold="True" CssClass="button" PostBackUrl="~/Manufacturers.aspx" OnClick="LBManufacturers_Click">Виробники</asp:LinkButton>
                        <asp:LinkButton ID="LBSuppliers" runat="server" Font-Bold="True" CssClass="button" PostBackUrl="~/Suppliers.aspx" OnClick="LBSuppliers_Click">Постачальники</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBCreateOrder" runat="server" Font-Bold="True" CssClass="button" OnClick="LBCreateOrder_Click">Оформити замовлення</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBSony" runat="server" Font-Bold="True" CssClass="button" OnClick="LBSony_Click">SONY</asp:LinkButton>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" SelectCommand="SELECT id_transport, name, price, img_small, m.manufacturer_name AS manufacturer FROM dbo.transport t INNER JOIN dbo.manufacturer m ON m.id_manufacturer = t.fk_manufacturer;" OnSelecting="SqlDataSource1_Selecting" />
                    </td>
                    <td>
                        <asp:LinkButton ID="LBPersonalCabinet" runat="server" Font-Bold="True" CssClass="button" OnClick="LBPersonalCabinet_Click">Особистий кабінет</asp:LinkButton>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBLg" runat="server" Font-Bold="True" CssClass="button" OnClick="LBLg_Click">LG</asp:LinkButton>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>"
                            SelectCommand="SELECT id_transport, name, price, img_small, m.manufacturer_name AS manufacturer FROM dbo.transport t INNER JOIN dbo.manufacturer m ON m.id_manufacturer = t.fk_manufacturer WHERE name LIKE '%' + @productName + '%'">
                            <SelectParameters>
                                <asp:ControlParameter Name="productName" ControlID="searchTextBox" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:LinkButton ID="LBMain" runat="server" Font-Bold="True" CssClass="button" OnClick="LBMain_Click">Головна</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_transport" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товару">
                                </asp:ImageField>
                                <asp:BoundField DataField="name" HeaderText="Найменування" SortExpression="name" />
                                <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                <asp:BoundField DataField="id_transport" HeaderText="Шифр" InsertVisible="False" ReadOnly="True" SortExpression="id_transport" />
                                <asp:BoundField DataField="price" HeaderText="Ціна" SortExpression="price" />
                                <asp:CommandField SelectText="Детальніше ..." ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_transport" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товару">
                                </asp:ImageField>
                                <asp:BoundField DataField="name" HeaderText="Найменування" SortExpression="name" />
                                <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                <asp:BoundField DataField="id_transport" HeaderText="Шифр" InsertVisible="False" ReadOnly="True" SortExpression="id_transport" />
                                <asp:BoundField DataField="price" HeaderText="Ціна" SortExpression="price" />
                                <asp:CommandField SelectText="Детальніше ..." ShowSelectButton="True" />
                                <asp:BoundField DataField="fk_manufacturer" HeaderText="fk_manufacturer" SortExpression="fk_manufacturer" Visible="False" />
                            </Columns>
                        </asp:GridView>

                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id_transport" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                            <Columns>
                                <asp:ImageField DataImageUrlField="img_small" HeaderText="Фото товару">
                                    </asp:ImageField>
                                    <asp:BoundField DataField="name" HeaderText="Найменування" SortExpression="name" />
                                    <asp:BoundField DataField="manufacturer" HeaderText="Виробник" SortExpression="manufacturer" />
                                    <asp:BoundField DataField="id_transport" HeaderText="Шифр" InsertVisible="False" ReadOnly="True" SortExpression="id_transport" />
                                    <asp:BoundField DataField="price" HeaderText="Ціна" SortExpression="price" />
                                    <asp:CommandField SelectText="Детальніше ..." ShowSelectButton="True" />
                            </Columns>
                        </asp:GridView>
                        <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString2 %>" SelectCommand="SELECT id_transport, fk_manufacturer, name, price, img_small, m.manufacturer_name  AS manufacturer FROM transport t INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE (t.fk_manufacturer = @id_manufacturer)" ProviderName="<%$ ConnectionStrings:electro_transportConnectionString2.ProviderName %>" OnSelecting="SqlDataSource2_Selecting">
                            <SelectParameters>
                                <asp:SessionParameter Name="id_manufacturer" SessionField="id_manufacturer" />
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
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
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
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
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
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
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
