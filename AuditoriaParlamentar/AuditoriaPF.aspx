<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="AuditoriaPF.aspx.cs" Inherits="AuditoriaParlamentar.AuditoriaPF"
    ClientIDMode="Static" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(loadAuditoriaPF);
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal fade" id="dvQueProcurar" title="Auditar" style="display: none" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">O que Procurar?</h4>
                </div>
                <div class="modal-body">
                    <p>
                        A primeira coisa que sugerimos é começar a investigar o fornecedor. Em várias fiscalizações que a OPS já realizou, a empresa esteva registrada em endereços que não condiziam com a realidade do local. Um exemplo é a de uma locadora que dizia funcionar aonde, na realidade havia uma padaria. Você pode utilizar o Google Maps ou o Street View (se estiver disponível) para avaliar a localização da empresa. Visite o local, se for possível.
                    </p>
                    <p>
                        Outra sugestão é verificar se a empresa possui uma página na internet e se ela realmente fornece o serviço prestado ao parlamentar. A OPS já encontrou “empresas” que faturavam alguns milhões de reais tendo como clientes apenas políticos. Além disso, estas empresas não possuíam qualquer publicidade na internet ou em outro lugar. Empresas sérias não se escondem e são facilmente localizadas.
                    </p>
                    <p>
                        O foco da OPS não é a empresa prestadora de serviço ou fornecedora de produtos ao parlamentar, mas a nossa experiência nos mostra que muitas vezes empresas fajutas eram abertas apenas para emitirem notas a parlamentares.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#dvQueProcurar">O Que Procurar?</a>
                <asp:Button ID="ButtonPesquisa" runat="server" Text="Pesquisar Pessoa no Google" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonListarDocumentos" runat="server" Text="Solicitar/Listar Documentos" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonListarDeputados" runat="server" Text="Listar Parlamentares" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonDenunciar" runat="server" Text="Denunciar" CssClass="btn btn-success btn-sm" />
                <asp:Button ID="ButtonListarDoacoes" runat="server" Text="Listar Doações Eleitorais" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>
        <asp:Panel ID="PanelExisteDenuncia" runat="server" Visible="False" CssClass="row">
            <div class="col-md-12 text-center">
                <div class="alert alert-warning" runat="server" id="dvDenuncias"></div>
            </div>
            <div class="col-md-12 text-center">
                <asp:GridView ID="GridViewDenuncias" runat="server" CssClass="table table-hover table-striped" GridLines="None"
                    UseAccessibleHeader="true" EmptyDataText="Nenhuma denuncia foi incluída" EmptyDataRowStyle-HorizontalAlign="Center">
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </asp:Panel>
        <hr />
        <div class="row">
            <div class="col-md-12 text-center">
                <h4>Pessoa Fisica</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label class="control-label">CPF</label>
                <asp:Label ID="LabelCNPJ" runat="server" Text="Label" Font-Bold="True" CssClass="show"></asp:Label>
            </div>
            <div class="col-md-6">
                <label class="control-label">Nome</label>
                <asp:Label ID="LabelRazaoSocial" runat="server" Text="Label" CssClass="show"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>


