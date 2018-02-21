﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site-web/template-master/HomePrincipal.master" AutoEventWireup="true" CodeFile="CreateEmpleado.aspx.cs" Inherits="CreateEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">
                    <form class="form-horizontal form-label-left" novalidate runat="server">
                      <span class="section">Crear Empleado</span>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nombre <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="nombre" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="John" required="required" type="text" data-parsley-error-message="my message" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Apellido <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="apellido" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="apellido" placeholder="Doe" required="required" type="text" data-parsley-error-message="my message" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12" runat="server">
                        </div>
                      </div>
                        <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Telefono<span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="telefono" name="telefono" required="required" class="form-control col-md-7 col-xs-12" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">DNI <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="number" id="dni" name="dni" required="required" class="form-control col-md-7 col-xs-12" runat="server">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">Contraseña</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="passw1" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">Repetir Contraseña</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="passw2" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datebirth">Fecha de nacimiento <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="fechaNacimiento" type="date" name="fechaNacimiento" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" runat="server">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datebirth">Fecha de Ingreso <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="fechaIngreso" type="date" name="fechaIngreso" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" runat="server">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datebirth">Sexo<span class="required"></span>
                            </label>
                              <div class="col-md-6 col-xs-12">
                                  <div class="btn-group" data-toggle="buttons">
                                    <label id="masculinoLbl" class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary" runat="server">
                                      <input ID="masculino" type="radio" name="gender" class="btn btn-default" value="male" runat="server"> Masculino
                                    </label>
                                    <label id="femeninoLbl" class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-primary" runat="server">
                                      <input ID="femenino" type="radio" name="gender" value="female" runat="server"> Femenino
                                    </label>
                                  </div>
                            </div>
                        </div>

                    <div class="item form-group" id="groupActividad" runat="server">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datebirth">Actividades<span class="required"></span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:ListBox ID="actividades" CssClass="select--multiple" runat="server" SelectionMode="Multiple" multiple="multiple"></asp:ListBox>
                            </div>
                    </div>
                    
                    <div class="item form-group" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="typeEmpleado">Tipo de Empleado<span class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" OnSelectedIndexChanged="TypeEmpladoChanged" AutoPostBack="true">
                                <asp:ListItem id="item2" value="1" runat="server" OnSelectedIndexChanged="TypeEmpladoChanged" AutoPostBack="true" selected="true">
                                  Profesor
                               </asp:ListItem>
                                <asp:ListItem id="item3" value="2" runat="server" OnSelectedIndexChanged="TypeEmpladoChanged" AutoPostBack="true">
                                  Admin
                               </asp:ListItem>
                            </asp:DropDownList>
<%--                            <select id="typeEmpleado" name="typeEmpleado" class="form-control" runat="server" onChange="TypeEmpladoChanged" AutoPostBack="true" required>
                                <option value="">Elije tipo de empleado</option>
                                <option value="1">Profesor</option>
                                <option value="2">Admin</option>
                            </select> --%>   
                        </div>
                      </div>

                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Cancelar" OnClick="BtnCancelar_click"/>
                          <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Generar" OnClick="btnRegister_Click" />
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
</asp:Content>

