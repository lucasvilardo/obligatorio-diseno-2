using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

public partial class BandejaEntrada : System.Web.UI.Page
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
                listaMensajes = Session["ListaMensajesEntrada"] as List<Mensaje>;
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
                                           from dest in unM.Usuario1
                                            where dest == unUsu
                                            && unM.FechaCaducidad > DateTime.Now
                                            orderby unM.FyHEnvio descending
                                            select unM).ToList();

            gvEntrada.DataSource = listaMensajes;
            gvEntrada.DataBind();

            ddlCategoria.DataSource = MiContexto.Categoria.ToList();
            ddlCategoria.DataTextField = "NomCat";
            ddlCategoria.DataValueField = "CodCat";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Seleccionar Categoría: "));
            ddlCategoria.SelectedIndex = 0;

            Session["ListaMensajesEntrada"] = listaMensajes;
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
            txtFecha.Text = "";
            txtRemite.Text = "";
            lblError.Text = "";
            ddlCategoria.SelectedIndex = 0;
            lbMensaje.Items.Clear();

            listaFiltros = null;
            Session["ListaFiltro"] = null;

            listaMensajes = Session["ListaMensajesEntrada"] as List<Mensaje>;

            gvEntrada.DataSource = listaMensajes;
            gvEntrada.DataBind();
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
             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unUsu = Session["Usuario"] as Usuario;

             listaFiltros = Session["ListaMensajesEntrada"] as List<Mensaje>;

            if (txtFecha.Text.Length > 0)
            {
                DateTime fechaSel = Convert.ToDateTime(txtFecha.Text);

                if (fechaSel.Date > DateTime.Now.Date)
                    throw new Exception("La fecha no puede ser a futuro.");

                listaFiltros = (from unM in listaFiltros
                                where unM.FyHEnvio.Date == fechaSel.Date
                                select unM).ToList();

            }

            if (txtRemite.Text.Trim().Length > 0)
            {


                string remite = txtRemite.Text.Trim();

                listaFiltros = (from unM in listaFiltros
                                where unM.Usuario.NomUsuario == remite
                                select unM).ToList();
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

                gvEntrada.DataSource = listaFiltros;
                gvEntrada.DataBind();

                lbMensaje.Items.Clear();
            }
            else 
            {

                listaFiltros = null;
                Session["ListaFiltro"] = null;
                gvEntrada.DataSource = null;
                gvEntrada.DataBind();

                lblError.Text = "Sus filtros no tienen ningun resultado";
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void GrillaEntrada_SelectedIndexChanged(object sender, EventArgs e)
    {
        Diseño2Entities MiContexto = null;
        Usuario unUsu = null;
        List<Mensaje> listaMen = null;

        try
        {
             MiContexto = Application["MiContexto"] as Diseño2Entities;

             unUsu = Session["Usuario"] as Usuario;

            listaMen = Session["ListaMensajesEntrada"] as List<Mensaje>;

            int indice = gvEntrada.SelectedIndex;

           Mensaje mensajeSeleccionado = listaMen[indice];

          

            lbMensaje.Items.Clear();

            if (mensajeSeleccionado != null && mensajeSeleccionado.FechaCaducidad > DateTime.Now)
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

    protected void gvEntrada_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        List<Mensaje> listaMensajes = null;
        try
        {
            gvEntrada.PageIndex = e.NewPageIndex;

            listaMensajes = Session["ListaMensajesEntrada"] as List<Mensaje>;


            List<Mensaje> listaMensajesPag = (listaFiltros == null) ? listaMensajes : listaFiltros;


            gvEntrada.DataSource = listaMensajesPag;
            gvEntrada.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
        
    }
}