<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModificarContraseñaUsuario.aspx.cs" Inherits="ModificarContraseñaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style7 {
            height: 60px;
            width: 177px;
        }
        .auto-style8 {
            width: 84%;
            height: 60px;
        }
        .auto-style11 {
            width: 780px;
            height: 285px;
        }
        .auto-style12 {
            width: 361px;
            height: 39px;
        }
        .auto-style13 {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p  style="text-align: center; font-size: 24px; font-weight: bold;">
        MODIFICAR LA CONTRASEÑA DEL USUARIO</p>
    <p>
        &nbsp;</p>
    <p>
        <table border="1" class="auto-style11" style="margin: 0 auto; text-align: center;">
            <tr>
                <td class="auto-style7">Ingresar su Contraseña actual:</td>
                <td class="auto-style8" style="text-align: center;">
                    <asp:TextBox ID="txtContraActual" runat="server" Width="396px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Ingresar su nueva Contraseña:</td>
                <td class="auto-style3" style="text-align: center;">
                    <asp:TextBox ID="txtContraNueva" runat="server" TextMode="Password" Width="392px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12" style="text-align: center;">Ingresar nuevamente su nueva Contraseña</td>
                <td class="auto-style13" style="text-align: center;">
                    <asp:TextBox ID="txtContraNueva2" runat="server" TextMode="Password" Width="392px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnModificar" runat="server" OnClick="btnIngresar_Click" Text="MODIFICAR" Width="229px"  />
                &nbsp;&nbsp;
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="199px" OnClick="btnLimpiar_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

