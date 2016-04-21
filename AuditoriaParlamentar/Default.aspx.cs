using AuditoriaParlamentar.Classes;
using System;
using System.Data;
using System.Web;

namespace AuditoriaParlamentar
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    btnAuditar.HRef = System.Web.Security.FormsAuthentication.LoginUrl;
                }

                try
                {
                    rptResumoAuditoria.DataSource = ComandoSQL.ExecutarConsultaSimples(Cache, ComandoSQL.eGrupoComandoSQL.ResumoAuditoria);
                    rptResumoAuditoria.DataBind();
                }
                catch (Exception)
                {
                    rptResumoAuditoria.Visible = false;
                }

                try
                {
                    Parlamentar vo_Parl = new Parlamentar();
                    DataTable vdt_Card = vo_Parl.recuperaCards();

                    rptMaioresGastos.DataSource = vdt_Card.Select("tipoCartao='MAIOR'").CopyToDataTable();
                    rptMaioresGastos.DataBind();

                    rptMenoresGastos.DataSource = vdt_Card.Select("tipoCartao='MENOR'").CopyToDataTable();
                    rptMenoresGastos.DataBind();
                }
                catch (Exception)
                { }
            }
        }
    }
}