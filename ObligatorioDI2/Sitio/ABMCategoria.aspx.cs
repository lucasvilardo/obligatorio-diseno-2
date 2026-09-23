using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
public partial class ABMCategoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                LimpioPantalla();
                DesactivoBotones();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

        

    }

    private void DesactivoBotones()
    {
        btnAlta.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
        btnBuscar.Enabled = true;
    }

    private void LimpioPantalla()
    {
        txtCodigo.Text = "";
        txtNombre.Text = "";
        txtCodigo.Enabled = true;
        txtNombre.Enabled = false;
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioPantalla();
        DesactivoBotones();
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;
        Categoria unaCate = null;

        try
        {
            MiContexto = Application["MiContexto"] as Diseño2Entities;

            unaCate = new Categoria()
            {
                NomCat = txtNombre.Text.Trim(),
                CodCat = txtCodigo.Text.Trim()

            };

            Validar.ValidoCategoria(unaCate);
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
            return;
        }

        try
        {
            MiContexto.Categoria.Add(unaCate);
            MiContexto.SaveChanges();

            LimpioPantalla();
            DesactivoBotones();

            lblError.Text = "Alta con éxito";

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;

            MiContexto.Entry(unaCate).State = System.Data.Entity.EntityState.Detached;
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            Diseño2Entities MiContexto = Application["MiContexto"] as Diseño2Entities;

            Categoria unaCate = MiContexto.Categoria.Where(C => C.CodCat.Trim() == txtCodigo.Text.Trim()).FirstOrDefault();

            if (unaCate == null)
            {
                txtNombre.Enabled = true;
                txtCodigo.Enabled = false;
                btnBuscar.Enabled = false;
                btnAlta.Enabled = true;

                Session["ABMCategoria"] = null;
            }
            else
            {
                txtNombre.Enabled = true;
                btnBuscar.Enabled = false;
                btnEliminar.Enabled = true;
                btnModificar.Enabled = true;
                txtCodigo.Enabled = false;

                Session["ABMCategoria"] = unaCate;

                txtNombre.Text = unaCate.NomCat;

            }
        }
        catch (Exception ex) 
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;
        Categoria unaCate = null;


        try
        {

             MiContexto = Application["MiContexto"] as Diseño2Entities;
             unaCate = Session["ABMCategoria"] as Categoria;

            unaCate.NomCat = txtNombre.Text.Trim();

            Validar.ValidoCategoria(unaCate);

            MiContexto.SaveChanges();

            LimpioPantalla();
            DesactivoBotones();

            lblError.Text = "Se modificó la categoria correctamente.";
        }
        catch (Exception ex)
        {
            MiContexto.Entry(unaCate).State = System.Data.Entity.EntityState.Detached;
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {

        Diseño2Entities MiContexto = null;

        Categoria unaCate = null;

        try
        {
             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unaCate = Session["ABMCategoria"] as Categoria;

            Boolean tiene = (from unM in MiContexto.Mensaje
                             where unM.Categoria.CodCat.Trim() == unaCate.CodCat.Trim()
                             select unM
                                ).Any();

            if (tiene)
            {
                lblError.Text = "No se puede eliminar la categoría porque tiene mensajes asociados.";
                
                return;
            }

            MiContexto.Categoria.Remove(unaCate);
            MiContexto.SaveChanges();

            LimpioPantalla();
            DesactivoBotones();

            lblError.Text = "Categoría eliminada correctamente.";

        }
        catch (Exception ex)
        {
            MiContexto.Entry(unaCate).State = System.Data.Entity.EntityState.Detached;
            lblError.Text = ex.Message;
        }
    }
}