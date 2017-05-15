<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoDelete.aspx.cs" Inherits="AutoDelete" %>

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
            <asp:Label runat="server" ID="precio"></asp:Label>
            <br />
            <br />
            <asp:Button runat="server" Text="Borrar" ID="Borrar" OnClick="Borrar_Click" />
    </div>
    </form>
</body>
</html>
