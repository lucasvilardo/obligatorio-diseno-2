using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Application["MiContexto"] == null)
                Application["MiContexto"] = new Diseño2Entities();

            Diseño2Entities MiContexto = Application["MiContexto"] as Diseño2Entities;

            if (!IsPostBack)
            {
                int resLab1 = (from unU in MiContexto.Usuario select unU).Count();
                Label1.Text = "CANTIDAD DE USUARIOS ACTIVOS: " + resLab1;

                int resLab2 = (from unM in MiContexto.Mensaje select unM).Count();
                Label2.Text = "CANTIDAD DE MENSAJES EN EL SISTEMA: " + resLab2;

              List<Object> listas = (from unM in MiContexto.Mensaje.ToList()
                                     group unM by unM.Categoria.CodCat into grupo
                              select new
                              {
                                  Categoria = grupo.First().Categoria.NomCat,
                                  CantidadMails = grupo.Count()
                              }
                                      ).ToList<Object>();

                gvMailsporCategoria.DataSource = listas;
                gvMailsporCategoria.DataBind();

                int resLab4 = (from unM in MiContexto.Mensaje where unM.Usuario1.Count() > 5 select unM).Count();
                Label4.Text = "CANTIDAD DE MENSAJES CON MAS DE 5 DESTINATARIOS: " + resLab4;
            }
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message;
        }
    }

    protected void BtnLogueo_Click(object sender, EventArgs e)
    {
        try
        {
            Diseño2Entities MiContexto = Application["MiContexto"] as Diseño2Entities;

            string nombre = TxtUsuario.Text.Trim();
            string pass = TxtPass.Text.Trim();

            Usuario unUsu = MiContexto.Usuario.Where(U => U.NomUsuario.Trim() == nombre && U.Contraseña.Trim() == pass).FirstOrDefault();

            if (unUsu == null)
            {
                LblError.Text = "El usuario o contraseña son incorrectos.";
                TxtUsuario.Text = "";
            }
            else
            {
                Session["Usuario"] = unUsu;
                Response.Redirect("~/AltaMensaje.aspx");
            }
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message;
        }
    }
}