<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ElectroVehicleShop.Categories" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Категорії</title>
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
            <h1>Категорії</h1>
            <div>
                <asp:LinkButton ID="LBAddCategory" runat="server" Font-Bold="True" CssClass="button" OnClick="LBAddCategory_Click">Додати категорію</asp:LinkButton>
                <asp:LinkButton ID="LBBackToCatalog" runat="server" Font-Bold="True" CssClass="button" OnClick="LBBackToCatalog_Click">Повернутися до каталогу</asp:LinkButton>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_category" DataSourceID="SqlDataSource1" CssClass="gridview" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_category" HeaderText="ID Категорії" ReadOnly="True" SortExpression="id_category" />
                    <asp:BoundField DataField="category_name" HeaderText="Назва категорії" SortExpression="category_name" />
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
                SelectCommand="SELECT id_category, category_name FROM Category"
                UpdateCommand="UPDATE Category SET category_name=@category_name WHERE id_category=@id_category"
                DeleteCommand="DELETE FROM Category WHERE id_category=@id_category">
                <UpdateParameters>
                    <asp:Parameter Name="category_name" Type="String" />
                    <asp:Parameter Name="id_category" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id_category" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>