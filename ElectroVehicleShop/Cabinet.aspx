<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cabinet.aspx.cs" Inherits="ElectroVehicleShop.Cabinet" %>

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

        .form-control {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Мій профіль</h1>
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBMain" runat="server" CssClass="button" OnClick="LBMain_Click">Головна (доступна всім)</asp:LinkButton>
                    </td>
                    <td>Параметри сесії:</td>
                    <td colspan="3">
                        <asp:Label ID="Label1ms" runat="server" CssClass="status"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBRegistration" runat="server" CssClass="button" OnClick="LBRegistration_Click">Реєстрація (доступна всім)</asp:LinkButton>
                    </td>
                    <td>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>&nbsp;&nbsp;&nbsp;
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>&nbsp;&nbsp;&nbsp;
                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="height: 19px">
                        <asp:LinkButton ID="LBCabinet" runat="server" CssClass="button" OnClick="LBCabinet_Click">Мій профіль (зареєстр. корист.)</asp:LinkButton>
                    </td>
                    <td style="height: 19px">ID:
                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        &nbsp;&nbsp;
                    </td>
                    <td style="height: 19px"></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LBAdmin" runat="server" CssClass="button" BackColor="Black" OnClick="LBAdmin_Click">Пункт для адміністратора</asp:LinkButton>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>"
                            DeleteCommand="DELETE FROM [user] WHERE [id_user] = @original_id_user"
                            InsertCommand="INSERT INTO [user] ([fk_role], [surname], [name], [address], [phone], [login], [password]) VALUES (@fk_role, @surname, @name, @address, @phone, @login, @password)"
                            OldValuesParameterFormatString="original_{0}"
                            SelectCommand="SELECT * FROM [user] WHERE ([id_user] = @id_user)"
                            UpdateCommand="UPDATE [user] SET [fk_role] = @fk_role, [surname] = @surname, [name] = @name, [address] = @address, [phone] = @phone, [login] = @login, [password] = @password WHERE [id_user] = @original_id_user">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id_user" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="fk_role" Type="Int32" />
                                <asp:Parameter Name="surname" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                                <asp:Parameter Name="phone" Type="String" />
                                <asp:Parameter Name="login" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="id_user" SessionField="id_user"
                                    Type="Int32" DefaultValue="null" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="fk_role" Type="Int32" />
                                <asp:Parameter Name="surname" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                                <asp:Parameter Name="phone" Type="String" />
                                <asp:Parameter Name="login" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="original_id_user" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                            BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" DataKeyNames="id_user" DataSourceID="SqlDataSource1"
                            Height="50px" Width="125px">
                            <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <Fields>
                                <asp:BoundField DataField="id_user" HeaderText="id_user"
                                    InsertVisible="False" ReadOnly="True" SortExpression="id_user" />
                                <asp:BoundField DataField="surname" HeaderText="surname"
                                    SortExpression="surname" />
                                <asp:BoundField DataField="name" HeaderText="name"
                                    SortExpression="name" />
                                <asp:BoundField DataField="address" HeaderText="address"
                                    SortExpression="address" />
                                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                <asp:CommandField ShowEditButton="True" CancelText="Скасувати" DeleteText="Видалити" EditText="Редагувати" InsertText="Вставити" NewText="Створити" SelectText="Вибір" UpdateText="Оновити" />
                                <asp:BoundField DataField="fk_role" HeaderText="fk_role" SortExpression="fk_role" Visible="False" />
                            </Fields>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                        </asp:DetailsView>
                    </td>
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
