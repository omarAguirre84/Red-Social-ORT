﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GymSystemEntity;
using GymSystemData;
using GymSystemDataSQLServer;

namespace GymSystemBusiness
{
    public class UsuarioBO
    {
        private PersonaDA daUsuario;

        public UsuarioBO()
        {
            daUsuario = new PersonaDA();
        }

        public UsuarioEntity Autenticar(string email, string password)
        {
            try
            {
                UsuarioEntity usuario = daUsuario.BuscarUsuario(email, password);

                if (usuario == null)
                    throw new AutenticacionExcepcionBO();

                return usuario;
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del usuario.", ex);
            }
        }

        public void Registrar(UsuarioEntity usuario, string emailVerificacion)
        {
            try
            {
                usuario.ValidarDatos();

                if (daUsuario.ExisteEmail(usuario.Email))
                    throw new EmailExisteExcepcionBO();

                if (usuario.Email != emailVerificacion.Trim())
                    throw new VerificacionEmailExcepcionBO();

                daUsuario.Insertar(usuario);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del usuario.", ex);
            }
        }

        public void ActualizarFoto(int id, string nombreArchivo, byte[] archivoFoto)
        {
            try
            {
                daUsuario.Actualizar(id, nombreArchivo, archivoFoto);
            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo actualizar la foto.", ex);
            }
        }

        public void getListUsers()
        {
            //private Array<UsuarioEntity> listPerson = new UsuarioEntity()[];
            try
            {
                //daUsuario.Insertar(usuariko);
                daUsuario.ListarUsuarios();
                //return listPerson;
    }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la registración del usuario.", ex);
            }
        }
    }
}
