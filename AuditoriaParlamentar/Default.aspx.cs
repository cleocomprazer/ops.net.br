using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuditoriaParlamentar.Classes;

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

                //try
                //{
                //    Noticia noticia = new Noticia();
                //    noticia.UltimasNoticias(Cache, rptNoticia);
                //}
                //catch (Exception)
                //{
                //    dvNoticias.Visible = false;
                //}
            }
        }
    }
}