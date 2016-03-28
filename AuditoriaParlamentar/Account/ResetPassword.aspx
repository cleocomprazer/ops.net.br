<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="AuditoriaParlamentar.Account.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <fieldset>
                    <legend>Redefinir Senha</legend>
                    <div class="row" id="dvAlerta" runat="server" visible="false" enableviewstate="false">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="alert alert-danger" runat="server" id="dvAlertaMensagem"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">Nova senha</asp:Label>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                        CssClass="small pull-right text-danger" ErrorMessage="" ToolTip="É necessário informar a nova senha."
                                        ValidationGroup="vgResetPassword">* Obrigatória</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirmar nova senha</asp:Label>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="small pull-right text-danger" Display="Dynamic" ErrorMessage=""
                                        ToolTip="É necessário informar a confirmação da senha."
                                        ValidationGroup="vgResetPassword">* Obrigatória</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                        CssClass="small pull-right text-danger" Display="Dynamic" ErrorMessage=""
                                        ValidationGroup="vgResetPassword">* A nova senha e a confirmação devem ser iguais.</asp:CompareValidator>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="ButtonEnviar" runat="server" OnClick="ButtonEnviar_Click"
                                Text="Alterar Senha" ValidationGroup="vgResetPassword" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
