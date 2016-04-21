<%@ Page Title="OPS - Operação Política Supervisionada" Language="C#" MasterPageFile="~/Site.Master"
    CodeBehind="CidadesPendencia.aspx.cs" Inherits="AuditoriaParlamentar.CidadesPendencia"
    AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="<%= ResolveClientUrl("~/") %>assets/js/main.js?v=<%= AuditoriaParlamentar.Classes.Configuracao.VersaoSite %>"></script>
    <script type="text/javascript">
        $(loadCidadesPendencia);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <iframe id="frame" src="PesquisaAbas.aspx?op=C" frameborder="0" width="100%" height="100%"></iframe>
    </div>
</asp:Content>
