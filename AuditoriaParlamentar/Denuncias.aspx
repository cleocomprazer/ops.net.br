<%@ Page Title="OPS - Operação Política Supervisionada" Language="C#" MasterPageFile="~/Site.Master"
    CodeBehind="Denuncias.aspx.cs" Inherits="AuditoriaParlamentar.Denuncias"
    AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/auditoria.css?v=<%= Configuracao.VersaoSite %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="container" class="container-fluid" style="position: absolute; width: 100%; top: 61px; padding-bottom: 65px;">
        <iframe id="frame" src="PesquisaAbas.aspx?op=D" frameborder="0" width="100%" height="100%"></iframe>
    </div>
</asp:Content>
