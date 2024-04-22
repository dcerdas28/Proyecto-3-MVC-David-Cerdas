using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ACME;
using DataAccess.ACME;

namespace Services.ACME
{
    public class EmpresaService
    {
        public bool Crear(EmpresaEntidad empresaEntidad) {
        
        EmpresaDA empresaDA = new EmpresaDA();

            try
            {

                empresaDA.Insertar(empresaEntidad);

                return true;

            }//try
            catch (Exception)
            {

                return false;

            }//catch
                    
        }//Método Crear

        public bool Actualizar(EmpresaEntidad empresaEntidad)
        {

            EmpresaDA empresaDA = new EmpresaDA();

            try
            {

                empresaDA.Modificar(empresaEntidad);

                return true;

            }//try
            catch (Exception)
            {

                return false;

            }//catch

        }//Método Actualizar

        public EmpresaEntidad? BuscarxID(int IDEmpresa) {

            EmpresaDA? empresaDA = new EmpresaDA();

            try
            {
                return empresaDA.BuscarID(IDEmpresa);

            }//try
            catch (Exception)
            {
                return null;
                
            }//catch
                
        
        }//Función BuscarxID

        public List<EmpresaEntidad>? Listar()
        {

            EmpresaDA? empresaDA = new EmpresaDA();

            try
            {
                return empresaDA.Listar();

            }//try
            catch (Exception)
            {
                return null;

            }//catch

        }//Función Listar

        public bool Eliminar(EmpresaEntidad empresaEntidad)
        {

            EmpresaDA empresaDA = new EmpresaDA();

            try
            {

                empresaDA.Anular(empresaEntidad);

                return true;

            }//try
            catch (Exception)
            {

                return false;

            }//catch

        }//Función Eliminar



    }//Class
}//Space
