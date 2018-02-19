﻿using GymSystemBusiness;
using GymSystemEntity;
using System;
using System.Collections.Generic;
using System.Text;

public partial class ViewSocios : System.Web.UI.Page
{
    private EmpleadoBO empleadoBO;
    private StringBuilder htmlTable;
    protected List<EmpleadoEntity> listaEmpleados;

    protected void Page_Load(object sender, EventArgs e)
    {
        empleadoBO = new EmpleadoBO();
        listaEmpleados = empleadoBO.GetList();
    }
}