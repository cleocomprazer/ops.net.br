using System;
using System.Collections;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace AuditoriaParlamentar.Classes
{
    public class Email
    {
        internal Boolean Enviar(ArrayList destinatarios, String assunto, String texto, Boolean geraPendencia = true)
        {
            try
            {
                var mRemetente = System.Web.Configuration.WebConfigurationManager.AppSettings["EmailComunicacao"];
                var mSenhaEmail = System.Web.Configuration.WebConfigurationManager.AppSettings["SenhaEmailComunicacao"];

                var objEmail = new MailMessage()
                {
                    IsBodyHtml = true,
                    Subject = assunto,
                    Body = texto,
                    SubjectEncoding = Encoding.GetEncoding("ISO-8859-1"),
                    BodyEncoding = Encoding.GetEncoding("ISO-8859-1"),
                    From = new MailAddress(mRemetente, "OPS - Comunicação")
                };

                foreach (String destinatatio in destinatarios)
                {
                    objEmail.To.Add(destinatatio);
                }

                ServicePointManager.ServerCertificateValidationCallback = (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) => true;

                var objSmtp = new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(mRemetente, mSenhaEmail)
                };

                objSmtp.Send(objEmail);

                return true;
            }
            catch (Exception ex)
            {
                if (geraPendencia)
                {
                    GravaPendencia(destinatarios, assunto, texto);
                }
            }

            return false;
        }

        private Boolean GravaPendencia(ArrayList destinatarios, String assunto, String texto)
        {
            using (Banco banco = new Banco())
            {
                String dest = "";

                foreach (String destinatatio in destinatarios)
                {
                    dest += destinatatio + ";";
                }

                banco.AddParameter("destinatario", dest);
                banco.AddParameter("assunto", assunto);
                banco.AddParameter("texto", texto);

                if (banco.ExecuteNonQuery("INSERT INTO email_pendencia (destinatario, assunto, texto) VALUES (@destinatario, @assunto, @texto)") == false)
                {
                    return false;
                }
            }

            return true;
        }

        internal void ReEnviaEmail()
        {
            using (Banco banco = new Banco())
            {
                using (DataTable table = banco.GetTable("SELECT * FROM email_pendencia", 300))
                {
                    foreach (DataRow row in table.Rows)
                    {
                        ArrayList destinatarios = new ArrayList();
                        destinatarios.Add(row["destinatario"].ToString());

                        String assunto = row["assunto"].ToString();
                        String texto = row["texto"].ToString();

                        if (Enviar(destinatarios, assunto, texto, false) == true)
                        {
                            banco.ExecuteNonQuery("DELETE FROM email_pendencia WHERE id = " + row["id"].ToString());
                        }
                    }
                }
            }
        }
    }
}