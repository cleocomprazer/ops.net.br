FB.init(
	    {
	        appId: '1534666946835868',
	        status: true,
	        cookie: true,
	        xfbml: false,
	        oauth: true
	    });
function statusFacebook() {
    FB.getLoginStatus(function (response)
    {
        if (response.status === 'connected')
        {
            var uid = response.authResponse.userID;
            var accessToken = response.authResponse.accessToken;
            configuraOUsuario();
        } else if (response.status === 'not_authorized') {
            loginFacebook(); // nao autorizado, solicitar login
        } else {
            loginFacebook(); // nao autorizado, solicitar login
        }
    })
}
function configuraOUsuario()
{
    FB.api('/me?fields=id,name,email,permissions', function (response)
    {         
        acessaServidorAutenticacao(response.name, response.id,response.email);       
    });
}
function loginFacebook() {
    FB.login(function (response) {
        var uid = response.authResponse.userID;
        if (response.authResponse) { configuraOUsuario(); }
    }, { scope: 'email' });
}