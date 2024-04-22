using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ACME
{
    public class TipoEmpresaEntidad
    {
        public int IDTipoEmpresa { get; set; }
        public string TipoEmpresa { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public string SiglaMyProperty { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;

    }//class
}//space
