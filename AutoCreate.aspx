<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoCreate.aspx.cs" Inherits="AutoCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList runat="server" ID="Marca" OnSelectedIndexChanged="Marca_SelectedIndexChanged" AutoPostBack="true"/>
        <br />
        <br />
        <asp:DropDownList runat="server" ID="Modelo" AutoPostBack="true" CausesValidation="false"/>
        <p>Precio: </p>
        <asp:TextBox runat="server" ID="Precio" />
        <br />
        <br />
        <asp:Button runat="server" ID="Crear" OnClick="Crear_Click" Text="Crear auto" />
    </div>
    </form>
</body>
</html>
