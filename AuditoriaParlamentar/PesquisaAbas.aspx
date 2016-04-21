<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="PesquisaAbas.aspx.cs" Inherits="AuditoriaParlamentar.PesquisaAbas"
    ViewStateMode="Disabled" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/auditoria.css?v=<%= AuditoriaParlamentar.Classes.Configuracao.VersaoSite %>" rel="stylesheet" />
    <style type="text/css">
        #dialog label, #dialog input { display: block; }

        #dialog label { margin-top: 0.5em; }

        #dialog input, #dialog textarea { width: 95%; }

        #tabs { margin: 0px; width: 99%; padding: 0px; }

            #tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }

        #add_tab { cursor: pointer; }

        .tab-pane { height: 100%; }
    </style>

    <script type="text/javascript">
        $(loadPesquisaAbas);
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
        <li class="active"><a href="#tabs-1" data-toggle="tab"><%= Titulo%></a></li>
    </ul>
    <br />
    <div id="tab-content" class="tab-content">
        <div class="tab-pane active" id="tabs-1">
            <iframe id="frame" src="<%= Pagina%>" frameborder="0" width="100%" style="height: 100%;"></iframe>
        </div>
    </div>

    <div class="modal fade" id="dialog-message" title="Auditar" style="display: none" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Fornecedor sem CNPJ</h4>
                </div>
                <div class="modal-body">
                    Não será possível auditar este fornecedor porque seu CNPJ/CPF não está disponível.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
