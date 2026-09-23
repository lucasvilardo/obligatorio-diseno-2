<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 29%;
        }
        .auto-style2 {
            width: 73px;
        }
        
        .contenedor {
            text-align: center;
            margin: 0 auto;
        }
        table {
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="contenedor">

            
            <table class="auto-style1" style="text-align: left;">
                <tr>
                    <td class="auto-style2">Usuario:</td>
                    <td>
                        <asp:TextBox ID="TxtUsuario" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password:</td>
                    <td>
                        <asp:TextBox ID="TxtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="BtnLogueo" runat="server" Text="LogIn" OnClick="BtnLogueo_Click" />
                    </td>
                </tr>
            </table>

            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Maroon">CREAR UN USUARIO</asp:HyperLink>
            <br /><br />

           
            <asp:Label ID="LblError" runat="server"></asp:Label><br />
            <asp:Label ID="Label1" runat="server"></asp:Label><br />
            <asp:Label ID="Label2" runat="server"></asp:Label><br />
            <asp:Label ID="Label4" runat="server"></asp:Label><br /><br />

           
            <asp:GridView ID="gvMailsporCategoria" runat="server" Height="178px" Width="470px"></asp:GridView>

        </div>
    </form>
</body>
</html>