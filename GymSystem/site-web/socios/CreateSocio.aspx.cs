﻿using GymSystemBusiness;
using GymSystemComun;
using GymSystemEntity;
using GymSystemWebUtil;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class CreateSocio : System.Web.UI.Page
{
    private SocioBO boSocio;
    private ActividadBO boActividad;
    protected List<ActividadEntity> listaActividades;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (SessionHelper.PersonaAutenticada == null)
                throw new AutenticacionExcepcionBO();
            if (SessionHelper.PersonaAutenticada.tipoPersona != 'A')
                throw new AccessDeniedExceptionBO();
            boActividad = new ActividadBO();
            boSocio = new SocioBO();
            if (!Page.IsPostBack)
            {
                //listaActividades = boActividad.GetList();
                //llenarViewActividades();
            }
        }
        catch (AccessDeniedExceptionBO ex)
        {
            Response.Redirect("/site-web/home/HomeSiteWeb.aspx");
        }
        catch (AutenticacionExcepcionBO ex)
        {
            Response.Redirect("/site-web/login/loginform.aspx");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                SocioEntity entitySocio = new SocioEntity(new Random().Next(1, 99999), 1);
                entitySocio = (SocioEntity)popularEntity(entitySocio);
                foreach (ListItem item in actividades.Items)
                {
                    if (item.Selected)
                    {
                        entitySocio.actividad = string.Concat(entitySocio.actividad, item.Value + ",");
                    }
                }

                boSocio.Registrar(entitySocio, entitySocio.Email.Trim());
                WebHelper.MostrarMensaje(Page, ("Socio " + entitySocio.Nombre + " " + entitySocio.Apellido + " creado con exito."));
            }
        }
        catch (ActividadSinLugarExceptionBO ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
        catch (ValidacionExcepcionAbstract ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }
        catch (FormatException ex)
        {
            //WebHelper.MostrarMensaje(Page, ex.Message);
            WebHelper.MostrarMensaje(Page, ("Error en ingreso de datos: " + ex));
        }
        catch (Exception ex)
        {
            //WebHelper.MostrarMensaje(Page, ex.Message);
            WebHelper.MostrarMensaje(Page, ("Error en ingreso de datos: " + ex));
        }
        finally
        {
            //Response.Redirect("../socios/ViewSocios.aspx");
        }
    }

    protected PersonaEntity popularEntity(PersonaEntity entityPersona)
    {
        try
        {
            entityPersona.tipoPersona = 'S';
            entityPersona.Telefono = System.Convert.ToInt32(telefono.Value);
            entityPersona.Nombre = nombre.Value;
            entityPersona.Apellido = apellido.Value;
            entityPersona.dni = dni.Value;
            entityPersona.Email = email.Value;
            //entityPersona.Password = (passw1.Value.Equals(passw2.Value)) ? passw1.Value : null;
            entityPersona.Password = passw1.Value;
            entityPersona.Password2 = passw2.Value;

            string[] fechaArr = fechaNacimiento.Value.Split('-');
            entityPersona.FechaNacimiento = Util.ObtenerFecha(
                int.Parse(fechaArr[0]),
                int.Parse(fechaArr[1]),
                int.Parse(fechaArr[2]));

            char gen;
            if (masculino.Checked)
            {
                gen = 'M';
            }
            else
            {
                gen = 'F';
            }
            entityPersona.Sexo = gen;
            entityPersona.Foto = null;
            entityPersona.FechaRegistracion = DateTime.Now;
            entityPersona.FechaActualizacion = DateTime.Now;
        }
        catch (AutenticacionExcepcionBO ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
            entityPersona = null;
        }
        catch (Exception ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
            entityPersona = null;
        }
        return entityPersona;
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("../socios/ViewSocios.aspx");
    }
    /*
    public void llenarViewActividades()
    {
        ListItem li = new ListItem();
        actividades.Items.Clear();
        foreach (ActividadEntity act in listaActividades)
        {
            if (act != null)
            {
                li = new ListItem();
                li.Text = act.descripcion;
                li.Value = act.descripcion;
                actividades.Items.Add(new ListItem(act.name, act.idActividad.ToString()));
            }
        }
    }*/


    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = masculino.Checked || femenino.Checked;
    }

}