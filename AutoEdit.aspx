<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoEdit.aspx.cs" Inherits="AutoEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="marca"></asp:Label>
        <br />
        <asp:Label runat="server" ID="modelo"></asp:Label>
        <br />
        <p>Precio: </p>
        <asp:TextBox runat="server" ID="Precio" />
        <br />
        <br />
        <asp:Button runat="server" Text="Editar" ID="Editar" OnClick="Editar_Click" />                
    </div>
    </form>
</body>
</html>
