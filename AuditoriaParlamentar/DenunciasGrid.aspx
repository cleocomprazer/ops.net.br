<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="DenunciasGrid.aspx.cs" Inherits="AuditoriaParlamentar.DenunciasGrid" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/auditoria.css?v=<%= Configuracao.VersaoSite %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="conteudo" class="container-fluid" style="overflow: auto">
        <asp:GridView ID="GridViewDenuncias" runat="server" AllowSorting="True" UseAccessibleHeader="true"
            CssClass="table table-hover table-striped" GridLines="None"
            OnRowCommand="GridViewDenuncias_RowCommand" OnRowDataBound="GridViewDenuncias_RowDataBound"
            EmptyDataText="Você não fez nenhuma denúncia." EmptyDataRowStyle-HorizontalAlign="Center">
            <Columns>
                <asp:CommandField SelectText="Detalhes" ShowSelectButton="True" />
                <asp:ImageField DataImageUrlField="nova_msg" DataImageUrlFormatString="~/Figuras/{0}">
                </asp:ImageField>
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>
</asp:Content>
