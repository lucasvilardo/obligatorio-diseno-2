<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaUsuario.aspx.cs" Inherits="AltaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">



         .auto-style10 {
             width: 60%;
             height: 61px;
             margin-left: 210px;
         }
         .auto-style12 {
             height: 54px;
         }
             
       
        .auto-style5 {
            height: 42px;
        }
        .auto-style20 {
            margin-left: 40px;
        }
         .auto-style13 {
             height: 54px;
             width: 270px;
         }
         .auto-style3 {
            width: 270px;
            height: 33px;
        }
        .auto-style4 {
            height: 33px;
        }
        
       
        .auto-style4 {
            height: 80px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="auto-style20" style="text-align: center; font-size: 24px; font-weight: bold;">
                ALTA DE USUARIO<br />
                <br />
            </p>
        </div>
    <p style="text-align: center">
        <table border="3" class="auto-style10">
            <tr>
                <td class="auto-style13">Nombre de Usuario:</td>
                <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNomUsuario" runat="server" Width="258px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="auto-style3">Contraseña:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtContra" runat="server" Width="273px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Nombre Completo:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtNomCompleto" runat="server" Width="273px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Fecha de Nacimiento:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" Width="273px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Mail de contacto:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtMail" runat="server" Width="273px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2" style="text-align: center;">
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="365px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2" style="text-align: center;">&nbsp;&nbsp; &nbsp;
                    <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="ALTA" Width="154px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink >
        </p>
    </form>
    </body>
</html>
