
function onSignInCallback(resp) {
    gapi.client.load('plus', 'v1', apiClientLoaded);
}
function apiClientLoaded() {
    gapi.client.plus.people.get({ userId: 'me' }).execute(handleEmailResponse);
}
function handleEmailResponse(resp)
{
    if (resp.id != undefined)
        acessaServidorAutenticacao(resp.displayName, resp.id,resp.emails[0].value);
}
function render()
{
    gapi.signin.render('btnGoogle',
    {
        'callback': 'onSignInCallback',
        'clientid': '491063263785-7le627m8gpon0ppg63mqfr9e5sv7ofup.apps.googleusercontent.com',
        'cookiepolicy': 'single_host_origin',
        'scope': 'email'
    });
}