<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink runat="server" Text="Panel de administración" NavigateUrl="~/Admin.aspx" Visible="false" ID="PanelLink"/>
        <asp:HyperLink runat="server" Text="Reporte" NavigateUrl="~/Reporte.aspx" Visible="false" ID="ReporteLink" />
        <asp:GridView ID="GridView1" runat="server" autogeneratecolumns="False">

            <Columns>
                <asp:HyperLinkField
                        DataNavigateUrlFields="id_car"
                        DataNavigateUrlFormatString="~\Auto.aspx?id={0}"
                        Text="Comprar"
                        HeaderText="Marca" />
            </Columns>

            <Columns>
                <asp:BoundField 
                    DataField="Marca"
                    HeaderText="Marca"/>
            </Columns>

            <Columns>
                <asp:BoundField 
                    DataField="Modelo"
                    HeaderText="Modelo"/>
            </Columns>

            <Columns>
                <asp:BoundField 
                    DataField="Precio"
                    HeaderText="Precio"/>
            </Columns>

        </asp:GridView>
    </form>
</body>
</html>
