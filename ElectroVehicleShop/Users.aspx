<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ElectroVehicleShop.Users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Користувачі</title>
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
        .gridview {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h1>Користувачі</h1>
            <asp:LinkButton ID="LBBackToAdminPanel" runat="server" Font-Bold="True" CssClass="button" OnClick="LBBackToAdminPanel_Click">Повернутися до адмін панелі</asp:LinkButton>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1" CssClass="gridview" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_user" HeaderText="ID Користувача" ReadOnly="True" SortExpression="id_user" />
                    <asp:BoundField DataField="name" HeaderText="Ім'я" SortExpression="name" />
                    <asp:BoundField DataField="surname" HeaderText="Прізвище" SortExpression="surname" />
                    <asp:BoundField DataField="login" HeaderText="Логін" SortExpression="login" />
                    <asp:BoundField DataField="phone" HeaderText="Телефон" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="Адреса" SortExpression="address" />
                    <asp:TemplateField HeaderText="Роль">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlRole" runat="server" SelectedValue='<%# Bind("fk_role") %>'>
                                <asp:ListItem Value="1">Адміністратор</asp:ListItem>
                                <asp:ListItem Value="2">Користувач</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRole" runat="server" Text='<%# Eval("fk_role").ToString() == "1" ? "Адміністратор" : "Користувач" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFCC66" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8BBD0" />
                <SortedAscendingHeaderStyle BackColor="#FF80AB" />
                <SortedDescendingCellStyle BackColor="#F48FB1" />
                <SortedDescendingHeaderStyle BackColor="#F06292" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:electro_transportConnectionString %>" 
                SelectCommand="SELECT id_user, fk_role, name, surname, login, phone, address FROM [user]"
                UpdateCommand="UPDATE [user] SET fk_role=@fk_role, name=@name, surname=@surname, login=@login, phone=@phone, address=@address WHERE id_user=@id_user">
                <UpdateParameters>
                    <asp:Parameter Name="fk_role" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="login" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="id_user" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>