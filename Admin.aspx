<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink runat="server" ID="CrearAuto" NavigateUrl="~/AutoCreate.aspx" Text="Crear auto" />
        <asp:GridView ID="Autos" runat="server" autogeneratecolumns="False">
             
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

            <Columns>
                <asp:HyperLinkField
                        DataNavigateUrlFields="id_car"
                        DataNavigateUrlFormatString="~\AutoDelete.aspx?id={0}"
                        Text="Borrar" />
            </Columns>

            <Columns>

                <asp:HyperLinkField
                        DataNavigateUrlFields="id_car"
                        DataNavigateUrlFormatString="~\AutoEdit.aspx?id={0}"
                        Text="Editar" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
