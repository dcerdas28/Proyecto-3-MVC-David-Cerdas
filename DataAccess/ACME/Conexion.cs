using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;//Agregado

namespace DataAccess.ACME
{
    public class Conexion
    {
        private readonly string? _cadenaConexion;

        public Conexion() {

            string? cadenaConexion;

            cadenaConexion = Environment.GetEnvironmentVariable("SQLSerververXE");

            _cadenaConexion = cadenaConexion;

        }//Constructor

        public SqlConnection Conectar() {

            SqlConnection sqlConn;

            //Instanciar la conexión utlizando la cadena de conexión obetenida

            sqlConn = new SqlConnection(_cadenaConexion);

            return sqlConn;        
        
        }//Función Conectar()




    }//class
}//space
