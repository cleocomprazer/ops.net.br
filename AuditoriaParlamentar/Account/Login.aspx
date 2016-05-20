<%@ Page Title="OPS - Operação Política Supervisionada" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuditoriaParlamentar.Account.Login" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="../assets/css/loginOAuth.css" rel="stylesheet">    
    <script src="http://connect.facebook.net/en_US/all.js"></script>    
    <script src="../assets/js/loginGoogle.js"></script>
    <script src="https://apis.google.com/js/client:plusone.js?onload=render"></script>    
    <script src="../assets/js/loginFacebook.js"></script>
    <script type="text/javascript">
        function acessaServidorAutenticacao(aNome, aId,email)
        {            
            $.get("../Servicos/servicoAutenticacao.ashx", { nome: aNome, id: aId , contato: email })
            .done(function (data) {
                window.location = '../Default.aspx';
            }).error(function (data) {
                alert('Ocorreu um erro neste tipo de autenticação. Entre em contato com o desenvolvedor');
            });
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $(loadLogin);
    </script>
    <div class="container">
        <div class="row">              
                <div class="omb_login">
    	            <h3 class="omb_authTitle">Escolha um tipo de login abaixo</h3>
		            <div class="row omb_row-sm-offset-3 omb_socialButtons">
    	                <div class="col-xs-4 col-sm-2">                            
		                    <fb:login-button scope="public_profile,email"></fb:login-button>
                            <a href="#" id="btnFacebook" onclick="loginFacebook();" class="btn btn-lg btn-block omb_btn-facebook">
			                    <i class="fa fa-facebook visible-xs"></i>
			                    <span class="hidden-xs">Facebook</span>
		                    </a>
	                    </div>
        	            <div class="col-xs-4 col-sm-2">		                    
                            <asp:button runat="server" ID="btnTwitter" ForeColor="White" 
                                CssClass="btn btn-lg btn-block omb_btn-twitter" Text="Twitter" OnClick="checaStatusTwitter" />
	                    </div>	
        	            <div class="col-xs-4 col-sm-2">
		                    <div id="btnGoogle" class="btn btn-lg btn-block omb_btn-google">
			                    <i class="fa fa-google-plus visible-xs"></i>
			                    <span class="hidden-xs" style="color:whitesmoke">Google</span>
		                    </div>
	                    </div>
                      </div>	
		            </div>

		            <div class="row omb_row-sm-offset-3 omb_loginOr">
			            <div class="col-xs-12 col-sm-6">
				            <hr class="omb_hrOr">				            
			            </div>
		            </div>
		            <!-- fim do login social -->
                    <div class="col-md-6 col-md-offset-3">
                <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false"
                    FailureText="Não foi possível conectar. Verifique se os dados estão corretos."
                    OnLoggedIn="LoginUser_LoggedIn" RememberMeSet="True">
                    <TextBoxStyle CssClass="form-control" />
                    <LoginButtonStyle CssClass="btn btn-lg btn-primary btn-block" />
                    <CheckBoxStyle CssClass="form-control" />
                    <LayoutTemplate>
                        <fieldset class="login">                            
                            <div id="dvFailureText" runat="server" class="alert alert-danger" role="alert" style="display: none;">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><i aria-hidden="true">&times;</i></button>
                                <span>
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="false"></asp:Literal></span>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuário</asp:Label>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            CssClass="small pull-right text-danger" ValidationGroup="LoginUserValidationGroup">* É necessário informar o nome de usuário</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" autofocus="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Senha</asp:Label>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            CssClass="small pull-right text-danger" ValidationGroup="LoginUserValidationGroup">
                                            * É necessário informar a senha</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" CommandName="Login" Text="Entrar"
                                        CssClass="btn btn-lg btn-primary btn-block" ValidationGroup="LoginUserValidationGroup" />                                  
                                 </div>                           
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="checkbox">
                                            <label>
                                                <asp:CheckBox ID="RememberMe" runat="server" />
                                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Mantenha-me conectado</asp:Label>
                                            </label>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>             
                    </LayoutTemplate>
                </asp:Login>
                   <div class="col-md-12">
                       <p><asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false" CssClass="btn btn-info">Crie uma conta caso ainda não tenha.</asp:HyperLink></p>
                       <p><asp:HyperLink ID="RecoverHyperLink" runat="server" EnableViewState="false" NavigateUrl="RecoverPassword.aspx">Esqueceu sua senha?</asp:HyperLink></p>
                   </div>
                </div>      		            	    	
	          </div>               
              
    </div>
</asp:Content>
