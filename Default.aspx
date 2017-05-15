<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Login ID = "Login1" runat = "server" OnAuthenticate= "ValidateUser" FailureText="Credenciales invalidas" Height="245px" LoginButtonText="Ingresar" PasswordLabelText="Contraseña: " PasswordRequiredErrorMessage="Contraseña es requerida" RememberMeText="Recordar credenciales" TitleText="Ingresar" UserNameLabelText="Correo: " UserNameRequiredErrorMessage="Correo es requerido" Width="566px"></asp:Login>
    </form>
</body>
</html>
