using AuditoriaParlamentar.Classes;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.HtmlControls;

namespace AuditoriaParlamentar
{
	public partial class SiteMaster : System.Web.UI.MasterPage
	{
		public bool autenticado;        

		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                autenticado = HttpContext.Current.User.Identity.IsAuthenticated;
                plcRevisor.Visible = autenticado;
                HyperLinkDeputadoFederal.HRef = "PesquisaInicio.aspx?cargo=" + Pesquisa.CARGO_DEPUTADO_FEDERAL;
                HyperLinkSenador.HRef = "PesquisaInicio.aspx?cargo=" + Pesquisa.CARGO_SENADOR;
            }
           
		}
        public void logout() {
               
        }
	}
}
