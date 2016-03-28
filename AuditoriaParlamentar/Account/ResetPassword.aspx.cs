using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaParlamentar.Account
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String chave = Request.QueryString["chave"];
                if (chave == null)
                {
                    Response.Redirect(System.Web.Security.FormsAuthentication.LoginUrl);
                }
            }
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            String chave = Request.QueryString["chave"];

            if (chave != null)
            {
                MySqlMembershipProvider member = new MySqlMembershipProvider();
                string retorno = member.RecuperaSenha(chave, NewPassword.Text);

                if (string.IsNullOrEmpty(retorno))
                {
                    Response.Redirect(System.Web.Security.FormsAuthentication.LoginUrl);
                }
                else
                {
                    dvAlerta.Visible = true;
                    dvAlertaMensagem.InnerText = retorno;
                }
            }
        }
    }
}