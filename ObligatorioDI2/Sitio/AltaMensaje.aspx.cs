using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data.SqlClient;
using System.Data;
using System.Data.Entity;
public partial class AltaMensaje : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {
                LimpioFormulario();

                Diseño2Entities MiContexto = Application["MiContexto"] as Diseño2Entities;

                List<Categoria> cates = MiContexto.Categoria.ToList();

                ddlCategorias.DataSource = cates;
                ddlCategorias.DataTextField = "NomCat";
                ddlCategorias.DataValueField = "CodCat";
                ddlCategorias.DataBind();

                ddlCategorias.Items.Insert(0, new ListItem("-- Seleccione categoría --", ""));

            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void LimpioFormulario()
    {
        try
        {
            txtAsunto.Text = "";
            txtFechaCaducidad.Text = "";
            txtTexto.Text = "";
            txtUsuariosEnvia.Text = "";
            lbUsuariosEnvia.Items.Clear();
            ddlCategorias.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            Diseño2Entities MiContexto = Application["MiContexto"] as Diseño2Entities;

            string usu = txtUsuariosEnvia.Text.Trim();

            Usuario unUsu = MiContexto.Usuario.Where(U => U.NomUsuario == usu).FirstOrDefault();

            if (unUsu == null)
            {
                txtUsuariosEnvia.Text = "";
                throw new Exception("El Usuario no existe.");
            }

                lbUsuariosEnvia.Items.Add(unUsu.NomUsuario);
                txtUsuariosEnvia.Text = "";
                lblError.Text = "Se agregó correctamente a la lista.";
            
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        List<Usuario> listaUsu = new List<Usuario>();
        Diseño2Entities MiContexto = null;
        Mensaje unM = null;
        MiContexto = Application["MiContexto"] as Diseño2Entities;
        DbContextTransaction trn = MiContexto.Database.BeginTransaction();

        try
        {
            
            string cateSele = ddlCategorias.SelectedValue;
            Categoria unaCate = MiContexto.Categoria.FirstOrDefault(C => C.CodCat == cateSele);

            if (unaCate == null)
                throw new Exception("Debe seleccionar una Categoría.");

            Usuario unUsu = Session["Usuario"] as Usuario;

            foreach (ListItem lugar in lbUsuariosEnvia.Items)
            {
                Usuario usuEnvia = MiContexto.Usuario.FirstOrDefault(U => U.NomUsuario == lugar.Text);

                listaUsu.Add(usuEnvia);
            }

            if (listaUsu.Count == 0)
                throw new Exception("Debe agregar almenos un usuario al que se le envíe.");

            unM = new Mensaje()
            {

                Texto = txtTexto.Text.Trim(),
                Asunto = txtAsunto.Text.Trim(),
                Categoria = unaCate,
                FechaCaducidad = DateTime.Parse(txtFechaCaducidad.Text),
                Usuario = unUsu,
                Usuario1 = listaUsu,
                FyHEnvio = DateTime.Now,

            };

            Validar.ValidoMensaje(unM);

            SqlParameter texto = new SqlParameter("@texto", unM.Texto);
            SqlParameter asunto = new SqlParameter("@asunto", unM.Asunto);
            SqlParameter fechaCadu = new SqlParameter("@caducidad", unM.FechaCaducidad);
            SqlParameter usuaEnvia = new SqlParameter("@nomUsuarioEnvia", unM.Usuario.NomUsuario);
            SqlParameter codCat = new SqlParameter("@codCat", unM.Categoria.CodCat);

            SqlParameter retorno = new SqlParameter("@ret", System.Data.SqlDbType.Int);
            retorno.Direction = System.Data.ParameterDirection.Output;

            MiContexto.Database.ExecuteSqlCommand("Exec AltaMensaje @asunto, @texto, @caducidad, @nomUsuarioEnvia, @codCat, @ret output",
                                        asunto, texto, fechaCadu, usuaEnvia, codCat, retorno);

            int retAlta = (int)retorno.Value;

            if ((int)retorno.Value == -1) 
                throw new Exception("No existe la categoría.");

            if ((int)retorno.Value == -2)
                throw new Exception("No existe el usuario que esta enviando.");

            if ((int)retorno.Value == -3)
                throw new Exception("Algo salió mal.");

            unM.NumIdenti = retAlta;

            foreach (Usuario usu in unM.Usuario1)
            {
                SqlParameter numIdenti = new SqlParameter("@numIdenti", unM.NumIdenti);
                SqlParameter nomUsuario = new SqlParameter("@nomUsuario", usu.NomUsuario);

                SqlParameter retorn = new SqlParameter("@ret", System.Data.SqlDbType.Int);
                retorn.Direction = System.Data.ParameterDirection.Output;

                MiContexto.Database.ExecuteSqlCommand("exec AltaReciben @numIdenti, @nomUsuario, @ret output", numIdenti, nomUsuario, retorn);

                if ((int)retorn.Value == -1) 
                    throw new Exception("El mensaje no existe.");

                if ((int)retorn.Value == -2)
                    throw new Exception("No existe el usuario que envía.");

                if ((int)retorn.Value == -3)
                    throw new Exception("No se puede mandar dos veces el mismo mensaje al mismo usuario.");

                if ((int)retorn.Value == -4)
                    throw new Exception("Ocurrió un error inesperado.");

            }

            trn.Commit();

            LimpioFormulario();

            lblError.Text = "Alta de mensaje exitoso.";

        }
        catch (Exception ex)
        {
            trn.Rollback();

            lblError.Text = ex.Message;
            return;
        }

       
    }
}