<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="PesquisaResultado.aspx.cs" Inherits="AuditoriaParlamentar.PesquisaResultado"
    EnableEventValidation="false" ClientIDMode="Static" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/auditoria.css?v=<%= AuditoriaParlamentar.Classes.Configuracao.VersaoSite %>" rel="stylesheet" />
        <script type="text/javascript">
            $(loadPesquisaResultado);
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="conteudo" class="container-fluid" style="overflow: auto">
        <fieldset>
            <legend runat="server" id="LabelFiltro"></legend>
            <div class="text-center">
                <button class="btn btn-default btn-sm" onclick="__doPostBack('ButtonExportar_Click', '');">Exportar Consulta em CSV</button>
            </div>
            <div id="LabelMaximo" runat="server" class="alert alert-warning" visible="false">
                O resultado está limitado a 1.000 registros para evitar sobrecarga.
            </div>
            <asp:GridView ID="GridViewResultado" runat="server" AllowSorting="True" UseAccessibleHeader="true"
                CssClass="table table-hover table-striped" GridLines="None"
                OnRowDataBound="GridViewResultado_RowDataBound" OnSorting="GridViewResultado_Sorting"
                ShowFooter="True">
                <Columns>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Label ID="LabelTotal" runat="server" Text="Total Geral:"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <a tabindex="0" role="button" class="popover-link btn btn-primary btn-sm" data-valor="<%# Eval("[0]") %>" data-descricao="<%# Eval("[1]") %>">Detalhar</a>
                            <asp:Button ID="ButtonAuditar" runat="server" Text="Auditar" CssClass="btn btn-success btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="cursor-pointer" />
            </asp:GridView>
        </fieldset>
    </div>
    
    <div id="popover_content_wrapper" style="display: none">
        <input type="button" class="btn btn-success btn-sm btn-block" value="Por Fornecedor" />
        <input type="button" class="btn btn-primary btn-sm btn-block" value="Por Parlamentar" />
        <input type="button" class="btn btn-primary btn-sm btn-block" value="Por Despesa" />
        <input type="button" class="btn btn-primary btn-sm btn-block" value="Por Partido" />
        <input type="button" class="btn btn-primary btn-sm btn-block" value="Por UF (Parlamentar)" />
        <input type="button" class="btn btn-primary btn-sm btn-block" value="Por Documento" />
        <input type="button" class="btn btn-default btn-sm btn-block" value="Cancelar" />
    </div>

    <asp:HiddenField ID="HiddenFieldGrupo" runat="server" />
    <asp:HiddenField ID="HiddenFieldAgrupamento" runat="server" />
    <asp:HiddenField ID="HiddenFieldSeparaMes" runat="server" />
    <asp:HiddenField ID="HiddenFieldPeriodo" runat="server" />
    <asp:HiddenField ID="HiddenFieldAnoIni" runat="server" />
    <asp:HiddenField ID="HiddenFieldMesIni" runat="server" />
    <asp:HiddenField ID="HiddenFieldAnoFim" runat="server" />
    <asp:HiddenField ID="HiddenFieldMesFim" runat="server" />
    <asp:HiddenField ID="HiddenFieldParlamentar" runat="server" />
    <asp:HiddenField ID="HiddenFieldDespesa" runat="server" />
    <asp:HiddenField ID="HiddenFieldFornecedor" runat="server" />
    <asp:HiddenField ID="HiddenFieldUF" runat="server" />
    <asp:HiddenField ID="HiddenFieldPartido" runat="server" />
    <asp:HiddenField ID="HiddenFieldDocumento" runat="server" />
    <asp:HiddenField ID="ChavePesquisa" runat="server" />
</asp:Content>
