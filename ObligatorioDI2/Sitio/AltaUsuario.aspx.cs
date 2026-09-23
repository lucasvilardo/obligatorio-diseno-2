using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LimpiarPantalla();
        }
    }

    private void LimpiarPantalla()
    {
        txtNomCompleto.Text = "";
        txtContra.Text = "";
        txtMail.Text = "";
        txtNomUsuario.Text = "";
        txtFecha.Text = "";
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarPantalla();
    }



    protected void btnAlta_Click(object sender, EventArgs e)
    {

        Diseño2Entities MiContexto = null;
        Usuario unUsu = null;
        try
        {
            MiContexto = Application["MiContexto"] as Diseño2Entities;

            unUsu = new Usuario()
            {
                NomUsuario = txtNomUsuario.Text.Trim(),
                Contraseña = txtContra.Text.Trim(),
                FechaNacimiento = Convert.ToDateTime(txtFecha.Text),
                NomCompleto = txtNomCompleto.Text.Trim(),
                Mail = txtMail.Text.Trim()
            };

            Validar.ValidoUsuario(unUsu);


        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
            return;
        }

        try
        {
            MiContexto.Usuario.Add(unUsu);
            MiContexto.SaveChanges();

            LimpiarPantalla();

            lblError.Text = "Alta con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;

            MiContexto.Entry(unUsu).State = System.Data.Entity.EntityState.Detached;
        }
    }
}