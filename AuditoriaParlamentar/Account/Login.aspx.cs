using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;
using TweetSharp;
using System.Web.Security;
using System.Web.Services;
using AuditoriaParlamentar.Classes;

namespace AuditoriaParlamentar.Account
{
    public partial class Login : System.Web.UI.Page
    {
        private string oauth_consumer_key = "3YR8SDktQlftYhuCgblb6nyK7";
        private string oauth_consumer_secret = "W7epHv0G387cmk9MMprVVKNyb5d5LiJNilIKBBpu11VgHKermo";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            LoginUser.DestinationPageUrl = "~/PesquisaInicio.aspx";
            // Se o usuário está a acessando a página diretamente 
            if (Request["oauth_token"] != null)
            {
                // Se for um redirecionamento do método de validação
                var service = new TwitterService(oauth_consumer_key, oauth_consumer_secret);
                service.AuthenticateWith("405693330-WohzluBPOrvINLwLeaCgELbcBLjlZ0WCNRAbzhrf", "QVxmD9J1qXrruWgl8VlQf2BeqLRYOWpWTgA6o5FLNpFsp");
                TweetSharp.TwitterUser tuSelf = service.GetUserProfile(new GetUserProfileOptions() { IncludeEntities = false, SkipStatus = false });
                FormsAuthentication.SetAuthCookie(tuSelf.ScreenName, true);
                Session.Add("nome", tuSelf.ScreenName);
                Session.Add("id_login", tuSelf.Id);
                Session.Add("contato", tuSelf.Id + " - TwitterUserName:" + tuSelf.ScreenName);
                Response.Redirect("../Default.aspx");
            }
            if (Session["nome"] != null)
            {
                Response.Redirect("../Default.aspx");
            }
        }
        public void checaStatusTwitter(object sender, EventArgs e)
        {
            var service = new TwitterService(oauth_consumer_key, oauth_consumer_secret);
            service.AuthenticateWith("405693330-WohzluBPOrvINLwLeaCgELbcBLjlZ0WCNRAbzhrf", "QVxmD9J1qXrruWgl8VlQf2BeqLRYOWpWTgA6o5FLNpFsp");
            var reqToken = OAuthUtility.GetRequestToken(oauth_consumer_key, oauth_consumer_secret, Request.Url.AbsoluteUri);
            // Redireciona para validação
            Response.Redirect(string.Format("http://twitter.com/oauth/authorize?oauth_token={0}", reqToken.Token));
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (System.Web.Security.Membership.ValidateUser(LoginUser.UserName, LoginUser.Password))            
                LoginUser_LoggedIn(sender, e);
        }
        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            if (LoginUser.RememberMeSet)
            {
                // Clear any other tickets that are already in the response
                Response.Cookies.Clear();
                // Set the new expiry date - to thirty days from now
                DateTime expiryDate = DateTime.Now.AddDays(30);
                // Create a new forms auth ticket
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(2, LoginUser.UserName, DateTime.Now, expiryDate, true, String.Empty);
                // Encrypt the ticket
                string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                // Create a new authentication cookie - and set its expiration date
                HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                authenticationCookie.Expires = ticket.Expiration;
                // Add the cookie to the response.
                Response.Cookies.Add(authenticationCookie);
                MySqlMembershipProvider provider = new MySqlMembershipProvider();
                System.Web.Security.MembershipUser user = provider.GetUser(LoginUser.UserName,true );               
                Session.Add("nome", LoginUser.UserName);                
                Session.Add("id_login", LoginUser.UserName);
                Session.Add("contato", user.Email);
                Response.Redirect("../Default.aspx");
            }
        }
    }
}
