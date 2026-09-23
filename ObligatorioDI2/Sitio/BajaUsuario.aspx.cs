using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data.SqlClient;

public partial class BajaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;
        Usuario unUsu = null;
        try
        {
             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unUsu = Session["Usuario"] as Usuario;

            Boolean tiene = (from unM in MiContexto.Mensaje where
                             unM.Usuario.NomUsuario == unUsu.NomUsuario || unM.Usuario1.Any(u => u.NomUsuario == unUsu.NomUsuario)
                             select unM
                            ).Any();

            if (tiene)
                throw new Exception("No se puede eliminar, tiene mensajes asociados.");

            SqlParameter nomUsuario = new SqlParameter("@nomUsuario", unUsu.NomUsuario);

            SqlParameter retorno = new SqlParameter("@ret", System.Data.SqlDbType.Int);
            retorno.Direction = System.Data.ParameterDirection.Output;

            MiContexto.Database.ExecuteSqlCommand("exec BajaUsuario @nomUsuario", nomUsuario);

            if ((int)retorno.Value == -1)
            {
                throw new Exception("El usuario no se encontró.");
            }

            if ((int)retorno.Value == -2)
            {
                throw new Exception("El usuario tiene mensajes asociados.");
            }

            if ((int)retorno.Value == -3)
            {
                throw new Exception("Ocurrió un error inesperado.");
            }

            MiContexto.Entry(unUsu).State = System.Data.Entity.EntityState.Detached;
            MiContexto.SaveChanges();

            Session["Usuario"] = null;
            Response.Redirect("~/Default.aspx");

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}