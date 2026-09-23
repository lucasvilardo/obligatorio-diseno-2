using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Validar
    {
        public static void ValidoUsuario(Usuario unUsu)
        {
            if (unUsu.NomUsuario.Trim().Length <= 8 || unUsu.NomUsuario.Trim().Length > 30)
                throw new Exception("El nombre de Usuario es entre 8 y 30 caracteres.");

            if (!System.Text.RegularExpressions.Regex.IsMatch(unUsu.Mail, "[a-zA-Z0-9]{3,40}[@][a-zA-Z]{3,10}[.][a-zA-Z]{3,10}"))
                throw new Exception("El formato del mail es incorrecto.");

            if (unUsu.NomCompleto.Trim().Length <= 8 || unUsu.NomCompleto.Trim().Length > 30)
                throw new Exception("El nombre completo es entre 8 y 30 caracteres.");

            if (!System.Text.RegularExpressions.Regex.IsMatch(unUsu.Contraseña.Trim(), @"^[a-zA-Z]{3}[0-9]{3}[^a-zA-Z0-9]{2}$"))
                throw new Exception("La contraseña debe ser de 8 caracteres con el formato correcto.");

            if (unUsu.FechaNacimiento > DateTime.Now)
                throw new Exception("La fecha de nacimiento debe ser menor a la de hoy.");

        }

        public static void ValidoCategoria(Categoria unaCate)
        {
            if (!System.Text.RegularExpressions.Regex.IsMatch(unaCate.CodCat, "[a-zA-Z]{3}"))
                throw new Exception("El código de la categoría debe ser de 3 Letras.");

            if (unaCate.NomCat == null || unaCate.NomCat.Length > 30)
                throw new Exception("La Categoría debe tener un nombre y debe ser menor a 30 caracteres.");
        }

        public static void ValidoMensaje(Mensaje unMen)
        {
            if (unMen.Asunto.Length > 80 || unMen.Asunto == null || unMen.Asunto.Length == 0)
                throw new Exception("El asunto debe ser menor a 80 caracteres.");

            if (unMen.Texto.Length > 8000 || unMen.Texto == null || unMen.Texto.Length == 0)
                throw new Exception("El texto excedió el límite de caracteres.");

            if (unMen.Usuario == null)
                throw new Exception("El mensaje debe tener un Usuario asociado.");

            if (unMen.Usuario1 == null || unMen.Usuario1.Count() == 0) 
                throw new Exception("El mensaje debe ser enviado a minimo 1 usuario.");
            
            if (unMen.Categoria == null)
                throw new Exception("El mensaje común debe tener una Categoría asociada.");

            if (unMen.FechaCaducidad < DateTime.Now.AddDays(1))
                throw new Exception("La fecha de caducidad debe ser como mínimo 1 día.");

        }

    }
}
