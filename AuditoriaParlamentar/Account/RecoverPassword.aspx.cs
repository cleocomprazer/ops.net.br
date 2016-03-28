using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaParlamentar.Account
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            MySqlMembershipProvider member = new MySqlMembershipProvider();
            String retorno = member.RecuperaSenhaEmail(TextBoxUser.Text);

            if (retorno == "")
            {
                dvAlerta.Visible = true;
                dvAlertaMensagem.InnerText = "Um e-mail foi enviado com instruções para recuperar sua senha.";
            }
            else
            {
                UsernameValidator.ErrorMessage = retorno;
                UsernameValidator.IsValid = false;
            }
        }
    }
}