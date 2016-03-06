<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"
    CodeBehind="RelParlamentarFornecedor.aspx.cs" Inherits="AuditoriaParlamentar.RelParlamentarFornecedor" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="container" class="container-fluid">
        <h4 class="text-center">Lista de Parlamentares associados com Fornecedores denunciados (denúncia dossiê).</h4>
        <br />
        <asp:GridView ID="GridViewDenuncias" runat="server" AllowSorting="True" UseAccessibleHeader="true" OnRowDataBound="GridViewDenuncias_RowDataBound"
            CssClass="table table-hover table-striped" GridLines="None" ShowFooter="True" OnSorting="GridViewDenuncias_Sorting">
            <RowStyle CssClass="cursor-pointer" />
        </asp:GridView>
    </div>
</asp:Content>
