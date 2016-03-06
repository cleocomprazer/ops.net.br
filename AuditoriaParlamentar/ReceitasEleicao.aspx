<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="ReceitasEleicao.aspx.cs" Inherits="AuditoriaParlamentar.ReceitasEleicao" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label">CNPJ/CPF:</label>
                    <span runat="server" id="lblCNPJ" class="control-label show"></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label">Razão Social:</label>
                    <span runat="server" id="lblrazaoSocial" class="control-label show"></span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridViewResultado" runat="server" AllowSorting="false"
                    UseAccessibleHeader="true" OnRowDataBound="GridViewResultado_RowDataBound"
                    CssClass="table table-hover table-striped" GridLines="None" ShowFooter="True"
                    EmptyDataText="Não há doações para exibir!" EmptyDataRowStyle-HorizontalAlign="Center">
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
