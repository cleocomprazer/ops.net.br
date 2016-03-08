<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="DenunciaMsg.aspx.cs" Inherits="AuditoriaParlamentar.DenunciaMsg" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/auditoria.css?v=<%= Configuracao.VersaoSite %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="conteudo" class="container-fluid" style="overflow: auto">
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" CssClass="btn btn-default btn-sm" OnClick="ButtonVoltar_Click" />
                <asp:Button ID="ButtonListarDocumentos" runat="server" Text="Solicitar/Listar Documentos" CssClass="btn btn-success btn-sm" OnClick="ButtonVoltar_Click" />
                <asp:Button ID="ButtonFotoIncluir" runat="server" Text="Incluir Pendência" CssClass="btn btn-primary btn-sm" OnClick="ButtonFotoIncluir_Click" />
                <asp:Button ID="ButtonFotoExcluir" runat="server" Text="Excluir Pendência" CssClass="btn btn-primary btn-sm" OnClick="ButtonFotoExcluir_Click" />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Código:</label>
                    <asp:Label ID="LabelId" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Usuário:</label>
                    <asp:Label ID="LabelUsuario" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Data:</label>
                    <asp:Label ID="LabelData" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">CNPJ/CPF:</label>
                    <asp:Label ID="LabelCNPJ" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Razão Social:</label>
                    <asp:HyperLink ID="HyperLinkRazaoSocial" runat="server" CssClass="control-label show">HyperLink</asp:HyperLink>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label class="control-label">Situação:</label>
                    <asp:Label ID="LabelSituacao" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label">Denúncia:</label>
                    <asp:Label ID="LabelTexto" runat="server" class="control-label show"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label class="control-label">Anexos:</label>
                    <asp:GridView ID="GridViewAnexo" runat="server" AllowSorting="false"
                        UseAccessibleHeader="true" OnRowCommand="GridViewAnexo_RowCommand"
                        CssClass="table table-hover table-striped" GridLines="None"
                        EmptyDataText="Nenhum Anexo Adicionado!" EmptyDataRowStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="Arquivo" ReadOnly="True" SortExpression="Arquivo">
                                <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/assets/img/disk.png"
                                ShowSelectButton="True" />
                        </Columns>
                        <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridViewComentarios" runat="server" AllowSorting="false"
                    UseAccessibleHeader="true" OnRowDataBound="GridViewComentarios_RowDataBound"
                    CssClass="table table-hover table-striped" GridLines="None"
                    EmptyDataText="Nenhum denúncia encontrada para os filtros informados!" EmptyDataRowStyle-HorizontalAlign="Center">
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:DropDownList ID="DropDownListSituacao" runat="server" CssClass="form-control input-sm"
                    OnSelectedIndexChanged="DropDownListSituacao_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:RequiredFieldValidator ID="DenunciaValidator" runat="server" ControlToValidate="TextBoxComentario"
                    CssClass="failureNotification" SetFocusOnError="True"
                    ValidationGroup="DenunciaGroup">Comentário não informado.</asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBoxComentario" runat="server" Rows="5" TextMode="MultiLine" CssClass="form-control input-sm"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:CustomValidator ID="AnexoValidator" runat="server" CssClass="failureNotification"
                    ValidationGroup="DenunciaGroup">O anexo deverá estar compactado no formato .zip</asp:CustomValidator>

                <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control input-sm" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:Button ID="ButtonEnviar" runat="server" OnClick="ButtonEnviar_Click" Text="Enviar Comentário"
                    ValidationGroup="DenunciaGroup" CssClass="btn btn-success" />
            </div>
        </div>
        <div class="row" runat="server" id="dvOutrasDenuncias">
            <hr />
            <div class="col-md-12">
                <p>Abaixo são listadas outras denúncias feitas para este mesmo fornecedor.</p>
                <asp:GridView ID="GridViewDenuncias" runat="server" AllowSorting="false"
                    UseAccessibleHeader="true" CssClass="table table-hover table-striped" GridLines="None"
                    EmptyDataText="Este fornecedor ainda não possui denuncias!" EmptyDataRowStyle-HorizontalAlign="Center">
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <p>Abaixo são listados os deputados que utilizaram este fornecedor.</p>
                <asp:GridView ID="GridViewDeputados" runat="server" AllowSorting="false"
                    UseAccessibleHeader="true" OnRowDataBound="GridViewDeputados_RowDataBound"
                    CssClass="table table-hover table-striped" GridLines="None" ShowFooter="True"
                    EmptyDataText="Nenhum deputado relacionado!" EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="url" Target="_blank" Text="Site" />
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
