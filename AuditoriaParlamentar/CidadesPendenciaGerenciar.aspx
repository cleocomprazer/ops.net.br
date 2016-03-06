<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="CidadesPendenciaGerenciar.aspx.cs" Inherits="AuditoriaParlamentar.CidadesPendenciaGerenciar" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <p class="text-center">
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" CssClass="btn btn-success" OnClick="ButtonVoltar_Click" />
        </p>
        <asp:GridView ID="GridViewFornecedores" runat="server" AllowSorting="false"
            UseAccessibleHeader="true" OnRowCommand="GridViewFornecedores_RowCommand"
            CssClass="table table-hover table-striped" GridLines="None" ShowFooter="True"
            EmptyDataText="Nenhuma pendência foi incluída!" EmptyDataRowStyle-HorizontalAlign="Center">
            <Columns>
                <asp:CommandField SelectText="Remover" ShowSelectButton="True" />
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>
</asp:Content>
