using AuditoriaParlamentar.Classes;
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
            dvAlerta.Visible = true;
            if (TextBoxUser.Text.Equals(string.Empty))
            {
                dvAlertaMensagem.InnerText = "Você precisa inserir o seu usuário.";
            }else{
                MySqlMembershipProvider member = new MySqlMembershipProvider();
                MySqlMembershipProvider provider = new MySqlMembershipProvider();                
                String retorno = member.RecuperaSenhaEmail(TextBoxUser.Text);

                if (retorno == "")                                    
                    dvAlertaMensagem.InnerText = "Um e-mail foi enviado com instruções para recuperar sua senha.";                
                else                
                    dvAlertaMensagem.InnerText = retorno;                
            }
        }
    }
}