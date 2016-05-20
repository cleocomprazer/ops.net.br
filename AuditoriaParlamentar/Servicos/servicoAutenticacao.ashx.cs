using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft;
using Newtonsoft.Json;
using System.Web.SessionState;
using System.Web.Security;

namespace AuditoriaParlamentar.Servicos
{
    /// <summary>
    /// Summary description for servicoAutenticacao
    /// </summary>
    public class servicoAutenticacao : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {             
            context.Response.ContentType = "text/plain";                   
            FormsAuthentication.SetAuthCookie(context.Request.QueryString["nome"], true);
            context.Session.Add("nome", context.Request.QueryString["nome"].ToString());
            context.Session.Add("id_login", context.Request.QueryString["id"].ToString());
            context.Session.Add("contato", context.Request.QueryString["contato"].ToString());
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}