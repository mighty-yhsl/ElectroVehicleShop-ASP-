<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="ElectroVehicleShop.Suppliers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Постачальники</title>
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
            <h1>Постачальники</h1>
            <div>
                <asp:LinkButton ID="LBAddSupplier" runat="server" Font-Bold="True" CssClass="button" OnClick="LBAddSupplier_Click">Додати постачальника</asp:LinkButton>
                <asp:LinkButton ID="LBBackToCatalog" runat="server" Font-Bold="True" CssClass="button" OnClick="LBBackToCatalog_Click">Повернутися до каталогу</asp:LinkButton>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_supplier" DataSourceID="SqlDataSource1" CssClass="gridview" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_supplier" HeaderText="ID Постачальника" ReadOnly="True" SortExpression="id_supplier" />
                    <asp:BoundField DataField="supplier_name" HeaderText="Назва постачальника" SortExpression="supplier_name" />
                    <asp:BoundField DataField="supplier_address" HeaderText="Адреса постачальника" SortExpression="supplier_address" />
                    <asp:BoundField DataField="supplier_registration_date" HeaderText="Дата реєстрації" SortExpression="supplier_registration_date" />
                    <asp:BoundField DataField="supplier_email" HeaderText="Email постачальника" SortExpression="supplier_email" />
                    <asp:BoundField DataField="supplier_phone" HeaderText="Телефон постачальника" SortExpression="supplier_phone" />
                    <asp:BoundField DataField="supplier_rating" HeaderText="Рейтинг постачальника" SortExpression="supplier_rating" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
                SelectCommand="SELECT id_supplier, fk_supplier_country, supplier_name, supplier_address, supplier_registration_date, supplier_email, supplier_phone, supplier_rating FROM supplier"
                UpdateCommand="UPDATE supplier SET supplier_name=@supplier_name, supplier_address=@supplier_address, supplier_registration_date=@supplier_registration_date, supplier_email=@supplier_email, supplier_phone=@supplier_phone, supplier_rating=@supplier_rating WHERE id_supplier=@id_supplier"
                DeleteCommand="DELETE FROM supplier WHERE id_supplier=@id_supplier">
                <UpdateParameters>
                    <asp:Parameter Name="supplier_name" Type="String" />
                    <asp:Parameter Name="supplier_address" Type="String" />
                    <asp:Parameter Name="supplier_registration_date" Type="DateTime" />
                    <asp:Parameter Name="supplier_email" Type="String" />
                    <asp:Parameter Name="supplier_phone" Type="String" />
                    <asp:Parameter Name="supplier_rating" Type="Single" />
                    <asp:Parameter Name="id_supplier" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id_supplier" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>