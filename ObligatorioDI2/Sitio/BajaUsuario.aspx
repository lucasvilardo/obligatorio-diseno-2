<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BajaUsuario.aspx.cs" Inherits="BajaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style11 {
            width: 764px;
            height: 337px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p style="margin: 0 auto; text-align: center; font-size: 24px; font-weight: bold;">
        BAJA DE USUARIO</p>
     <p style="margin: 0 auto; text-align: center; font-size: 24px; font-weight: bold;">
         &nbsp;</p>
        <table border="1" class="auto-style11" style="margin: 0 auto; text-align: center;">
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnBaja" runat="server" OnClick="btnIngresar_Click" Text="DAR BAJA" Width="450px" Height="115px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>


