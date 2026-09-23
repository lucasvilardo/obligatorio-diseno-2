using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

public partial class BandejaSalida : System.Web.UI.Page
{
    List<Mensaje> listaMensajes = null;
    List<Mensaje> listaFiltros = null;

    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {
            if (!IsPostBack)
            {
                CargoGrilla();
                Session["ListaFiltro"] = listaFiltros = null;
            }
            else
            {
                listaMensajes = Session["ListaMensajesSalida"] as List<Mensaje>;
                listaFiltros = Session["ListaFiltro"] as List<Mensaje>;
            }
        
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

        
        
            }

    private void CargoGrilla()
    {
        Diseño2Entities MiContexto = null;
        Usuario unUsu;
        try
        {
             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unUsu = Session["Usuario"] as Usuario;

            List<Mensaje> listaMensajes = (from unM in MiContexto.Mensaje.ToList()
                            where unM.Usuario.NomUsuario == unUsu.NomUsuario
                            orderby unM.FyHEnvio descending
                            select unM
            ).ToList();

            gvSalida.DataSource = listaMensajes;
            gvSalida.DataBind();

            ddlCategoria.DataSource = MiContexto.Categoria.ToList();
            ddlCategoria.DataTextField = "NomCat";
            ddlCategoria.DataValueField = "CodCat";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Seleccionar Categoría: "));
            ddlCategoria.SelectedIndex = 0;

            Session["ListaMensajesSalida"] = listaMensajes;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        try
        {
            txtAño.Text = "";
            txtMes.Text = "";
            txtDestino.Text = "";
            ddlCategoria.SelectedIndex = 0;
            lbMensaje.Items.Clear();

            listaFiltros = null;
            Session["ListaFiltro"] = null;

            listaMensajes = Session["ListaMensajesSalida"] as List<Mensaje>;

            gvSalida.DataSource = listaMensajes;
            gvSalida.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void GrillaSalida_SelectedIndexChanged(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;
        Usuario unUsu = null;
        List<Mensaje> listaMen = null;
        try
        {

             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unUsu = Session["Usuario"] as Usuario;

             listaMen = Session["ListaMensajesSalida"] as List<Mensaje>;

            int indice = gvSalida.SelectedIndex;

            Mensaje mensajeSeleccionado = listaMen[indice];

            lbMensaje.Items.Clear();

            if (mensajeSeleccionado != null)
            {
                lbMensaje.Items.Add("Texto: " + mensajeSeleccionado.Texto);
                lbMensaje.Items.Add("Asunto: " + mensajeSeleccionado.Asunto);
                lbMensaje.Items.Add("Fecha y Hora de enviado: " + mensajeSeleccionado.FyHEnvio);
                lbMensaje.Items.Add("Fecha de Caducidad: " + mensajeSeleccionado.FechaCaducidad);
                lbMensaje.Items.Add("Categoría: " + mensajeSeleccionado.Categoria.NomCat);
                lbMensaje.Items.Add("Número Identificatorio: " + mensajeSeleccionado.NumIdenti);
                lbMensaje.Items.Add("Usuario que lo envía: " + mensajeSeleccionado.Usuario.NomUsuario);
                lbMensaje.Items.Add("Lista de destinatarios: ");

                foreach (Usuario u in mensajeSeleccionado.Usuario1)
                {
                    lbMensaje.Items.Add(u.NomUsuario);
                }


            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void gvSalida_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        List<Mensaje> listaMensajes = null;

        try
        {
            gvSalida.PageIndex = e.NewPageIndex;

            listaMensajes = Session["ListaMensajesSalida"] as List<Mensaje>;
            

            List<Mensaje> listaMensajesPag = (listaFiltros == null) ? listaMensajes : listaFiltros;
            

            gvSalida.DataSource = listaMensajesPag;
            gvSalida.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        
    }

    protected void btnFiltrar_Click(object sender, EventArgs e)
    {
        Usuario unUsu = null;
        Diseño2Entities MiContexto = null;

        try
        {

             unUsu = Session["Usuario"] as Usuario;

             MiContexto = Application["MiContexto"] as Diseño2Entities;

             listaFiltros = Session["ListaMensajesSalida"] as List<Mensaje>;

            if (txtMes.Text.Trim().Length > 0)
            {
                
                int mes = Convert.ToInt32(txtMes.Text);
                

               
                if (mes < 1 || mes > 12)
                    lblError.Text = "MES: 1 al 12";



                listaFiltros = (from unM in listaFiltros
                                where unM.FyHEnvio.Month == mes
                                select unM).ToList();
            }

            if (txtAño.Text.Trim().Length > 0)
            {
                int año = Convert.ToInt32(txtAño.Text);

                if (año > DateTime.Now.Year)
                    lblError.Text = "El año debe ser menor o igual al actual.";

                listaFiltros = (from unM in listaFiltros
                                where unM.FyHEnvio.Year == año
                                select unM).ToList();
            }

            if (txtDestino.Text.Trim().Length > 0)
            { 

                string usuRemite = txtDestino.Text.Trim();

                listaFiltros = (from unM in listaFiltros
                                from unDest in unM.Usuario1
                                where unM.Usuario.NomUsuario == unUsu.NomUsuario &&
                                unDest.NomUsuario == usuRemite select unM
                    ).ToList();
            }

            if (ddlCategoria.SelectedIndex > 0)
            {

                string codCatSele = ddlCategoria.SelectedValue;

                listaFiltros = (from unM in listaFiltros
                                where unM.Categoria.CodCat == codCatSele
                                select unM).ToList();

            }

            if (listaFiltros.Count > 0)
            {

                Session["ListaFiltro"] = listaFiltros;

                gvSalida.DataSource = listaFiltros;
                gvSalida.DataBind();

                lbMensaje.Items.Clear();
            }
            else
            {

                listaFiltros = null;
                Session["ListaFiltro"] = null;
                gvSalida.DataSource = null;
                gvSalida.DataBind();

                lblError.Text = "Sus filtros no tienen ningun resultado";
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}