﻿using System;
using System.Web.UI;
using GymSystemBusiness;
using GymSystemWebUtil;


public partial class site_web_login_loginform : System.Web.UI.Page
{
    private PersonaBO boUsuario = new PersonaBO();


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
          SessionHelper.AlmacenarPersonaAutenticada(boUsuario.Autenticar(username.Value, password.Value));
          System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.PersonaAutenticada.Email, false);
          Page.Response.Redirect("~/site-web/home/HomeSiteWeb.aspx");

        }
        catch (AutenticacionExcepcionBO ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }

      



    }
}