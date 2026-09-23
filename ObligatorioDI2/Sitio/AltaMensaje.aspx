<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaMensaje.aspx.cs" Inherits="AltaMensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

         .auto-style12 {
             height: 54px;
         }
         .auto-style14 {
            height: 174px;
        }
        .auto-style16 {
            height: 42px;
            width: 243px;
        }
        .auto-style21 {
            height: 42px;
            width: 336px;
        }
        .auto-style24 {
            height: 42px;
            width: 510px;
        }
        .auto-style19 {
            height: 42px;
            width: 478px;
        }
    
       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="2" class="auto-style10" style="text-align:center">
        <tr>
            <td class="auto-style12" colspan="2">TEXTO:</td>
            <td class="auto-style12" colspan="2">ASUNTO:</td>
        </tr>
        <tr>
            <td class="auto-style14" colspan="2">
                <asp:TextBox ID="txtTexto" runat="server" Height="142px" Width="650px"></asp:TextBox>
            </td>
            <td class="auto-style14" colspan="2">&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtAsunto" runat="server" Height="99px" Width="152px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">Categoria:
                        <asp:DropDownList ID="ddlCategorias" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style21">Conjunto de Usuarios que&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; envía:&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtUsuariosEnvia" runat="server" Width="120px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Width="99px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ListBox ID="lbUsuariosEnvia" runat="server" Height="72px" Width="130px"></asp:ListBox>
            </td>
            <td class="auto-style24">&nbsp; Fecha de caducidad:<asp:TextBox ID="txtFechaCaducidad" runat="server" TextMode="Date" Width="182px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style19">
                <asp:Button ID="btnLimpiar" runat="server" Height="31px" OnClick="btnLimpiar_Click" Text="Limpiar" Width="89px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="4">
                <asp:Button ID="btnAlta" runat="server" Height="30px" OnClick="btnAlta_Click" Text="ALTA DE MENSAJE" Width="583px" />
                <br />
                <br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

