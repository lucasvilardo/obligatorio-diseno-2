<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ABMCategoria.aspx.cs" Inherits="ABMCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style13 {
            height: 44px;
            width: 270px;
        }

        .auto-style12 {
            height: 44px;
            width: 659px;
        }

        .auto-style15 {
            width: 924px;
            margin: 0 auto;
            text-align: center;
            height: 243px;
        }

        .titulo {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        
        .contenedor {
            text-align: center;
        }
        .auto-style16 {
            height: 48px;
        }
        .auto-style17 {
            height: 46px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contenedor">
        <p class="titulo">ABM DE CATEGORÍA</p>

        <table border="3" class="auto-style15">
            <tr>
                <td class="auto-style13">Nombre de Categoría:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNombre" runat="server" Width="304px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">Código de Categoría:</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtCodigo" runat="server" Width="304px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="112px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" Width="359px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;" class="auto-style16">
                    <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="Alta" Width="154px" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnModificar" runat="server" OnClick="btnModificar_Click" Text="Modificar" Width="154px" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" Width="154px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
