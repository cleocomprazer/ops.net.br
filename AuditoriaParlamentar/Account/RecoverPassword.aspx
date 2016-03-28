<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="AuditoriaParlamentar.Account.RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <fieldset>
                    <legend>Recuperar Senha</legend>
                    <div class="row" id="dvAlerta" runat="server" visible="false" enableviewstate="false">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="alert alert-success" runat="server" id="dvAlertaMensagem"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Informe o Email ou Usuário"></asp:Label>
                                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server"
                                    ControlToValidate="TextBoxUser" CssClass="small pull-right text-danger" SetFocusOnError="True"
                                    ValidationGroup="ValidationGroup">* Usuário não informado</asp:RequiredFieldValidator>
                                <asp:TextBox ID="TextBoxUser" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:Button ID="ButtonEnviar" runat="server" OnClick="ButtonEnviar_Click"
                                    Text="Recuperar" ValidationGroup="ValidationGroup" CssClass="btn btn-primary" />
                                &nbsp;&nbsp;&nbsp;
                            <a href="#" onclick="history.back();">Voltar</a>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
