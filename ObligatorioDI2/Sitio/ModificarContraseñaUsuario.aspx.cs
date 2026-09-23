using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

public partial class ModificarContraseñaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                LimpiarPantalla();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        
        
    }

    private void LimpiarPantalla()
    {
        txtContraActual.Text = "";
        txtContraNueva.Text = "";
        txtContraNueva2.Text = "";
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarPantalla();
    }



    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;

        Usuario unUsu = null;

        string contraActual = txtContraActual.Text.Trim();
        string contraNueva = txtContraNueva.Text.Trim();
        string contraNueva2 = txtContraNueva2.Text.Trim();

        try
        {
            MiContexto = Application["MiContexto"] as Diseño2Entities;

            unUsu = Session["Usuario"] as Usuario;

            if (contraNueva != contraNueva2)
            {
                lblError.Text = "Las nuevas contraseñas deben coincidir.";
                return;
            }
            if (contraActual != unUsu.Contraseña)
            {
                lblError.Text = "La contraseña actual no coincide con la del Usuario";
                return;
            }

            unUsu.Contraseña = txtContraNueva.Text.Trim();

            Validar.ValidoUsuario(unUsu);

            MiContexto.SaveChanges();

            LimpiarPantalla();

            lblError.Text = "Modificación de contraseña dada con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}