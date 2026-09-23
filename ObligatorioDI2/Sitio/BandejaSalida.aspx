<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BandejaSalida.aspx.cs" Inherits="BandejaSalida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            height: 86px;

        }
        .titulo {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="titulo">
        BANDEJA DE SALIDA</p>
    <p>
        &nbsp;
        <asp:GridView ID="gvSalida" runat="server" AutoGenerateColumns="False" AllowPaging="True"  PageSize="5" OnPageIndexChanging="gvSalida_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="grid" DataKeyNames="NumIdenti" GridLines="Vertical" Height="129px" OnSelectedIndexChanged="GrillaSalida_SelectedIndexChanged" Width="496px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="FyHEnvio" HeaderText="Fecha" />
        <asp:BoundField DataField="Asunto" HeaderText="Asunto" />
        <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p style="text-align:center" margin: 0>
        Mensaje Completo:&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="lbMensaje" runat="server" Height="97px" Width="510px"></asp:ListBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p style="text-align:center" margin: 0>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style7" style="text-align:center" margin: 0>
        FILTRAR GRILLA POR:&nbsp;&nbsp;&nbsp; AÑO:&nbsp;
        <asp:TextBox ID="txtAño" runat="server" Width="60px" ></asp:TextBox>
&nbsp; MES:&nbsp;&nbsp;<asp:TextBox ID="txtMes" runat="server" Width="64px"  ></asp:TextBox>
        &nbsp;&nbsp; USUARIO DESTINATARIO:&nbsp;&nbsp;
        <asp:TextBox ID="txtDestino" runat="server" Width="98px"></asp:TextBox>
&nbsp;
        &nbsp;CATEGORIA DE MENSAJE:
        &nbsp;<asp:DropDownList ID="ddlCategoria" runat="server" Height="16px" Width="118px">
        </asp:DropDownList>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnFiltrar" runat="server" Text="FILTRAR" Width="154px" OnClick="btnFiltrar_Click" />
    &nbsp;
        <asp:Button ID="btnLimpiar" runat="server" Text="LIMPIAR FILTROS" OnClick="btnLimpiar_Click" />
    </p>
    <p class="auto-style7">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>


