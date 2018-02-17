﻿using GymSystemBusiness;
using GymSystemEntity;
using System;
using System.Text;
using System.Web.UI.WebControls;

public partial class ViewSocios : System.Web.UI.Page
{
    SocioBO socioBO;
    StringBuilder htmlTable;

    protected void Page_Load(object sender, EventArgs e)
    {
        socioBO = new SocioBO();
        

        if ((Request.QueryString["accion"] == "actualizar"))
        {
            actualizarEstado(Int32.Parse(Request.QueryString["id"]), Int32.Parse(Request.QueryString["estadoActual"]));
        }
        else {
            GenerarTabla(htmlTable);
        }
    }

    private void GenerarTabla(StringBuilder htmlTable)
    {
        htmlTable = new StringBuilder();
        foreach (SocioEntity socio in socioBO.GetList())
        {
            if(socio != null)
            {
                htmlTable.Append("<tr>");
                htmlTable.Append("<td>" + socio.Nombre + "</td>");
                htmlTable.Append("<td>" + socio.Apellido + "</td>");
                htmlTable.Append("<td>" + socio.Email+ "</td>");
                htmlTable.Append("<td>" + socio.Telefono + "</td>");
                htmlTable.Append("<td>" + socio.FechaNacimiento.ToString("dd'/'MM'/'yyyy")+ "</td>");
                htmlTable.Append("<td>" + socio.NroTarjetaIdentificacion + "</td>");
                htmlTable.Append("<td>");
                htmlTable.Append(SetBtnEstado(socio.IdEstado, socio.Id));
                htmlTable.Append("</td>");
                htmlTable.Append("<td>");
                htmlTable.Append("<a href=\"../socios/ViewSocio.aspx?id="+ socio.Id + "\"class=\"btn btn-primary btn-xs\" ><i class=\"fa fa-eye\" ></i> Ver / Editar </a>");
                //htmlTable.Append("<a href=\"#\" class=\"btn btn-info btn-xs\" ><i class=\"fa fa-pencil\" ></i> Editar </a>");
                htmlTable.Append("</td>");
                htmlTable.Append("</tr>");
            }
        }
        TablaPlaceHolder.Controls.Add(new Literal{
            Text = htmlTable.ToString()
        });
    }

    private string SetBtnEstado(int estado, int id) {
        StringBuilder cadena = new StringBuilder();
        string btn;
        string thumb;
        string texto;

        switch (estado)
        {
            case 1:
                btn = "success ";
                thumb = "up";
                texto = "Activo";
                break;
            case 2:
            default:
                btn = "danger ";
                thumb = "down";
                texto = "Inactivo";
                break;
            
        }
        
        //< a href = "#" class="btn btn-success btn-xs"><i class="fa fa-thumbs-o-up"></i> activo</a>
        cadena.Append("<a href=\"../socios/ViewSocios.aspx?id="+id+"&accion=actualizar&estadoActual="+estado + "\" class=\"btn btn-");
        cadena.Append(btn);
        cadena.Append("btn-xs\"><i class=\"fa fa-thumbs-o-");
        cadena.Append(thumb);
        cadena.Append("\"></i>");
        cadena.Append(texto);
        cadena.Append("</a>");

        return cadena.ToString();
    }

    protected void actualizarEstado(int id, int estadoActual) {
        int estadoNuevo = (estadoActual == 2) ? 1 : 2;
        socioBO.ActualizarEstadoSocio(id, estadoNuevo);
        Response.Redirect("ViewSocios.aspx");
    }
}

